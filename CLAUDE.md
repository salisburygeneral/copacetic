# copacetic

An AI software factory prototype for building a personal iPhone app. Each factory stage
is an agent with its own directory under `factory/agents/` and a scheduled workflow in
`.github/workflows/` that runs it. The release is the exception: it is deterministic, so
`release.yml` runs no agent.

**Project preferences go in this file** — conventions, formats, decisions, things to
always or never do. Add them as they come up, with the reason when it isn't obvious, and
keep them short: this file is read in full at the start of every session.

## Working here

- **Write the minimum.** No comments restating what the code says, no rationale in
  config files, no extra files nobody asked for. If a decision needs recording it goes
  in this file as one line, not as a comment at the call site. Record it flatly — don't
  attach caveats to a decision that's already been made.
- **Every agent is one stage of many.** Branches, PR titles, identifiers and layouts are
  inherited by stages that don't exist yet, so keep them generic and don't stamp the
  current agent's name on anything the next one will share.
- **Prototype scale.** One person, a handful of issues at a time. Small limits, no
  batching, no pagination.
- **Let the query do the filtering.** A server-side search beats fetching a list and
  filtering it in the agent.
- **Assume the run dies at the worst moment.** Agents are unattended, so for each step
  work out what the next run sees if it stops there, and make that recoverable.

## Decisions

- **One issue, one branch, one PR, one commit per stage.** An issue gets a single
  `issue/NNN-slug` branch and PR that carries it through every stage, titled after the
  issue. Each agent owns exactly one commit on it and amends that commit in place rather
  than piling on revisions. An agent that finds a commit which isn't its own in the way
  stops rather than rewriting another stage's work.
- **Each agent runs as its own GitHub App.** One app per agent, named after it, installed
  on this repo alone, with its ID and private key in the `<AGENT>_APP_ID` and
  `<AGENT>_APP_PRIVATE_KEY` secrets. The bot login is what separates one agent's comments
  and commits from another's, so nothing is signed and an agent's cutoff for new feedback
  is its own latest comment. The authoring agents hold `contents: write`, the reviewing
  ones `contents: read`.
- **`make test` is the one way to run the tests.** CI and the agents call the same
  target, so a suite that passes for one passes for the other.
- **Acceptance tests are the fixed point.** `Tests/AcceptanceTests/` belongs to
  test-author and encodes the accepted requirements. Every other stage treats it as
  read-only: make the code satisfy the tests, never the tests satisfy the code. Other
  kinds of test go in their own target.
- **Stage labels are the state machine, and mean the stage is done.** An agent's work
  queue is "things missing my label", which makes runs idempotent: an interrupted run
  leaves the label unapplied and gets picked up by the next event or the daily
  `schedule`, which is the net under `dispatch.yml`. An approval can't stand in
  for a label: GitHub can search `reviewed-by:` but not "approved by", and the aggregate
  `review:approved` flips off when a later stage's reviewer blocks.
- **Agents are stateless.** Everything needed to decide what to do next is read from
  GitHub — labels, comment timestamps, authorship. No database, no run history, so a
  lost or repeated run costs nothing.
- **An app token fires workflows, so the factory drives itself.** Every PR an agent
  opens, every commit it pushes and every label it applies triggers `ci.yml` and
  `dispatch.yml`; the token they used before did not.
- **`dispatch.yml` wakes the next stage from an event.** A dispatch carries no payload,
  because an agent reads its whole queue from GitHub — it only says the queue may be
  non-empty. The route comes from the stage labels already on the PR: a new label wakes
  the stage above it, a push wakes the reviewer of the rung under review, and a comment
  wakes whichever side of that rung did not write it — so an author that answers a
  review wakes its reviewer, as the reviewers' own cutoff rule expects.
- **Only a queued run stops a dispatch.** A queued run has not read its queue yet, so
  it will pick up the event's work when it starts. A run in progress may have read past
  it, so it is no evidence that anything will. One review is several events — the
  submission and one per inline comment — and this is what collapses them.
- **A reviewing stage owns no commit.** It asks for every change it wants rather than
  making any itself, so the stage that authored the work keeps the single commit it can
  amend.
- **The app shell holds no logic.** `App/Sources/` is SwiftUI over `Copacetic`
  and nothing else — no target tests it, so every decision it could make belongs in the
  library where the acceptance tests reach it.
- **A reviewing stage gives a verdict.** All three reviewers work alike, the human at
  requirements included: `REQUEST_CHANGES` to ask for changes, `APPROVE` to withdraw that
  block, never `COMMENT`. The reviewer is never the app that opened the PR, so GitHub
  allows both. Acceptance applies the label first and approves second, because the label
  is the state and a run that dies between the two leaves the PR accepted rather than
  stuck.
- **`App/` is the iPhone app and belongs to code-author.** The Xcode app target compiles
  the shell, so `Sources/` holds the library alone and SwiftPM never builds the app.
  `make build` is the one way to build it, as `make test` is the one way to test it.
- **The bundle identifier and the team ID are the secrets `APP_BUNDLE_ID` and
  `APPLE_TEAM_ID`.** The repo is public. `App/project.yml` carries `${BUNDLE_ID}` and
  `${TEAM_ID}` and never a literal.
- **A merge to `main` ships to TestFlight.** The build number is the workflow run number,
  which always rises; TestFlight rejects one it has seen.
- **A human merge triggers the release today.** No agent merges. A merge stage is now
  possible, because an app token would fire `release.yml`.

## Stage labels

- `stage/requirements-authored` — applied by requirements-author to an issue and its PR
- `stage/requirements-accepted` — applied by a human to a PR that reads correctly
- `stage/tests-authored` — applied by test-author to a PR
- `stage/tests-accepted` — applied by test-reviewer to a PR whose tests are right
- `stage/code-authored` — applied by code-author to a PR
- `stage/code-accepted` — applied by code-reviewer to a PR whose code is right

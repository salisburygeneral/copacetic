# copacetic

An AI software factory prototype for building a personal iPhone app. Each factory stage
is an agent with its own directory under `factory/agents/` and a scheduled workflow in
`.github/workflows/` that runs it.

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
- **Agents sign their comments.** Every comment an agent posts ends with
  `<!-- agent: <name> -->`, and an agent's cutoff for new feedback is its own latest
  signed comment. They all run as `github-actions[bot]`, so without the signature no
  agent can tell its own words from another's.
- **`make test` is the one way to run the tests.** CI and the agents call the same
  target, so a suite that passes for one passes for the other.
- **Acceptance tests are the fixed point.** `Tests/AcceptanceTests/` belongs to
  test-author and encodes the accepted requirements. Every other stage treats it as
  read-only: make the code satisfy the tests, never the tests satisfy the code. Other
  kinds of test go in their own target.
- **Stage labels are the state machine, and mean the stage is done.** An agent's work
  queue is "things missing my label", which makes runs idempotent: an interrupted run
  leaves the label unapplied and gets picked up an hour later.
- **Agents are stateless.** Everything needed to decide what to do next is read from
  GitHub — labels, comment timestamps, authorship. No database, no run history, so a
  lost or repeated run costs nothing.
- **Agents act as `github-actions[bot]`.** PRs opened with that token don't fire other
  workflows — the first thing to change if a stage ever needs to be event-triggered.

## Stage labels

- `stage/requirements-authored` — applied by requirements-author to an issue and its PR
- `stage/requirements-accepted` — applied by a human to a PR that reads correctly
- `stage/tests-authored` — applied by test-author to a PR
- `stage/tests-accepted` — applied by test-reviewer to a PR whose tests are right

# Requirements document format

Every document in `requirements/` follows this format exactly. It is the contract
between the requirements-author agent and the humans who review its work: the agent
writes to it, reviewers read against it, and later factory stages consume it.

A requirements document says **what the software must do and how you would know it
does it**. It does not say how to build it. No file names, no frameworks, no schemas,
no API shapes — those belong to the design stage.

Behaviours are written as Given/When/Then, borrowed from BDD. These are prose documents
for people to read, not executable feature files, so the syntax is not strict Gherkin —
but the discipline behind it is the point: one concrete example per behaviour, phrased
so that whether the software does it is a question of fact rather than opinion.

## File name

`requirements/NNN-short-title.md`, where `NNN` is the zero-padded number of the issue
the document came from and `short-title` is a lowercase, hyphenated slug of the issue
title, trimmed to about five words.

Issue #7 "Log a coffee with one tap" becomes `requirements/007-log-a-coffee.md`.

## Template

```markdown
# NNN — Title

**Issue:** salisburygeneral/copacetic#NNN

## Description

One to three paragraphs of prose. What this is, who it is for, and why it is worth
building. Written so that someone who has never seen the issue understands the point
of the change by the end of it.

State what is being asked for, not what you would build. If the issue leaves something
genuinely ambiguous, note the reading you took and why — don't silently pick one.

## Behaviours

### NNN.1 Short imperative name

**Given** some starting state
**And** any further precondition
**When** some trigger happens
**Then** some observable outcome

### NNN.2 Short imperative name

**Given** ...
**When** ...
**Then** ...

## Out of scope

- Things a reader might reasonably expect here that this document deliberately excludes.
- Omit the section entirely if nothing needs excluding.

## Open questions

- Questions whose answers would change the behaviours above, addressed to the issue author.
- Omit the section entirely if there are none.
```

## A worked behaviour

Abstract:

> **Given** the user has logged drinks
> **When** they open the app
> **Then** their history is displayed

Concrete, which is what the format wants:

> **Given** I logged a flat white at 08:14 and a filter at 13:30 today
> **And** nothing yesterday
> **When** I open the app
> **Then** today's two drinks are listed newest first, above an empty row for yesterday

The second version is longer, and it is the one worth having: it is unambiguous, a
reader can tell at a glance whether the built app does it, and writing it forced two
decisions — ordering, and what a day with no drinks looks like — that the abstract
version left for someone to get wrong later.

## Rules for behaviours

- **Numbered `<issue>.1`, `<issue>.2`, … in order, and stable.** Behaviour 2 of issue #5
  is `5.2`, and stays `5.2` for the life of the document — the number is unique across
  the whole project, so later stages can cite a behaviour without naming its document.
  When revising, add `5.7` rather than renumbering.
- **Concrete, with real values.** Name actual times, amounts, and states rather than
  "some data" or "a valid entry". Made-up specifics are fine — the point is that a
  behaviour with real values in it is one somebody can check.
- **One behaviour per outcome.** `And` chains preconditions, so several **Given** lines
  are normal. It does not chain outcomes: if a **Then** needs an "and" for a second
  unrelated result, that is a second behaviour.
- **Observable from outside.** The "Then" must describe something a user or another
  system can see. "The record is saved" is observable; "the record is valid" is not.
- **Intent, not mechanics.** "When I log a coffee" beats "When I tap the + button, then
  tap Flat White, then tap Save". Name what the user is doing, not the taps it takes —
  the taps are the design stage's to choose, and pinning them here makes the document
  wrong the moment the screen changes.
- **Cover the unhappy paths.** Empty input, denied permission, no network, duplicate
  action, and cancellation are behaviours too, not edge cases to mention in passing.
- **No implementation.** If a behaviour can only be satisfied one way, that is a
  property of the problem, not something the document should prescribe.

## Rules for the document as a whole

- Everything traces to the issue. If a behaviour isn't supported by the issue title or
  body, either it belongs under **Open questions** as a proposal, or it doesn't belong.
- Prefer an open question to a guess. A document with three sharp questions is more
  useful than one that quietly invents an answer.
- Keep it short. A typical document is under a page; length comes from the number of
  real behaviours, not from padding.

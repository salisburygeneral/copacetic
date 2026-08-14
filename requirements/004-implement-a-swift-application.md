# 004 — Implement a Swift application

**Issue:** salisburygeneral/copacetic#4

## Description

Issue #4 asks for a Swift application to be built. The issue body is empty; review of the
first draft supplied the rest, and this document is written from those answers.

The application is a hello world for one person: it runs on the issue author's own iPhone,
opens to the text `Hello, world!`, and does nothing else. It is standalone — no account, no
server, nothing fetched from elsewhere — so it works the same whether or not the phone has
a network connection. iPhone on iOS 26 is the only target; iPad, Mac and Apple Watch are
not in scope.

Delivery is part of what is being asked for, not an afterthought: merging to `main` must
put the new build on the author's phone through TestFlight without anyone running a manual
step. That is the smallest version worth having — open the app, see `Hello, world!` — and it
is what the behaviours below describe.

## Behaviours

### 4.1 The application opens on an iPhone

**Given** an iPhone running iOS 26 with the application installed
**And** the application has never been opened on that device
**When** I tap its icon on the Home Screen
**Then** the application opens to a screen of its own within five seconds, rather than
closing itself or showing a system error

### 4.2 The application displays Hello, world!

**Given** the application is installed on my iPhone
**When** I open it
**Then** the text `Hello, world!` is displayed on the first screen, with nothing else to
read, tap or dismiss before it

### 4.3 The application works with no network

**Given** my iPhone is in aeroplane mode with Wi-Fi off
**And** I have never signed in to anything for this application
**When** I open it
**Then** `Hello, world!` is displayed exactly as it is when the phone is online, with no
error, no prompt to connect and no request to sign in

### 4.4 The application still shows the text after being left

**Given** the application is open and showing `Hello, world!`
**And** I switch to another app and use the phone for ten minutes
**When** I return to the application
**Then** `Hello, world!` is displayed again, with no crash and no blank screen

### 4.5 A merge to main lands on my phone

**Given** a pull request that changes the application is merged into `main`
**And** my iPhone has the application installed from TestFlight
**When** the merge completes
**Then** a build of that revision becomes available to me in TestFlight within thirty
minutes, without anyone submitting or releasing it by hand

## Out of scope

- Any feature beyond displaying `Hello, world!` — no settings, no navigation, no second
  screen.
- Distribution to anyone other than the issue author, and release on the App Store.
- iPad, Mac and Apple Watch.
- iOS versions before 26.
- Accounts, servers, and any data that comes from off the device.

# 022 — Implement a "Hello, World!" iPhone app

**Issue:** salisburygeneral/copacetic#22

## Description

This is the first thing the factory builds: an iPhone app that launches and shows the
text "Hello, World!" and nothing else. It exists to prove the app is real — that it
installs on a phone, opens, and puts something on screen — before any feature is asked
of it. The audience is the one person building this project.

The issue asks for two things: that the only thing displayed is "Hello, World!", and
that the app runs on iOS 26. "Runs on iOS 26" is read here as iOS 26 being the oldest
version the app supports, so an iPhone on an earlier version is not a target. The
greeting is taken verbatim from the issue, comma and exclamation mark included.

The app is called "Copacetic" and targets iPhone only; the iPad is not a target.

## Behaviours

### 22.1 Show the greeting on launch

**Given** the app is installed on an iPhone running iOS 26
**And** the app is not currently running
**When** I open the app
**Then** the screen shows the text "Hello, World!"

### 22.2 Show nothing besides the greeting

**Given** the app is open and showing "Hello, World!"
**When** I look at the screen
**Then** "Hello, World!" is the only content on it — no buttons, fields, images, lists
or navigation bars

### 22.3 Keep the greeting when returning to the app

**Given** the app is open and showing "Hello, World!"
**And** I leave it for the Home Screen and use another app for a minute
**When** I return to the app
**Then** the screen still shows "Hello, World!", unchanged

### 22.4 Keep the greeting legible when the phone is rotated

**Given** the app is open in portrait and showing "Hello, World!"
**When** I rotate the iPhone to landscape
**Then** the whole of "Hello, World!" is still on screen and readable, not clipped at
either edge

### 22.5 Show the app's name on the Home Screen

**Given** the app is installed on an iPhone running iOS 26
**When** I look at its icon on the Home Screen
**Then** the label under the icon reads "Copacetic"

## Out of scope

- Any interaction: the app responds to nothing beyond being opened and closed.
- Storing or loading anything, and any use of the network.
- Settings, an about screen, or any second screen.
- Translating the greeting into other languages.
- The iPad, including running the iPhone app on one.

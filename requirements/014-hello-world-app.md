# 014 — Implement a "Hello, World!" Swift application

**Issue:** salisburygeneral/copacetic#14

## Description

The first thing this project builds is a Swift application for iPhone that opens to a
single line of text: `Hello, World!`. It is for the person building the factory rather
than for an end user — its job is to prove that an app can be described, tested, built
and put on a phone, so everything after it has a working path to follow.

Because the app does nothing but display a greeting, the behaviours below are mostly
about what is *not* there: no controls, no navigation, no dependence on the network. The
issue asks for "just the text", and that is taken to mean the greeting is the entire
content of the screen, not a greeting placed alongside a title bar or a placeholder
control.

The app runs on iOS 26 and only on iOS 26; earlier versions are not supported. On the
Home screen it is called Copacetic.

## Behaviours

### 14.1 Show the greeting on opening

**Given** the app is installed on an iPhone running iOS 26
**When** I open it
**Then** the screen displays the text `Hello, World!`

### 14.2 Show nothing besides the greeting

**Given** the app is installed on an iPhone running iOS 26
**When** I open it
**Then** the screen contains no other text, image or control — nothing to tap, and
nowhere to navigate to

### 14.3 Show the greeting again after leaving the app

**Given** the app is open and displaying `Hello, World!`
**And** I switch to another app and leave it there for a minute
**When** I return to the app
**Then** the screen displays `Hello, World!` as before

### 14.4 Show the greeting with no network

**Given** the iPhone is in aeroplane mode with Wi-Fi off
**When** I open the app
**Then** the screen displays `Hello, World!`

### 14.5 Appear on the Home screen as Copacetic

**Given** the app is installed on an iPhone running iOS 26
**When** I look at the Home screen
**Then** its icon is labelled `Copacetic`

## Out of scope

- Any interaction: the app responds to nothing beyond being opened and closed.
- Saved state, accounts, or anything that survives between launches.
- Translating the greeting, or changing it for region or locale.
- iPad, Mac, or any device other than an iPhone.
- Versions of iOS earlier than 26.

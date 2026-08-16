# 007 — Implement a "Hello World" Swift app

**Issue:** salisburygeneral/copacetic#7

## Description

An iPhone app whose only job is to display the text "Hello, World!" on screen. There is
nothing to enter, nothing to tap, and nothing to save: a person who installs it, opens
it, and reads the greeting has seen everything the app does.

It is worth building because it is the first thing this factory produces end to end. Its
value is not the greeting but the proof that an issue can become a running app on a
phone, so the bar it has to clear is that it launches reliably and shows the right words
every time.

The greeting is taken to be exactly `Hello, World!` — the wording, comma, capitals and
exclamation mark as the issue writes them. The issue asks for "a screen", so the app is
read as having one screen and no navigation. It runs on iOS 26, is named `Copacetic`,
and supports portrait only.

## Behaviours

### 7.1 Show the greeting on launch

**Given** the app is installed on an iPhone running iOS 26 and is not running
**When** I open it from the home screen
**Then** a screen appears showing the text `Hello, World!`

### 7.2 Show the greeting without a network

**Given** the iPhone is in aeroplane mode with no Wi-Fi or mobile data
**When** I open the app
**Then** the same screen appears showing `Hello, World!`, with no error and no delay
beyond a normal launch

### 7.3 Keep the greeting on return from the background

**Given** the app is open showing `Hello, World!`
**And** I switch to another app for two minutes
**When** I switch back to it
**Then** the screen still shows `Hello, World!`, unchanged

### 7.4 Do nothing when the greeting is touched

**Given** the app is open showing `Hello, World!`
**When** I tap the text
**Then** the screen is unchanged — nothing opens, nothing moves, and no other screen is
reachable from it

### 7.5 Stay in portrait when the phone is rotated

**Given** the app is open showing `Hello, World!` in portrait
**And** rotation is unlocked on the phone
**When** I turn the phone on its side
**Then** the screen stays in portrait, still showing `Hello, World!`

### 7.6 Appear on the home screen as Copacetic

**Given** the app is installed on an iPhone running iOS 26
**When** I look at the home screen
**Then** its icon is labelled `Copacetic`

## Out of scope

- Any interaction: buttons, input, gestures, navigation, settings.
- Storing or transmitting anything, including analytics.
- Translating or personalising the greeting.
- Distribution through the App Store; installing on a device or simulator is enough.
- Landscape orientation, and iOS versions before 26.

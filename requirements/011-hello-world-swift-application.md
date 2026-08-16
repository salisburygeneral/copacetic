# 011 — Implement a "Hello, World!" Swift application

**Issue:** salisburygeneral/copacetic#11

## Description

Copacetic is a personal iPhone app that does not exist yet. This is its first
increment: an app that can be installed on an iPhone, opened, and seen to work. It
carries no features — its whole purpose is to establish that there is a running app to
add features to.

The app has one screen, and that screen shows the text "Hello, World!" and nothing
else. The issue says "only", so this document reads it strictly: no buttons, no
navigation, no settings, nothing the user can act on. The greeting is taken as the
literal string from the issue, comma and exclamation mark included.

iOS 26 is the minimum version the app runs on, and the app is for iPhone only.

## Behaviours

### 11.1 Show the greeting on launch

**Given** Copacetic is installed on an iPhone running iOS 26
**And** the app has never been opened before
**When** I tap its icon on the Home Screen
**Then** the app opens to a screen showing the text "Hello, World!"

### 11.2 Show nothing besides the greeting

**Given** Copacetic is open
**When** I look at the screen
**Then** "Hello, World!" is the only content on it — no buttons, tabs, navigation bar,
lists, images or text of any other kind

### 11.3 Keep the greeting after returning from the background

**Given** Copacetic is open showing "Hello, World!"
**And** I switch to another app for five minutes
**When** I switch back to Copacetic
**Then** the same screen is shown, still reading "Hello, World!"

### 11.5 Show the app's name on the Home Screen

**Given** the app has been installed on an iPhone
**When** I look at its icon on the Home Screen
**Then** the name under the icon reads "Copacetic"

## Out of scope

- Anything the user can tap, type into or change — the screen is read-only.
- Stored data, accounts and network access of any kind.
- Showing the greeting in any language other than English.
- App icon and launch screen artwork.
- Running on iPad, or on any iOS version earlier than 26.

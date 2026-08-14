# 001 — Implement a Swift application

**Issue:** salisburygeneral/copacetic#1

## Description

The project has no app yet. This asks for the first one: a Swift application that
installs onto an iPhone, launches, and shows a "hello world" greeting. It is for the
one person who will use this app, and its value is that it exists and runs on the real
device — everything the factory builds afterwards lands on top of it.

The issue names no feature beyond the greeting, so this document treats it as a walking
skeleton: proving an app can be built, installed and opened, rather than doing anything
useful yet. The greeting is exactly "Hello, world" and the app is called exactly
"Copacetic"; how it gets onto the phone, and which device it must run on, are left as
open questions rather than invented here.

## Behaviours

### 1.1 Opening the app shows the greeting

**Given** the app is installed on my iPhone
**And** I have never opened it before
**When** I tap its icon on the Home Screen
**Then** a screen showing the text "Hello, world" is displayed

### 1.2 The greeting is shown again on every launch

**Given** the app is open and showing "Hello, world"
**And** I go back to the Home Screen without force-quitting it
**When** I tap its icon again
**Then** the same "Hello, world" screen is displayed

### 1.3 The greeting does not depend on a network

**Given** my iPhone is in Airplane Mode
**When** I open the app
**Then** the "Hello, world" screen is displayed, with no error and no prompt to connect

### 1.4 Nothing is asked of me before the greeting

**Given** the app is installed on my iPhone
**When** I open it for the first time
**Then** the "Hello, world" screen is displayed without asking me to sign in, grant a
permission, or accept anything

### 1.5 The app is called Copacetic on the Home Screen

**Given** the app is installed on my iPhone
**When** I look at the Home Screen
**Then** its icon is labelled "Copacetic"

## Out of scope

- Any feature of the app beyond displaying the greeting — what it is eventually for is
  not described in the issue.
- The look of the greeting screen, and the app's icon artwork.
- Distribution through the App Store or TestFlight.

## Open questions

- Which iPhone and iOS version must it run on? That decides what "installed" means for
  1.1, and whether iPad is in scope at all.
- How does the app get onto the phone — installed directly from a development machine,
  or something the factory publishes? 1.1 assumes it is already installed and says
  nothing about how it got there.

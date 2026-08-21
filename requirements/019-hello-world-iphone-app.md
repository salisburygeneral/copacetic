# 019 — Implement a "Hello, World!" iPhone app

**Issue:** salisburygeneral/copacetic#19

## Description

This is the first thing the project builds: an iPhone app that runs on a real device and
shows a greeting. It exists to prove the path end to end — that there is an app, that it
launches, and that what it displays is what the factory put there — before any feature
worth having is attempted.

The issue asks for a "basic" app and nothing more, so this document describes an app whose
entire visible behaviour is displaying the text `Hello, World!`, and nothing else at all
alongside it. It has no data, no settings, and nothing to tap. The greeting is taken
verbatim from the issue, comma and exclamation mark included.

It must run on iOS 26. Earlier versions of iOS are not a target, so "it launches" is
checked on iOS 26 alone.

## Behaviours

### 19.1 Show the greeting on launch

**Given** the app is installed on my iPhone running iOS 26
**And** I have never opened it before
**When** I launch it
**Then** the text `Hello, World!` is displayed

### 19.2 Show the same greeting on every later launch

**Given** I have opened the app once and closed it
**When** I launch it again
**Then** the text `Hello, World!` is displayed, unchanged from the first launch

### 19.3 Show the greeting while offline

**Given** my iPhone is in aeroplane mode with no Wi-Fi and no mobile data
**When** I launch the app
**Then** the text `Hello, World!` is displayed, with no error and no prompt to connect

### 19.4 Keep the greeting when the app returns from the background

**Given** the app is open and showing `Hello, World!`
**And** I switch to another app for five minutes
**When** I switch back
**Then** the text `Hello, World!` is displayed

### 19.5 Show nothing besides the greeting

**Given** the app is installed on my iPhone running iOS 26
**When** I launch it
**Then** `Hello, World!` is the only text on screen — no app name, no version or build
number, no image, and no other label

## Out of scope

- Any user input, navigation, or second screen — there is nothing to tap.
- Anything on screen that identifies the installed build, such as a version or build number.
- Storing anything on the device or sending anything off it.
- Translating or localising the greeting; it is the literal English string in every region.
- Running on any iOS version before 26.

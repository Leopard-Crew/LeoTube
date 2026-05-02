# Native LeoTube Shell

This document describes the first running native LeoTube application shell.

## Current State

LeoTube builds and starts as a native Cocoa/AppKit application on Mac OS X 10.5.8 Leopard.

The application currently provides:

- a native main window
- a sidebar placeholder
- a search field placeholder
- a results area placeholder
- a details area placeholder

## Implemented Classes

- `LTAppDelegate`
- `LTMainWindowController`

## Explicitly Not Implemented Yet

- no network access
- no Invidious API client
- no video playback
- no WebKit usage
- no local database
- no subscription storage
- no thumbnail cache

## Design Rule

The first shell proves the native Cocoa application body only.

No FreeTube code is used outside `vendor/FreeTube/`.

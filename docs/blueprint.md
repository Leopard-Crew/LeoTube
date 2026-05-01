# LeoTube Blueprint

LeoTube is not a FreeTube port.

FreeTube is used as a functional reference for:

- local subscriptions
- local history
- local playlists / favorites
- privacy-oriented YouTube usage
- optional Invidious backend
- external player support
- distraction-free viewing concepts

LeoTube replaces the technical foundation:

| FreeTube | LeoTube |
|---|---|
| Electron | Cocoa/AppKit |
| Vue | Native AppKit views |
| Node.js shell | Objective-C / Cocoa core |
| modern JS tooling | Xcode 3.1.4 compatible project |
| web-app style UI | Leopard-native UI |
| local extractor first | Invidious API first |
| Shaka/DASH stack | QTKit / external player first |

## First Milestone

LeoTube 0.1 should only prove the native architecture:

- query an Invidious instance
- show search results
- show video details
- show channel details
- store subscriptions locally
- store history locally
- open video URLs in an external player

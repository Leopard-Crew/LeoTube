# LeoTube

LeoTube is a native Cocoa/AppKit YouTube client concept for Mac OS X 10.5.8 Leopard PowerPC.

It uses FreeTube as a functional blueprint, not as a direct technical base.

## Design Rules

- No Electron
- No Vue runtime
- No Node.js application shell
- Cocoa/AppKit first
- WebKit only where HTML rendering is appropriate
- Invidious API first
- Local subscriptions, history, favorites and settings
- SQLite for local storage
- QTKit / QuickTime or external player for playback
- Mac OS X 10.5.8 PowerPC is the primary target

## Repository Layout

- `docs/` contains LeoTube design notes.
- `src/` contains the future native Cocoa application.
- `tools/` contains helper scripts.
- `vendor/FreeTube/` contains the unmodified FreeTube reference source.

## Reference

FreeTube is used as a feature and UX reference only. Code inside `vendor/FreeTube/` must not be modified directly.

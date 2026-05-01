# LeoTube Playback Strategy

Playback is the hardest part of LeoTube.

## V0.1

Use an external player handoff first.

The native app resolves metadata, stores local state and opens a playable URL externally.

## V0.2

Experiment with QTKit / QuickTime playback for simple MP4 streams.

## V0.3+

Investigate helper-based playback for split audio/video streams.

Rules:

- Do not build a browser-player clone.
- Do not embed an Electron-like web runtime.
- Prefer Leopard-native media frameworks where they are sufficient.
- Prefer external player fallback over fragile custom playback code.

# Invidious API Notes

LeoTube starts with the Invidious API.

Rationale:

- YouTube extraction changes frequently.
- FreeTube's local extractor depends on a modern JavaScript/Node ecosystem.
- Leopard PowerPC should not carry a Node/Electron compatibility burden.
- Invidious allows LeoTube to start as a small native Cocoa client.

Initial objects:

- LTInvidiousClient
- LTVideo
- LTChannel
- LTSearchResult
- LTSubscriptionStore
- LTHistoryStore

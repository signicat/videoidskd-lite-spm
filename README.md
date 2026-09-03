# VideoIDLiteSDK

`VideoIDLiteSDK` is the Swift Package Manager distribution for the Lite iOS SDK.

This package intentionally does not declare a WebRTC dependency. It is intended for integrations where another SDK, such as WebID/Ahoy, must be the only WebRTC provider in the final iOS app.

## Installation

In Xcode:

1. Go to `File` > `Add Packages...`.
2. Enter the package URL:

```text
https://github.com/signicat/videoidskd-lite-spm.git
```

3. Add the `VideoIDLiteSDK` product to your app target.

Or add it to `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/signicat/videoidskd-lite-spm.git", from: "<videoid-version>")
]
```

Use the same version as the matching `VideoIDSDK` release.

## Protocol Support

`VideoIDLiteSDK` supports VideoID sessions that can run with Adhoc or Adhoc3. It advertises WebRTC as unavailable and does not include the VideoID WebRTC implementation.

Do not use this package for VideoID processes that require the WebRTC protocol. Use the full `VideoIDSDK` package for those flows.

## Requirements

- iOS 15.1+
- Xcode 16.0 or later
- Swift 5.7+

This SDK is proprietary. Usage is subject to Signicat licensing terms.

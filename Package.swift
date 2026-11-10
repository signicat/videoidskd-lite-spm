// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version: String = "26.44.0-RC"
let urlVersion: String = "26.44.0"
let checksum: String = "14a727e5d49526ee49305f76d80fa37618db45f9fe7107e4a881c7858cd15393"
let catnipVersion = Version(0, 0, 11)

let dependencies: [Target.Dependency] = [
    .product(name: "Catnip", package: "catnip-spm"),
    .product(name: "Lottie", package: "lottie-spm"),
]

let package = Package(
    name: "VideoIDLiteSDK",
    platforms: [.iOS("15.1"),
                .macOS(.v10_15)],
    products: [
        .library(
            name: "VideoIDLiteSDK",
            targets: ["VideoIDLiteSDK", "_VideoIDLiteSDKStub"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/signicat/catnip-spm.git", exact: catnipVersion),
        .package(url: "https://github.com/airbnb/lottie-spm.git", exact: "4.5.2"),
    ],
    targets: [
        .binaryTarget(
            name: "VideoIDLiteSDK",
            url: "https://eid-librerias-ios.s3.eu-west-1.amazonaws.com/VideoID-sdk/\(urlVersion)/VideoIDLiteSDK.xcframework.zip",
            checksum: checksum
        ),
        .target(name: "_VideoIDLiteSDKStub",
                dependencies: dependencies,
                swiftSettings: [
                    .define("PLATFORM_IOS_ONLY", .when(platforms: [.iOS])),
                ]),
    ]
)

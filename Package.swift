// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version: String = "26.36.2-RC"
let urlVersion: String = "26.36.2"
let checksum: String = "26b40746b6556e394411142757e25808fc1cf4059456cfdce9e893fc4b9b983e"
let catnipVersion = Version(0, 0, 10)

let dependencies: [Target.Dependency] = [
    .product(name: "Catnip", package: "catnip-spm"),
    .product(name: "Lottie", package: "lottie-spm"),
    .product(name: "OpenSSL", package: "OpenSSL"),
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
        .package(url: "https://github.com/airbnb/lottie-spm.git", exact: "4.4.3"),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", from: "3.2.2000"),
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

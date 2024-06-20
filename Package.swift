// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let dependencies: [Target.Dependency] = [
    .product(name: "Lottie", package: "lottie-spm"),
    .product(name: "OpenSSL", package: "OpenSSL")
]

let package = Package(
    name: "VideoIDLiteSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "VideoIDLiteSDK",
            targets: ["VideoIDLiteSDK", "_VideoIDSDKStub"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", exact: "4.4.3"),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", from: "3.1.5004"),
    ],
    targets: [
        .binaryTarget(
                    name: "VideoIDLiteSDK",
                    url:"https://eid-librerias-ios.s3.eu-west-1.amazonaws.com/VideoID-sdk/1.21.0/VideoIDLiteSDK.xcframework.zip",
                    checksum: "41afebdab745580795b35c605dc0c5a4259911ae0828f8aa6dd0083f76eb96ff"),
        .target(name: "_VideoIDSDKStub",
               dependencies: dependencies)
    ]
)






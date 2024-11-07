// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let dependencies: [Target.Dependency] = [
    .product(name: "Lottie", package: "lottie-spm"),
    .product(name: "OpenSSL", package: "OpenSSL")
]

let package = Package(
    name: "VideoIDLiteSDK",
    products: [
        .library(
            name: "VideoIDLiteSDK",
            targets: ["VideoIDLiteSDK", "_VideoIDSDKStub"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.1.3"),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", .upToNextMinor(from: "1.1.1700")),
    ],
    targets: [
        .binaryTarget(
                    name: "VideoIDLiteSDK",
                    url:"https://eid-librerias-ios.s3.eu-west-1.amazonaws.com/VideoID-sdk/1.8.0/VideoIDLiteSDK.xcframework.zip",
                    checksum: "c1f92be58cdedc707703a7cf3285cd0a6cc19ee73bfa6cd68e2ee8e6c7538b05"),
        .target(name: "_VideoIDSDKStub",
               dependencies: dependencies)
    ]
)






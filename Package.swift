// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SoundKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SoundKit",
            targets: ["SoundKit"]),
    ],
    targets: [
        .target(
            name: "SoundKit",
            dependencies: [

            ]
        ),
        .testTarget(
            name: "SoundKitTests",
            dependencies: ["SoundKit"]),
    ]
)

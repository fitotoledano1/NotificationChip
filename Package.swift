// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NotificationChip",
    platforms: [.iOS(.v16), .macOS(.v14)],
    products: [
        .library(
            name: "NotificationChip",
            targets: ["NotificationChip"]),
    ],
    targets: [
        .target(
            name: "NotificationChip"),
        .testTarget(
            name: "NotificationChipTests",
            dependencies: ["NotificationChip"]),
    ]
)

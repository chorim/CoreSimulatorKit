// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreSimulatorKit",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "CoreSimulatorKit",
            targets: ["CoreSimulatorKit"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CoreSimulatorKit"),
        .testTarget(
            name: "CoreSimulatorKitTests",
            dependencies: ["CoreSimulatorKit"]),
    ]
)

// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HomeModule",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "HomeModule",
            targets: ["HomeModule"]),
    ],
    dependencies: [
        .package(path: "../CoreModule")
    ],
    targets: [
        .target(
            name: "HomeModule",
            dependencies: [
                .product(name: "CoreModule", package: "CoreModule")
            ]),
        .testTarget(
            name: "HomeModuleTests",
            dependencies: ["HomeModule"]),
    ]
)

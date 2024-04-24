// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "grind75",
    products: [
        .executable(name: "grind75", targets: ["grind75"])
    ],
    targets: [.executableTarget(name: "grind75")]
)

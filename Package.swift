// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Challenges",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "Challenges", targets: ["Challenges"])
    ],
    targets: [
        .executableTarget(name: "Challenges"),
        .testTarget(name: "Challenges-Tests", dependencies: ["Challenges"])
    ]
)

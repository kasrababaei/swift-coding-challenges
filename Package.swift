// swift-tools-version: 6.1

import PackageDescription

let package = Package(
  name: "Challenges",
  platforms: [.macOS(.v15)],
  products: [
    .executable(name: "Challenges", targets: ["Challenges"])
  ],
  targets: [
    .executableTarget(name: "Challenges"),
    .testTarget(name: "Challenges-Tests", dependencies: ["Challenges"])
  ]
)

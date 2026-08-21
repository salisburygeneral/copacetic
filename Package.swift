// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Copacetic",
    platforms: [.macOS(.v13)],
    targets: [
        .target(name: "Copacetic"),
        .testTarget(name: "AcceptanceTests", dependencies: ["Copacetic"]),
    ]
)

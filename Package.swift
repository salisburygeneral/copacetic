// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Copacetic",
    platforms: [.iOS(.v26), .macOS(.v14)],
    targets: [
        .target(name: "Copacetic"),
        .executableTarget(name: "CopaceticApp", dependencies: ["Copacetic"]),
        .testTarget(name: "AcceptanceTests", dependencies: ["Copacetic"]),
    ]
)

// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Copacetic",
    platforms: [.macOS(.v14), .iOS(.v17)],
    products: [
        .library(name: "Copacetic", targets: ["Copacetic"])
    ],
    targets: [
        .target(name: "Copacetic"),
        .testTarget(name: "AcceptanceTests", dependencies: ["Copacetic"])
    ]
)

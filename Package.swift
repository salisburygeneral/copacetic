// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Copacetic",
    targets: [
        .target(name: "Copacetic"),
        .testTarget(name: "CopaceticTests", dependencies: ["Copacetic"]),
    ]
)

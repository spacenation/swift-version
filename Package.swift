// swift-tools-version:6.1
import PackageDescription

let package = Package(
    name: "Version",
    products: [
        .library(name: "Version", targets: ["Version"])
    ],
    targets: [
        .target(name: "Version", dependencies: []),
        .testTarget(name: "VersionTests", dependencies: ["Version"])
    ]
)

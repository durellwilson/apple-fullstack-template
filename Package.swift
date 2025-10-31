// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "AppleFullStackTemplate",
    platforms: [.iOS(.v18), .macOS(.v15), .watchOS(.v11), .tvOS(.v18), .visionOS(.v2)],
    products: [
        .library(name: "AppleFullStackTemplate", targets: ["AppleFullStackTemplate"]),
    ],
    targets: [
        .target(name: "AppleFullStackTemplate"),
    ]
)

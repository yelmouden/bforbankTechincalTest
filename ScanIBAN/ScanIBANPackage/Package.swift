// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScanIBANPackage",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "IBANFeature",
            targets: ["IBANFeature"]),
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
        .library(
            name: "Utils",
            targets: ["Utils"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", branch: "stable"),
        .package(url: "https://github.com/lukepistrol/SwiftLintPlugin", from: "0.2.2"),
        .package(url: "https://github.com/johnpatrickmorgan/FlowStacks", branch: "main"),
        .package(url: "https://github.com/liamnichols/xcstrings-tool-plugin.git", from: "0.1.2"),
        .package(url: "https://github.com/Quick/Nimble", from: "13.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.15.4"),
    ],
    targets: [
        .target(
            name: "DesignSystem",
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin"),
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .target(
            name: "Utils",
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin"),
            ]
        ),
        .testTarget(
            name: "UtilsTests",
            dependencies: [
                "Utils",
                .product(name: "Nimble", package: "Nimble"),
            ]
        ),
        .target(
            name: "IBANFeature",
            dependencies: [
                "DesignSystem",
                "Utils",
                .product(name: "FlowStacks", package: "FlowStacks"),
                .product(name: "XCStringsToolPlugin", package: "xcstrings-tool-plugin"),
            ],
            swiftSettings: [
                .define("XCSTRINGS_TOOL_ACCESS_LEVEL_PUBLIC")
            ], plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        ),
        .testTarget(
            name: "IBANFeatureTests",
            dependencies: [
                "IBANFeature",
                .product(name: "Nimble", package: "Nimble"),
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ]
        ),
    ]
)

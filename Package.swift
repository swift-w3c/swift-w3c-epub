// swift-tools-version: 6.2

import PackageDescription

// MARK: - String Extensions for Module Names

extension String {
    // Core Modules
    static let w3cEPUBShared: Self = "W3C EPUB Shared"
    static let w3cEPUBPublications: Self = "W3C EPUB Publications"
    static let w3cEPUBContentDocuments: Self = "W3C EPUB Content Documents"
    static let w3cEPUBPackageDocument: Self = "W3C EPUB Package Document"
    static let w3cEPUBNavigationDocument: Self = "W3C EPUB Navigation Document"
    static let w3cEPUBFixedLayouts: Self = "W3C EPUB Fixed Layouts"
    static let w3cEPUBOpenContainerFormat: Self = "W3C EPUB Open Container Format"

    // Umbrella
    static let w3cEPUB: Self = "W3C EPUB"

    var tests: Self { "\(self) Tests" }
}

// MARK: - Target Dependency Extensions

extension Target.Dependency {
    static var w3cEPUBShared: Self { .target(name: .w3cEPUBShared) }
    static var w3cEPUBPublications: Self { .target(name: .w3cEPUBPublications) }
    static var w3cEPUBContentDocuments: Self { .target(name: .w3cEPUBContentDocuments) }
    static var w3cEPUBPackageDocument: Self { .target(name: .w3cEPUBPackageDocument) }
    static var w3cEPUBNavigationDocument: Self { .target(name: .w3cEPUBNavigationDocument) }
    static var w3cEPUBFixedLayouts: Self { .target(name: .w3cEPUBFixedLayouts) }
    static var w3cEPUBOpenContainerFormat: Self { .target(name: .w3cEPUBOpenContainerFormat) }
    static var w3cEPUB: Self { .target(name: .w3cEPUB) }
}

// MARK: - Package Definition

// W3C EPUB 3.3 — Electronic Publication Standard
// https://www.w3.org/TR/epub-33/
let package = Package(
    name: "swift-w3c-epub",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        // Individual Modules
        .library(name: "W3C EPUB Shared", targets: ["W3C EPUB Shared"]),
        .library(name: "W3C EPUB Publications", targets: ["W3C EPUB Publications"]),
        .library(name: "W3C EPUB Content Documents", targets: ["W3C EPUB Content Documents"]),
        .library(name: "W3C EPUB Package Document", targets: ["W3C EPUB Package Document"]),
        .library(name: "W3C EPUB Navigation Document", targets: ["W3C EPUB Navigation Document"]),
        .library(name: "W3C EPUB Fixed Layouts", targets: ["W3C EPUB Fixed Layouts"]),
        .library(name: "W3C EPUB Open Container Format", targets: ["W3C EPUB Open Container Format"]),

        // Umbrella
        .library(name: "W3C EPUB", targets: ["W3C EPUB"])
    ],
    dependencies: [
        .package(path: "../../swift-primitives/swift-standard-library-extensions"),
        .package(path: "../swift-bcp-47"),
        .package(path: "../swift-html-standard"),
        .package(path: "../swift-css-standard"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.18.0")
    ],
    targets: [
        // MARK: - Shared

        .target(
            name: "W3C EPUB Shared",
            dependencies: [
                .product(name: "Standard Library Extensions", package: "swift-standard-library-extensions")
            ]
        ),

        // MARK: - Section Modules

        .target(
            name: "W3C EPUB Publications",
            dependencies: [
                .w3cEPUBShared
            ]
        ),

        .target(
            name: "W3C EPUB Content Documents",
            dependencies: [
                .w3cEPUBShared,
                .w3cEPUBPublications,
                .product(name: "HTML Standard", package: "swift-html-standard")
            ]
        ),

        .target(
            name: "W3C EPUB Package Document",
            dependencies: [
                .w3cEPUBShared,
                .w3cEPUBPublications,
                .product(name: "BCP 47", package: "swift-bcp-47")
            ]
        ),

        .target(
            name: "W3C EPUB Navigation Document",
            dependencies: [
                .w3cEPUBShared,
                .w3cEPUBContentDocuments
            ]
        ),

        .target(
            name: "W3C EPUB Fixed Layouts",
            dependencies: [
                .w3cEPUBShared,
                .w3cEPUBPackageDocument,
                .product(name: "CSS Standard", package: "swift-css-standard")
            ]
        ),

        .target(
            name: "W3C EPUB Open Container Format",
            dependencies: [
                .w3cEPUBShared,
                .w3cEPUBPackageDocument
            ]
        ),

        // MARK: - Umbrella

        .target(
            name: "W3C EPUB",
            dependencies: [
                .w3cEPUBShared,
                .w3cEPUBPublications,
                .w3cEPUBContentDocuments,
                .w3cEPUBPackageDocument,
                .w3cEPUBNavigationDocument,
                .w3cEPUBFixedLayouts,
                .w3cEPUBOpenContainerFormat
            ]
        ),

        // MARK: - Tests
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableExperimentalFeature("SuppressedAssociatedTypesWithDefaults"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}

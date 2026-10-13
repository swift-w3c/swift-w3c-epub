// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-w3c-epub",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [

        .library(name: "W3C EPUB Shared", targets: ["W3C EPUB Shared"]),
        .library(name: "W3C EPUB Publications", targets: ["W3C EPUB Publications"]),
        .library(name: "W3C EPUB Content Documents", targets: ["W3C EPUB Content Documents"]),
        .library(name: "W3C EPUB Package Document", targets: ["W3C EPUB Package Document"]),
        .library(name: "W3C EPUB Navigation Document", targets: ["W3C EPUB Navigation Document"]),
        .library(name: "W3C EPUB Fixed Layouts", targets: ["W3C EPUB Fixed Layouts"]),
        .library(
            name: "W3C EPUB Open Container Format",
            targets: ["W3C EPUB Open Container Format"]
        ),

        .library(name: "W3C EPUB", targets: ["W3C EPUB"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-standard-library-extensions.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-ietf/swift-bcp-47.git", branch: "main"),
        .package(url: "https://github.com/swift-standards/swift-html-standard.git", branch: "main"),
        .package(url: "https://github.com/swift-standards/swift-css-standard.git", branch: "main"),

    ],
    targets: [

        .target(
            name: "W3C EPUB Shared",
            dependencies: [
                .product(
                    name: "Standard Library Extensions",
                    package: "swift-standard-library-extensions"
                )
            ]
        ),

        .target(
            name: "W3C EPUB Publications",
            dependencies: [
                .target(name: "W3C EPUB Shared")
            ]
        ),

        .target(
            name: "W3C EPUB Content Documents",
            dependencies: [
                .target(name: "W3C EPUB Shared"),
                .target(name: "W3C EPUB Publications"),
                .product(name: "HTML Standard", package: "swift-html-standard"),
            ]
        ),

        .target(
            name: "W3C EPUB Package Document",
            dependencies: [
                .target(name: "W3C EPUB Shared"),
                .target(name: "W3C EPUB Publications"),
                .product(name: "BCP 47", package: "swift-bcp-47"),
            ]
        ),

        .target(
            name: "W3C EPUB Navigation Document",
            dependencies: [
                .target(name: "W3C EPUB Shared"),
                .target(name: "W3C EPUB Content Documents"),
            ]
        ),

        .target(
            name: "W3C EPUB Fixed Layouts",
            dependencies: [
                .target(name: "W3C EPUB Shared"),
                .target(name: "W3C EPUB Package Document"),
                .product(name: "CSS Standard", package: "swift-css-standard"),
            ]
        ),

        .target(
            name: "W3C EPUB Open Container Format",
            dependencies: [
                .target(name: "W3C EPUB Shared"),
                .target(name: "W3C EPUB Package Document"),
            ]
        ),

        .target(
            name: "W3C EPUB",
            dependencies: [
                .target(name: "W3C EPUB Shared"),
                .target(name: "W3C EPUB Publications"),
                .target(name: "W3C EPUB Content Documents"),
                .target(name: "W3C EPUB Package Document"),
                .target(name: "W3C EPUB Navigation Document"),
                .target(name: "W3C EPUB Fixed Layouts"),
                .target(name: "W3C EPUB Open Container Format"),
            ]
        ),

        .testTarget(
            name: "W3C EPUB Tests",
            dependencies: [
                .target(name: "W3C EPUB Shared"),
                .target(name: "W3C EPUB Package Document"),
                .target(name: "W3C EPUB Navigation Document"),
                .target(name: "W3C EPUB Fixed Layouts"),
                .target(name: "W3C EPUB Open Container Format"),
                .product(name: "BCP 47", package: "swift-bcp-47"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}

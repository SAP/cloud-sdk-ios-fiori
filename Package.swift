// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "FioriSwiftUI",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .watchOS(.v7), .visionOS(.v1)],
    products: [
        .library(
            name: "FioriSwiftUI",
            type: .dynamic,
            targets: ["FioriSwiftUI"]
        ),
        .library(
            name: "FioriCharts",
            type: .dynamic,
            targets: ["FioriCharts"]
        ),
        .library(
            name: "FioriThemeManager",
            type: .dynamic,
            targets: ["FioriThemeManager"]
        )
    ],
    targets: [
        .target(
            name: "FioriSwiftUI",
            dependencies: [.target(name: "FioriSwiftUICore", condition: .when(platforms: [.iOS, .macCatalyst, .visionOS]))]
        ),
        .target(
            name: "FioriCharts",
            dependencies: ["FioriThemeManager"],
            exclude: ["TestCases/SF_EnergyBenchmarking.csv"]
        ),
        .target(
            name: "FioriSwiftUICore",
            dependencies: [
                .target(name: "FioriThemeManager", condition: .when(platforms: [.iOS, .macCatalyst, .visionOS])),
                .target(name: "FioriCharts", condition: .when(platforms: [.iOS, .macCatalyst, .visionOS]))
            ],
            resources: [.process("_localization")]
        ),
        .target(
            name: "FioriThemeManager",
            resources: [
                .process("72-Fonts/Resources"),
                .process("FioriIcons/Resources/FioriIcon.xcassets")
            ]
        ),
        .testTarget(
            name: "FioriThemeManagerTests",
            dependencies: ["FioriThemeManager"],
            path: "Tests/FioriSwiftUITests/FioriThemeManager",
            resources: [
                .process("TestResources")
            ]
        ),
        .testTarget(
            name: "FioriChartsTests",
            dependencies: ["FioriCharts"],
            path: "Tests/FioriSwiftUITests/FioriCharts"
        ),
        .testTarget(
            name: "FioriSwiftUICoreTests",
            dependencies: ["FioriSwiftUICore"],
            path: "Tests/FioriSwiftUITests/FioriSwiftUICore"
        )
    ]
)

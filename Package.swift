// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FioriSwiftUI",
    defaultLocalization: "en",
    platforms: [.iOS(.v15), .watchOS(.v7)],
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
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        .target(
            name: "FioriSwiftUI",
            dependencies: [.target(name: "FioriSwiftUICore", condition: .when(platforms: [.iOS]))]
        ),
        .target(
            name: "FioriCharts",
            dependencies: ["FioriThemeManager"],
            exclude: ["TestCases/SF_EnergyBenchmarking.csv"]
        ),
        .target(
            name: "FioriSwiftUICore",
            dependencies: [
                .target(name: "FioriThemeManager", condition: .when(platforms: [.iOS])),
                .target(name: "FioriCharts", condition: .when(platforms: [.iOS]))
            ],
            resources: [.process("FioriSwiftUICore.strings")]
        ),
        .target(
            name: "FioriThemeManager",
            dependencies: [],
            resources: [
                .process("72-Fonts/Resources")
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

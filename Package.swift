// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FioriSwiftUI",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
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
            dependencies: ["FioriSwiftUICore"]
        ),
        .target(
            name: "FioriCharts",
            dependencies: ["FioriThemeManager"],
            exclude: ["TestCases/SF_EnergyBenchmarking.csv"]
        ),
        .target(
            name: "FioriSwiftUICore",
            dependencies: ["FioriThemeManager", "FioriCharts"],
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
            name: "FioriSwiftUITests",
            dependencies: ["FioriSwiftUI"],
            resources: [
                .process("FioriThemeManager/TestResources")
            ]
        )
    ]
)

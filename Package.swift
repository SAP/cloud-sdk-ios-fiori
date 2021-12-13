// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FioriSwiftUI",
    defaultLocalization: "en",
    platforms: [.iOS(.v14)],
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
            name: "FioriIntegrationCards",
            type: .dynamic,
            targets: ["FioriIntegrationCards"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Flight-School/AnyCodable.git", from: "0.2.3"),
        .package(name: "ObservableArray", url: "https://github.com/sstadelman/observable-array.git", from: "1.2.0"),
        .package(url: "https://github.com/MarcoEidinger/Zip.git", .upToNextMinor(from: "2.1.2"))
    ],
    targets: [
        .target(
            name: "FioriSwiftUI",
            dependencies: ["FioriSwiftUICore", "FioriIntegrationCards"]
        ),
        .target(
            name: "FioriIntegrationCards",
            dependencies: ["AnyCodable", "ObservableArray", "FioriCharts", "Zip", "FioriThemeManager"]
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
            dependencies: ["FioriSwiftUI"]
        )
    ]
)

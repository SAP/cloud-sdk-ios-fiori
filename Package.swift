// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FioriSwiftUI",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FioriSwiftUI",
            type: .dynamic,
            targets: ["FioriSwiftUI"]),
        .library(
            name: "FioriCharts",
            type: .dynamic,
            targets: ["FioriCharts"]),
        .library(
            name: "FioriIntegrationCards",
            type: .dynamic,
            targets: ["FioriIntegrationCards"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/objcio/tiny-networking", from: "0.2.0"),
        .package(url: "https://github.com/Flight-School/AnyCodable.git", from: "0.2.3"),
        .package(url: "https://github.com/sstadelman/observable-array.git", from: "1.1.0"),
        .package(url: "https://github.com/marmelroy/Zip.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "FioriSwiftUI",
            dependencies: ["FioriIntegrationCards"]),
        .target(
            name: "FioriIntegrationCards",
            dependencies: ["AnyCodable", "TinyNetworking", "ObservableArray", "FioriCharts", "Zip"]),
        .target(
            name: "FioriCharts",
            dependencies: ["FioriSwiftUICore"]),
        .target(
            name: "FioriSwiftUICore",
            dependencies: []),
        .testTarget(
            name: "FioriSwiftUITests",
            dependencies: ["FioriSwiftUI"]),
    ]
)

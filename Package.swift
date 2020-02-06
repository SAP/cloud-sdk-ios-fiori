// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FioriSwiftUI",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "FioriSwiftUI",
            type: .dynamic,
            targets: ["FioriSwiftUI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "git@github.com:objcio/tiny-networking.git", from: "0.2.0"),
        .package(url: "git@github.com:Flight-School/AnyCodable.git", from: "0.2.3"),
        .package(url: "git@github.com:sstadelman/observable-array.git", .branch("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "FioriSwiftUI",
            dependencies: ["IntegrationCards", "Charts"]),
        .target(
            name: "IntegrationCards",
            dependencies: ["AnyCodable", "TinyNetworking", "ObservableArray"]),
        .target(
            name: "Charts",
            dependencies: [],
            exclude: ["TestCases"]),
        .testTarget(
            name: "FioriSwiftUITests",
            dependencies: ["FioriSwiftUI"]),
    ]
)

// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cloud_sdk_ios_sourcery_utils",
    platforms: [.macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "cloud_sdk_ios_sourcery_utils",
            type: .dynamic,
            targets: ["utils"]),
    ],
    dependencies: [
        .package(name: "Sourcery", url: "https://github.com/krzysztofzablocki/Sourcery.git", .exact("1.0.2")),
        /// **NOTICE**: this Package is set up *just* to link against `SourceryRuntime` during dev/test.  During template generation, `SourceryRuntime`
        /// is injected by the sourcery tool.  But, *no other dependencies* will be linked.  So, it does not make sense to introduce additional
        /// dependencies to this package.  If you want to rely on functionality provided by another package (e.g. `swift-algorithms`), copy those files
        /// into a directory in this project.
    ],
    targets: [
        .target(
            name: "utils",
            dependencies: [.product(name: "SourceryRuntime", package: "Sourcery")]),
        .testTarget(
            name: "utilsTests",
            dependencies: ["utils"])
    ]
)

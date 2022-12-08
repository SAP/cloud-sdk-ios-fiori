// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FioriSwiftUI",
    defaultLocalization: "en",
    platforms: [.iOS(.v14), .watchOS(.v7)],
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
            name: "FioriChartsTarget",
            dependencies: [.target(name: "FioriCharts", condition: .when(platforms: [.iOS]))],
            path: "SwiftPM-PlatformExclude/FioriChartsWrap"
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
            name: "FioriSwiftUITests",
            dependencies: [
                .target(name: "FioriSwiftUI", condition: .when(platforms: [.iOS]))
            ],
            exclude: ["FioriThemeManager"],
            resources: [
                .process("FioriThemeManager/TestResources")
            ]
        )
    ]
)

//// swift-tools-version:5.3
//// The swift-tools-version declares the minimum version of Swift required to build this package.
//
//import PackageDescription
//

//
//var platformSpecificTargets: [PackageDescription.Target] {
//    var targets: [PackageDescription.Target] = []
//    targets.append(
//        .target(
//            name: "FioriThemeManager",
//            dependencies: [],
//            resources: [
//                .process("72-Fonts/Resources")
//            ]
//        )
//    )
//    targets.append(
//        .testTarget(
//            name: "FioriThemeManagerTests",
//            dependencies: ["FioriThemeManager"],
//            path: "Tests/FioriSwiftUITests/FioriThemeManager",
//            resources: [
//                .process("TestResources")
//            ]
//        )
//    )
//
//    var meep: Target.Dependency = .target(name: "", condition: .when(.))
////    var moduleForFioriSwiftUI: String = "FioriThemeManager"
////#if os(iOS)
////    moduleForFioriSwiftUI = "FioriSwiftUICore"
////    #endif
//    targets.append(
//        .target(
//            name: "FioriSwiftUI",
//            dependencies: ["FioriSwiftUICore"]
//        ),
//    )
//
//    #if os(iOS)
//        targets.append(contentsOf: [
//            .target(
//                name: "FioriCharts",
//                dependencies: ["FioriThemeManager"],
//                exclude: ["TestCases/SF_EnergyBenchmarking.csv"]
//            ),
//            .target(
//                name: "FioriSwiftUICore",
//                dependencies: ["FioriThemeManager", "FioriCharts"],
//                resources: [.process("FioriSwiftUICore.strings")]
//            ),
//            .testTarget(
//                name: "FioriSwiftUITests",
//                dependencies: ["FioriSwiftUI"],
//                exclude: ["FioriThemeManager"],
//                resources: [
//                    .process("FioriThemeManager/TestResources")
//                ]
//            )
//        ])
//    #endif
//
//    return targets
//}
//
//let package = Package(
//    name: "FioriSwiftUI",
//    defaultLocalization: "en",
//    platforms: [.iOS(.v14), .watchOS(.v7)],
//    products: platformSpecificProducts,
//    dependencies: [
//        // Dependencies declare other packages that this package depends on.
//    ],
//    targets: platformSpecificTargets
//)

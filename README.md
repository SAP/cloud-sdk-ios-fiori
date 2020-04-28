# cloud-sdk-ios-fiori

![](https://github.com/SAP/cloud-sdk-ios-fiori/workflows/CI/badge.svg)
![](https://github.com/SAP/cloud-sdk-ios-fiori/workflows/SwiftLint/badge.svg)

SwiftUI implementation of SAP Fiori for iOS Design Language.

![](https://github.com/SAP/cloud-sdk-ios-fiori/blob/images/Resources/Images/Team.png?raw=true)

## Description
This project is the SwiftUI implementation of the SAP Fiori for iOS Design Language, and is meant to augment and in some cases replace the UIKit-based implementation contained in the **SAPFiori** framework of the SAP Cloud Platform SDK for iOS.  

> This project is in development, and should not yet be used productively.

This project currently contains two modules:  **FioriCharts** and **FioriIntegrationCards**.

### FioriCharts
The FioriCharts module is planned to replace the *RoambiChartKit* charting library which was already embedded in SAPFiori.  Migrating to SwiftUI gives the ability to easily add new chart components (donut, bullet, stocks, etc.) while modernizing the existing supported charts with pinch-to-zoom, pan, and new design features.

| | SAPFiori 4.0.x, 5.0.x  | FioriCharts |
| - | --------- | - |
| Area | x | x |
| Line | x | x |
| Column | x | x |
| Stacked Column | x | planned |
| Bar | x | planned |
| Stacked Bar | not planned | planned |
| Bubble | x | planned |
| Waterfall | x | planned |
| Combo | x | planned |
| Donut | not planned | x |
| Bullet | not planned | planned |
| Stacked Bullet | not planned | planned |
| Harvey Ball | not planned | x |
| Radial | not planned | x |
| Stocks (line) | not planned | x |

The API is designed for backwards compatibility to the existing SAPFiori charting APIs, but is optimized for SwiftUI.

Upcoming releases of SAPFiori will dynamically link to FioriCharts framework; applications linking SAPFiori should include this package as a dependency.

### Fiori Integration Cards
The FioriIntegrationCards module is a native SwiftUI renderer for the [UI5 Integration Cards](https://openui5.hana.ondemand.com/test-resources/sap/ui/integration/demokit/cardExplorer/index.html).  These types of cards are common in UI5 dashboard and overview page user contexts.  In native iOS apps, we are focusing initially on the dashboard use case, and also considering Cards as ideal for Annotation-style views--in maps, or AR experiences.  

| | FioriIntegrationCards |
| - | - |
| Object Card | x | 
| List Card | x | 
| Timeline Card | x | 
| Analytic Card | x | 
| Table Card | x | 
| Calendar Card | planned |
| Adaptive Card | tbd |
| Component Card | not currently planned |


## Requirements

- iOS 13 or higher, macOS 10.15.4 or higher
- Xcode 11.4 or higher
- Swift Package Manager

## Download and Installation

The package is intended for consumption via Swift Package Manager.  

 - To add to your application target, navigate to the `Project Settings > Swift Packages` tab, then add the repository URL.
 - To add to your framework target, add the repository URL to your **Package.swift** manifest.

In both cases, **xcodebuild** tooling will manage cloning and updating the repository to your app or framework project.

## Configuration

At present, only one product **FioriSwiftUI** is exposed by the `Package.swift` manifest.

## Limitations

Both modules are currently in development, and should not yet be used productively.  API's may change before release.

Several functional limitations exist at present, which are planned for resolution before initial release.  Please check the Issues tab for an up-to-date view of the backlog and issue status.

Key gaps which are present at time of open-source project launch:

 - **FioriIntegrationCards** networking must be refactored to eliminate dependency on **TinyNetworking**, and support injection of `SAPURLSession` http client
 - **FioriIntegrationCards** currently handles only data which is in-line json; must be augmented to support resolving relative data files, and remote URIs
 - **FioriIntegrationCards** and **FioriCharts** requires design specifications to improve UI
 - **FioriCharts** must support point and range selection, equivalent to the current implementation in **SAPFiori**.
 - **FioriIntegrationCards** and **FioriCharts** must support theming with **NUI** nss stylesheets, as currently supported by **SAPFiori**. 

## Known Issues

See **Limitations**.

## How to obtain support

Support for the modules is provided thorough this open-source repository.  Please file Github Issues for any issues experienced, or questions.  

When **SAPFiori** integrates **FioriCharts** productively, customers should continue to report issues through OSS for SLA tracking.  However, developers may also report chart-related issues directly into the Github Issues; SAP will mirror **FioriCharts**-related issues reported through OSS into Github Issues.

## Contributing

If you want to contribute, please check the [Contribution Guidelines](./CONTRIBUTING.md)

## To-Do (upcoming changes)

See **Limitations**.

## Project setup
To work with test apps, you must generate the xcodeproj file for the packages.  

From the root of the repo:  `swift package generate-xcodeproj`.  

Then use `/Apps/Apps.xcworkspace`.

> If adding files to the project, or refactoring, keep in mind that the generated xcodeproj is **_not_** committed in the repository; Swift Package Manager uses the `Sources/` directory structure to derive the generated xcodeproj targets, groups, and dependencies.

## License

Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved.
This file is licensed under the Apache-2.0 license except as noted otherwise in the [LICENSE](/LICENSE) and [NOTICE](/NOTICE) files.

<p align="center">
  <img width=50% src="https://github.com/SAP/cloud-sdk-ios-fiori/blob/images/Resources/Images/Team.png" alt="Logo" />
  </br>
  <span><b>SwiftUI implementation of the SAP Fiori for iOS Design Language</b></span>
</p>

***

<div align="center">

[Installation](#download-and-installation)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Examples](#examples)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[API Documentation](https://sap.github.io/cloud-sdk-ios-fiori)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Changelog](https://github.com/SAP/cloud-sdk-ios-fiori/blob/main/CHANGELOG.md)

***

[![Build and Test Status Check](https://github.com/SAP/cloud-sdk-ios-fiori/workflows/CI/badge.svg)](https://github.com/SAP/cloud-sdk-ios-fiori/actions?query=workflow%3A%22CI%22)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=SAP_cloud-sdk-ios-fiori&metric=sqale_rating)](https://sonarcloud.io/summary/new_code?id=SAP_cloud-sdk-ios-fiori)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/3962/badge?latest)](https://bestpractices.coreinfrastructure.org/projects/3962)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)
[![REUSE status](https://api.reuse.software/badge/github.com/SAP/cloud-sdk-ios-fiori)](https://api.reuse.software/info/github.com/SAP/cloud-sdk-ios-fiori)

</div>

***

This project is the SwiftUI implementation of the [SAP Fiori for iOS Design Language](https://experience.sap.com/fiori-design-ios/), and is meant to augment and in some cases replace the UIKit-based implementation contained in the SAPFiori framework of the [SAP BTP SDK for iOS](https://developers.sap.com/topics/sap-btp-sdk-for-ios.html).

<p align="center">
<img src="https://user-images.githubusercontent.com/4176826/85931303-3ac81980-b878-11ea-8e7f-9b10ed380f2d.gif" alt="alt text" width="300" height="500" align="center">
</p>

This project currently contains three modules: `FioriThemeManager`, `FioriSwiftUICore`, and `FioriCharts`.

## FioriThemeManager
![FioriThemeManager platform support: iOS and watchOS](https://img.shields.io/badge/platform-ios%20%7C%20watchos-lightgray)

This module provides a [color palette](https://experience.sap.com/fiori-design-ios/article/colors/) and a new font family [SAP 72](https://experience.sap.com/72/) that conform to [Fiori Design Language](https://experience.sap.com/fiori-design-ios/). It is adopted by all the Fiori components in both this package and SAPFiori.

All Fiori Colors are dynamic colors, which means they will adjust based on iOS Appearance settings (Light/Dark). Accessing Fiori Color using `Color.preferredFioriColor(forStyle:)`.

72 is a SAP patent typeface that delivers great reading experience to our users. You can get these fonts using `Font.fiori(forTextStyle:)` or `Font.fioriCondensed(forTextStyle:)`. Note that these fonts support Dynamic Type out of the box. If you want the fonts with fixed size, use `Font.fiori(fixedSize:)` or `Font.fioriCondensed(fixedSize:)` instead.

> Custom fonts need to be loaded and registered during App's runtime. Make sure you call `Font.registerFioriFonts()` inside `application(_:didFinishLaunchingWithOptions:)` of your `AppDelegate`.

## FioriSwiftUICore
![FioriSwiftUICore platform support: iOS only](https://img.shields.io/badge/platform-ios-lightgray)

This module contains SwiftUI implementation for those UIKit-based components existing in [SAPFiori](https://help.sap.com/doc/978e4f6c968c4cc5a30f9d324aa4b1d7/Latest/en-US/Documents/Frameworks/SAPFiori/index.html). It provides you with an easy way to migrate your UIKit project to SwiftUI while delivering the same experience as before.

We plan to progressively bring more Fiori UI components into this module in the future releases. Check the table below for the components that are currectly available and those in the roadmap.

> Refer to this [document](./GeneratedComponentConcepts.md) for different ways of initializing the component.

| | FioriSwiftUICore |
| - | - |
| ObjectItem | :white_check_mark: | 
| ObjectHeader | :white_check_mark: | 
| KPIItem | :white_check_mark: | 
| FioriButton | :white_check_mark: |
| ListPickerItem | :white_check_mark: |
| DimensionSelector | :white_check_mark: |
| SideBar | :white_check_mark: |
| DataTable | :white_check_mark: |
| WelcomeScreen | :white_check_mark: |
| ActivationScreen | :white_check_mark: |
| InfoView | :white_check_mark: |
| User Consent Form | :white_check_mark: |
| KPIProgressItem | :white_check_mark: | 
| EULAView | :white_check_mark: |
| ContactItem | :white_check_mark: | 
| KPIHeader | :white_check_mark: |
| KeyValueItem | :x: |
| TimelineItem | :x: |
| TimelinePreviewItem | :x: |
| ChartFloorplan | :x: |
| ProfileHeader | :x: |
| CollectionItem | :x: |
| BarcodeScanner | :x: |
| PasscodeView | :x: |
| MultiUserPasscodeView | :x: |
| TouchIDErrorView | :x: |

## FioriCharts
![FioriCharts platform support: iOS only](https://img.shields.io/badge/platform-ios-lightgray)

The FioriCharts module replaces the *RoambiChartKit* charting library which was already embedded in SAPFiori. Migrating to SwiftUI gives the ability to easily add new chart components (donut, bullet, stocks, etc.) while modernizing the existing supported charts with pinch-to-zoom, pan, and new design features.

| | SAPFiori 4.0.x, 5.0.x  | FioriCharts |
| - | --------- | - |
| Area | :white_check_mark: | :white_check_mark: |
| Line | :white_check_mark: | :white_check_mark: |
| Column | :white_check_mark: | :white_check_mark: |
| Stacked Column | :white_check_mark: | :white_check_mark: |
| Bar | :white_check_mark: | :white_check_mark: |
| Stacked Bar | :x: | :white_check_mark: |
| Bubble | :white_check_mark: | :white_check_mark: |
| Scatter | :white_check_mark: | :white_check_mark: |
| Waterfall | :white_check_mark: | :white_check_mark: |
| Combo | :white_check_mark: | :white_check_mark: |
| Donut | :x: | :white_check_mark: |
| Bullet | :x: | :white_check_mark: |
| Stacked Bullet | :x: | :soon: |
| Harvey Ball | :x: | :white_check_mark: |
| Radial | :x: | :white_check_mark: |
| Stocks (line) | :x: | :white_check_mark: |

The API is designed for backwards compatibility to the existing SAPFiori charting APIs, but is optimized for SwiftUI.

[API Reference](https://sap.github.io/cloud-sdk-ios-fiori/charts/index.html)

## Requirements

- iOS 15 or higher
- Xcode 14 or higher
- Swift Package Manager 

## Download and Installation

The package is intended for consumption via Swift Package Manager.  

 - To add to your application target, navigate to the `File > Swift Packages > Add Package Dependency...` tab, then add the repository URL.
 - To add to your framework target, add the repository URL to your **Package.swift** manifest.

In both cases, **xcodebuild** tooling will manage cloning and updating the repository to your app or framework project.

## Configuration

Three products are exposed by the `Package.swift` manifest.

**FioriSwiftUI** as umbrella product will contain everything the package has to offer in the future.

If you are concerned about bundle size you can use either one of the individual products, e.g.  **FioriCharts** or **FioriThemeManager**

## Limitations

Several functional limitations exist at present, which are planned for resolution in future releases. Please check the [Issues tab](https://github.com/SAP/cloud-sdk-ios-fiori/issues) for an up-to-date view of the backlog and issue status.

Key gaps which are present at time of open-source project launch:

 - **FioriCharts** requires design specifications to improve UI

## Known Issues

See **Limitations**.

## How to obtain support

Support for the modules is provided through this open-source repository.  Please file Github Issues for any issues experienced, or questions.  

When **SAPFiori** integrates **FioriCharts** productively, customers should continue to report issues through OSS for SLA tracking.  However, developers may also report chart-related issues directly into the Github Issues; SAP will mirror **FioriCharts**-related issues reported through OSS into Github Issues.

## Contributing

If you want to contribute, please check the [Contribution Guidelines](./CONTRIBUTING.md)

## To-Do (upcoming changes)

See **Limitations**.

## Examples

Functionality can be further explored with a demo app  which is already part of this package [(`Apps/Examples/Examples.xcodeproj`)](https://github.com/SAP/cloud-sdk-ios-fiori/tree/main/Apps/Examples/Examples.xcodeproj).

<p>
<img src="https://user-images.githubusercontent.com/4176826/88093416-d7fc3200-cb46-11ea-81a3-0fb12a6f9776.gif" alt="Demo app with examples" width="300" height="500">

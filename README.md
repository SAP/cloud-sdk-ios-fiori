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
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=cloud-sdk-ios-fiori&metric=sqale_rating)](https://sonarcloud.io/dashboard?id=cloud-sdk-ios-fiori)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/3962/badge?latest)](https://bestpractices.coreinfrastructure.org/projects/3962)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)
[![REUSE status](https://api.reuse.software/badge/github.com/SAP/cloud-sdk-ios-fiori)](https://api.reuse.software/info/github.com/SAP/cloud-sdk-ios-fiori)

</div>

***

This project is the SwiftUI implementation of the [SAP Fiori for iOS Design Language](https://experience.sap.com/fiori-design-ios/), and is meant to augment and in some cases replace the UIKit-based implementation contained in the SAPFiori framework of the [SAP SDK for iOS](https://developers.sap.com/topics/cloud-platform-sdk-for-ios.html).

<p align="center">
<img src="https://user-images.githubusercontent.com/4176826/85931303-3ac81980-b878-11ea-8e7f-9b10ed380f2d.gif" alt="alt text" width="300" height="500" align="center">
</p>

This project currently contains the two modules [`FioriCharts`](https://sap.github.io/cloud-sdk-ios-fiori/charts/index.html) and [`FioriIntegrationCards`](https://sap.github.io/cloud-sdk-ios-fiori/integrationCards/index.html)

## FioriCharts
The FioriCharts module is planned to replace the *RoambiChartKit* charting library which was already embedded in SAPFiori.  Migrating to SwiftUI gives the ability to easily add new chart components (donut, bullet, stocks, etc.) while modernizing the existing supported charts with pinch-to-zoom, pan, and new design features.

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

## Fiori Integration Cards
The FioriIntegrationCards module is a native SwiftUI renderer for the [UI5 Integration Cards](https://openui5.hana.ondemand.com/test-resources/sap/ui/integration/demokit/cardExplorer/index.html). These types of cards are common in UI5 dashboard and overview page user contexts.  In native iOS apps, we are focusing initially on the dashboard use case, and also considering Cards as ideal for Annotation-style views--in maps, or AR experiences.  

| | FioriIntegrationCards |
| - | - |
| Object Card | :white_check_mark: | 
| List Card | :white_check_mark: | 
| Timeline Card | :white_check_mark: | 
| Analytic Card | :white_check_mark: | 
| Table Card | :white_check_mark: | 
| Calendar Card | :soon: |
| Adaptive Card | tbd |
| Component Card | :x: |

[API Reference](https://sap.github.io/cloud-sdk-ios-fiori/integrationCards/index.html)

## Requirements

- iOS 13 or higher, macOS 10.15.4 or higher
- Xcode 11.4 or higher
- Swift Package Manager

## Download and Installation

The package is intended for consumption via Swift Package Manager.  

 - To add to your application target, navigate to the `File > Swift Packages > Add Package Dependency...` tab, then add the repository URL.
 - To add to your framework target, add the repository URL to your [**Package.swift**](https://github.com/KevinMuessig/cloud-sdk-ios-fiori/blob/main/Package.swift) manifest.
 
In both cases, **xcodebuild** tooling will manage cloning and updating the repository to your app or framework project.
 
> **NOTE:** If the **Package.swift** file doesn't exist you need to manually create the file or copy the above linked file of the **cloud-sdk-ios-fiori** repository.

## Configuration

Three products are exposed by the `Package.swift` manifest.

[**FioriSwiftUI**](https://sap.github.io/cloud-sdk-ios-fiori/) as umbrella product will contain everything the package has to offer in the future.

![embedd_FioriSwiftUI](https://user-images.githubusercontent.com/9074514/106921499-5ba8f500-670c-11eb-8176-7edeae829cc0.png)

If you are concerned about bundle size you can use either one of the individual products **FioriCharts**

![embedd_FioriCharts](https://user-images.githubusercontent.com/9074514/106924049-f9052880-670e-11eb-85b1-b0484e4dcee5.png)

or **FioriIntegrationCards**

![embedd_Fiori_IntegrationCards](https://user-images.githubusercontent.com/9074514/106924140-11754300-670f-11eb-936b-7fa161f2d3b4.png)

</br>

> **IMPORTANT:** Don't have the **FioriSwiftUI**, the **FioriCharts** or **FioriIntegrationCards** embedded at the same time.
> The **FioriSwiftUI** as mentioned is an umbrella product and will have dependency clashes if you would embedd the other two frameworks at the same time.

## Limitations

Both modules are currently in development, and should not yet be used productively. Breaking changes may occur in 0.x.x release(s)

Several functional limitations exist at present, which are planned for resolution before milestone release 1.0.0. Please check the [Issues tab](https://github.com/SAP/cloud-sdk-ios-fiori/issues) for an up-to-date view of the backlog and issue status.

Key gaps which are present at time of open-source project launch:

 - **FioriIntegrationCards** networking shall support injection of `SAPURLSession` http client
 - **FioriIntegrationCards** currently handles only data which is in-line json; must be augmented to support resolving relative data files, and remote URIs
 - **FioriIntegrationCards** and **FioriCharts** requires design specifications to improve UI
 - **FioriIntegrationCards** and **FioriCharts** must support theming with **NUI** nss stylesheets, as currently supported by **SAPFiori**. 

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
<img src="https://user-images.githubusercontent.com/9074514/106485693-2c4a7c00-64b1-11eb-876a-e577b758a4aa.gif" alt="Demo app with integration card examples" width="250" height="640">
</p>

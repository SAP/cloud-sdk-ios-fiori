# FioriThemeManager

This module provides a [color palette](https://experience.sap.com/fiori-design-ios/article/colors/) and a new font family [SAP 72](https://experience.sap.com/72/) that conform to [Fiori Design Language](https://experience.sap.com/fiori-design-ios/). It is adopted by all the Fiori components in both this package and SAPFiori.

All Fiori Colors are dynamic colors, which means they will adjust based on iOS Appearance settings (Light/Dark). Accessing Fiori Color using `Color.preferredFioriColor(forStyle:)`.

72 is a SAP patent typeface that delivers great reading experience to our users. You can get these fonts using `Font.fiori(forTextStyle:)` or `Font.fioriCondensed(forTextStyle:)`. Note that these fonts support Dynamic Type out of the box. If you want the fonts with fixed size, use `Font.fiori(fixedSize:)` or `Font.fioriCondensed(fixedSize:)` instead.

> Custom fonts need to be loaded and registered during App's runtime. Make sure you call `Font.registerFioriFonts()` inside `application(_:didFinishLaunchingWithOptions:)` of your `AppDelegate`.

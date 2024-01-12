# ``FioriThemeManager``

Use Fiori Colors, Fonts and Icons in your SwiftUI views

## Overview

This module provides APIs and the technical implementation for the following aspects of the [Fiori for iOS Design Language](https://experience.sap.com/fiori-design-ios/):

- [**Colors**](https://experience.sap.com/fiori-design-ios/article/colors/)
- [**Typography**](https://experience.sap.com/fiori-design-ios/article/typography/)
- [**Iconography**](``FioriIcon``)

### Colors

A **color palette** consists of a set of vibrant colors providing a flexible yet consistent color system and distinct look to all SAP products. All Fiori Colors are dynamic colors, which means they will adjust based on iOS Appearance settings (Light/Dark).

SDK-provided SwiftUI already use the color palette.

Use ``SwiftUI/Color/preferredColor(_:background:interface:display:)`` to leverage Fiori colors in your SwiftUI views. 

```swift
// Example
var body: some View {
  Circle()
    .fill(Color.preferredColor(.primary))
}
```

You can override the color values defined in the color palette and therefore influence the branding of your and SDK-provided SwiftUI views. See <doc:CustomizeColorPalette> for more information.

### Typography

**SAP 72** is the primary font for SAP Fiori for iOS.

> Important: Call ``SwiftUI/Font/registerFioriFonts()`` inside `application(_:didFinishLaunchingWithOptions:)` of your `AppDelegate` to register 72 as a custom font. Otherwise the font won't be loaded.

SDK-provided SwiftUI already use the font.

Use ``SwiftUI/Font/fiori(forTextStyle:weight:isItalic:isCondensed:)`` to leverage 72 font in your SwiftUI views.

```swift
// example
var body: some View {
  Text("Hello, World")
    .font(.fiori(forTextStyle: .headline))
}
```

If you want the fonts with fixed size, use ``SwiftUI/Font/fiori(fixedSize:weight:isItalic:isCondensed:)`` instead.

### Iconography

The SAP Fiori for iOS icon library (``FioriIcon``) identifies a standard subset of SF Symbols that are aligned with the SAP Fiori design language. This allows us to have a robust collection that offers the familiarity, accessibility, and cohesiveness SAP customers expect across different platforms while still being consistent with the iOS experience.

```swift
// example
var body: some View {
  Image(fioriName: "fiori.e.care")
}
```

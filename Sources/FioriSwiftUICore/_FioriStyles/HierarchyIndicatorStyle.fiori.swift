import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.

 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct HierarchyIndicatorBaseStyle: HierarchyIndicatorStyle {
    @Environment(\.sizeCategory) private var sizeCategory
    
    public func makeBody(_ configuration: HierarchyIndicatorConfiguration) -> some View {
        if configuration.isMultiline || configuration.isLargeSizeCategory(self.sizeCategory) {
            return AnyView(
                VStack(spacing: HierarchyIndicatorLayout.rowElementSpace) {
                    configuration.icon
                    configuration.title
                    Spacer()
                })
        } else {
            return AnyView(
                HStack(alignment: VerticalAlignment.center, spacing: HierarchyIndicatorLayout.columnElementSpace) {
                    configuration.title
                        .alignmentGuide(VerticalAlignment.center) { dimension in
                            dimension[VerticalAlignment.center]
                        }
                    if configuration.title.isEmpty {
                        Spacer()
                    }
                    configuration.icon
                        .alignmentGuide(VerticalAlignment.center) { dimension in
                            dimension[VerticalAlignment.center]
                        }
                }
            )
        }
    }
}

// Default fiori styles
extension HierarchyIndicatorFioriStyle {
    struct ContentFioriStyle: HierarchyIndicatorStyle {
        @Environment(\.sizeCategory) private var sizeCategory
        @Environment(\.onCurrentHierarchyItemChange) private var onCurrentItemChange
        @State private var isActive = false
        @State var scale: CGFloat = 1.0
        
        func makeBody(_ configuration: HierarchyIndicatorConfiguration) -> some View {
            let isLargeSizeCategory = configuration.isLargeSizeCategory(self.sizeCategory)
            let topPadding: CGFloat = (configuration.isMultiline || isLargeSizeCategory) ? 2 : 0
            return HierarchyIndicator(configuration)
                .frame(maxWidth: isLargeSizeCategory ? HierarchyIndicatorLayout.multiLineWideContentWidth : (configuration.isMultiline ? HierarchyIndicatorLayout.multiLineContentWidth : HierarchyIndicatorLayout.singleLineContentWidth), maxHeight: .infinity)
                .padding(EdgeInsets(top: topPadding, leading: 0, bottom: 0, trailing: 0))
                .onTapGesture {
                    if configuration.isClickable, !configuration.isSelected, configuration.onClick != nil {
                        self.isActive = true // To indicate the indicator was clicked and let icon change to acived icon firstly before follow-up event was triggered
                    
                        // To change the scale for icon to let it like the button when indicator was clicked
                        withAnimation {
                            self.scale = 0.4
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {
                                self.scale = 1.0
                            }
                        }
                    }
                }
                .onChange(of: self.isActive) { oldValue, newValue in
                    if !oldValue, newValue, let onClick = configuration.onClick { // 'isActive' to true means the icon was clicked and icon was change. Now, trigger the follow-up event
                        if let itemId = onClick() { // Handle the case when indicator was in HierarchyView or HierarchyItemView
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                self.onCurrentItemChange?(itemId) // Handle the case when indicator was in HierarchyView only
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.isActive = false
                        }
                    }
                }
                .iconStyle { configuration in
                    if self.isActive {
                        FioriIcon.actions.hierarchyOn.scaleEffect(self.scale)
                    } else {
                        configuration.icon.scaleEffect(self.scale)
                    }
                }
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let hierarchyIndicatorConfiguration: HierarchyIndicatorConfiguration
        @Environment(\.colorScheme) var colorScheme
        @Environment(\.sizeCategory) private var sizeCategory
    
        var backgroundColorScheme: BackgroundColorScheme {
            self.colorScheme == .dark ? .darkConstant : .lightConstant
        }

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            // Not sure why, the modifier, like font, frame and foregroundStyle, don't work on Title(configuration) here.
            // So, use below 'Title' extension to apply all modifier.
            Title(configuration, backgroundColorScheme: self.backgroundColorScheme, isMultiline: self.hierarchyIndicatorConfiguration.isMultiline, isLargeSizeCategory: self.hierarchyIndicatorConfiguration.isLargeSizeCategory(self.sizeCategory))
                .lineLimit(1)
        }
    }

    struct IconFioriStyle: IconStyle {
        let hierarchyIndicatorConfiguration: HierarchyIndicatorConfiguration
    
        func makeBody(_ configuration: IconConfiguration) -> some View {
            let icon = configuration.icon.isEmpty ? AnyView(self.hierarchyIndicatorConfiguration.isSelected ? FioriIcon.actions.hierarchyOn : FioriIcon.actions.hierarchyOff) : AnyView(configuration.icon)
            return Icon(icon: { icon })
                .font(.fiori(forTextStyle: .callout))
                .scaledToFill()
                .foregroundStyle(Color.preferredColor(.tintColor))
        }
    }
}

extension Title {
    init(_ configuration: TitleConfiguration, backgroundColorScheme: BackgroundColorScheme, isMultiline: Bool, isLargeSizeCategory: Bool) {
        let titleView = configuration.title
            .font(.headline)
            .minimumScaleFactor(0.1)
            .foregroundStyle(Color.preferredColor(.tertiaryLabel, background: backgroundColorScheme))
            .frame(maxWidth: isLargeSizeCategory ? HierarchyIndicatorLayout.multiLineWideContentWidth : (isMultiline ? HierarchyIndicatorLayout.multiLineContentWidth : HierarchyIndicatorLayout.singleLineContentWidth), alignment: (isMultiline || isLargeSizeCategory) ? .center : .trailing)
        self.init(title: { titleView })
    }
}

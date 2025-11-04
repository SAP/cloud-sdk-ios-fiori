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
public struct HierarchyViewHeaderBaseStyle: HierarchyViewHeaderStyle {
    @Environment(\.layoutDirection) var layoutDirection
    
    public func makeBody(_ configuration: HierarchyViewHeaderConfiguration) -> some View {
        // Add default layout here
        HStack {
            if self.layoutDirection == .leftToRight {
                configuration.leadingAccessory
            } else {
                configuration.trailingAccessory
            }
            Spacer()
            configuration.title
            Spacer()
            if self.layoutDirection == .leftToRight {
                configuration.trailingAccessory
            } else {
                configuration.leadingAccessory
            }
        }
    }
}

// Default fiori styles
extension HierarchyViewHeaderFioriStyle {
    struct ContentFioriStyle: HierarchyViewHeaderStyle {
        func makeBody(_ configuration: HierarchyViewHeaderConfiguration) -> some View {
            HierarchyViewHeader(configuration)
                .background(Color.preferredColor(.secondaryBackground))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let hierarchyViewHeaderConfiguration: HierarchyViewHeaderConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .lineLimit(1)
                .truncationMode(.tail)
                .font(.fiori(forTextStyle: .body))
        }
    }

    struct LeadingAccessoryFioriStyle: LeadingAccessoryStyle {
        let hierarchyViewHeaderConfiguration: HierarchyViewHeaderConfiguration
        @EnvironmentObject private var modelObject: HierarchyViewModelObject
        @Environment(\.layoutDirection) var layoutDirection
    
        func makeBody(_ configuration: LeadingAccessoryConfiguration) -> some View {
            let isEnabled = self.layoutDirection == .rightToLeft ? (self.modelObject.childID != nil) : (self.modelObject.parentID != nil)
            return LeadingAccessory(configuration, modelObject: self.modelObject, isRTL: self.layoutDirection == .rightToLeft)
                .font(.fiori(forTextStyle: .body, weight: .regular))
                .imageScale(.large)
                .foregroundStyle(isEnabled ? Color.preferredColor(.tintColor) : Color.preferredColor(.tertiaryLabel).opacity(0.3))
                .padding()
        }
    }

    struct TrailingAccessoryFioriStyle: TrailingAccessoryStyle {
        let hierarchyViewHeaderConfiguration: HierarchyViewHeaderConfiguration
        @EnvironmentObject private var modelObject: HierarchyViewModelObject
        @Environment(\.layoutDirection) var layoutDirection
    
        func makeBody(_ configuration: TrailingAccessoryConfiguration) -> some View {
            let isEnabled = self.layoutDirection == .rightToLeft ? (self.modelObject.parentID != nil) : (self.modelObject.childID != nil)
            return TrailingAccessory(configuration, modelObject: self.modelObject, isRTL: self.layoutDirection == .rightToLeft)
                .font(.fiori(forTextStyle: .body, weight: .regular))
                .imageScale(.large)
                .foregroundStyle(isEnabled ? Color.preferredColor(.tintColor) : Color.preferredColor(.tertiaryLabel).opacity(0.3))
                .padding()
        }
    }
}

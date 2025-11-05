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
public struct HierarchyItemViewBaseStyle: HierarchyItemViewStyle {
    @Environment(\.editMode) var editMode
    @Environment(\.hierarchyItemSelectionMode) private var selectionMode
    @State private var hStackHeight: CGFloat = 0
    @State private var statusHeight: CGFloat = 0
    
    public func makeBody(_ configuration: HierarchyItemViewConfiguration) -> some View {
        HStack(alignment: configuration.isSingleLine() ? .center : .top, spacing: 0) {
            if self.editMode?.wrappedValue == .active, self.selectionMode != .none {
                Spacer().frame(width: 12) // Leave 12 leading padding only for display selection button
            }
            
            if !configuration.icons.isEmpty {
                configuration.icons
                Spacer().frame(width: 12)
            }
            
            if !configuration.detailImage.isEmpty {
                configuration.detailImage
                Spacer().frame(width: 12)
            }
            
            if configuration.isSingleLine() { // Only one of title, subtitle or footnote is NOT empty
                HStack {
                    if !configuration.title.isEmpty {
                        configuration.title
                    } else if !configuration.subtitle.isEmpty {
                        configuration.subtitle
                    } else if !configuration.footnote.isEmpty {
                        configuration.footnote
                    }
                    
                    if !configuration.status.isEmpty {
                        Spacer()
                        configuration.status
                    }
                    
                    AccessoryView(accessoryType: configuration.accessoryType)
                }
            } else {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        configuration.title
                        configuration.subtitle
                        configuration.footnote
                    }
                    .alignmentGuide(.top) { dimension in
                        dimension[.top]
                    }
                    
                    Spacer()
                    
                    let isVerticalCenter = (configuration.accessoryType != .disclosure && configuration.accessoryType != .none)
                    configuration.status
                        .measureHeight { self.statusHeight = $0 }
                        .alignmentGuide(.top) { dimension in
                            isVerticalCenter ? -((self.hStackHeight - self.statusHeight) / 2) : dimension[VerticalAlignment.top]
                        }
                    
                    let accessoryHeight = configuration.accessoryViewSize().height
                    AccessoryView(accessoryType: configuration.accessoryType)
                        .alignmentGuide(.top) { dimension in
                            isVerticalCenter ? -((self.hStackHeight - accessoryHeight) / 2) : dimension[VerticalAlignment.top]
                        }
                }
                .measureHeight { height in
                    self.hStackHeight = height
                }
            }
            
            configuration.hierarchyIndicator
        }
    }
}

// Default fiori styles
extension HierarchyItemViewFioriStyle {
    struct ContentFioriStyle: HierarchyItemViewStyle {
        func makeBody(_ configuration: HierarchyItemViewConfiguration) -> some View {
            HierarchyItemView(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let hierarchyItemViewConfiguration: HierarchyItemViewConfiguration
        @Environment(\.colorScheme) var colorScheme
        @Environment(\.sizeCategory) private var sizeCategory
        
        var backgroundColorScheme: BackgroundColorScheme {
            self.colorScheme == .dark ? .darkConstant : .lightConstant
        }
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
                .foregroundStyle(Color.preferredColor(.primaryLabel, background: self.backgroundColorScheme))
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        let hierarchyItemViewConfiguration: HierarchyItemViewConfiguration
        @Environment(\.colorScheme) var colorScheme
        @Environment(\.sizeCategory) private var sizeCategory
    
        var backgroundColorScheme: BackgroundColorScheme {
            self.colorScheme == .dark ? .darkConstant : .lightConstant
        }
    
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .font(.body)
                .foregroundStyle(Color.preferredColor(.primaryLabel, background: self.backgroundColorScheme))
                .lineLimit(self.hierarchyItemViewConfiguration.isAccessibilitySizeCategory(self.sizeCategory) ? 0 : 1)
        }
    }

    struct FootnoteFioriStyle: FootnoteStyle {
        let hierarchyItemViewConfiguration: HierarchyItemViewConfiguration
        @Environment(\.colorScheme) var colorScheme
        @Environment(\.sizeCategory) private var sizeCategory
    
        var backgroundColorScheme: BackgroundColorScheme {
            self.colorScheme == .dark ? .darkConstant : .lightConstant
        }
    
        func makeBody(_ configuration: FootnoteConfiguration) -> some View {
            Footnote(configuration)
                .font(.subheadline)
                .foregroundStyle(Color.preferredColor(.tertiaryLabel, background: self.backgroundColorScheme))
                .lineLimit(self.hierarchyItemViewConfiguration.isAccessibilitySizeCategory(self.sizeCategory) ? 0 : 1)
        }
    }

    struct IconsFioriStyle: IconsStyle {
        let hierarchyItemViewConfiguration: HierarchyItemViewConfiguration

        func makeBody(_ configuration: IconsConfiguration) -> some View {
            Icons(configuration)
                .environment(\.numberOfLines, self.hierarchyItemViewConfiguration.maxIconsCount())
        }
    }

    struct DetailImageFioriStyle: DetailImageStyle {
        let hierarchyItemViewConfiguration: HierarchyItemViewConfiguration

        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
                .padding(3)
                .frame(width: 45, height: 45)
                .scaledToFill()
        }
    }

    struct StatusFioriStyle: StatusStyle {
        let hierarchyItemViewConfiguration: HierarchyItemViewConfiguration
        @Environment(\.colorScheme) var colorScheme
    
        var backgroundColorScheme: BackgroundColorScheme {
            self.colorScheme == .dark ? .darkConstant : .lightConstant
        }
    
        func makeBody(_ configuration: StatusConfiguration) -> some View {
            Status(configuration)
                .font(.subheadline)
                .foregroundStyle(Color.preferredColor(.tertiaryLabel, background: self.backgroundColorScheme))
                .lineLimit(1)
        }
    }

    struct AccessoryViewFioriStyle: AccessoryViewStyle {
        let hierarchyItemViewConfiguration: HierarchyItemViewConfiguration

        func makeBody(_ configuration: AccessoryViewConfiguration) -> some View {
            AccessoryView(configuration)
                .font(.fiori(forTextStyle: configuration.accessoryType == .detail ? .title2 : .subheadline)) // Use font instead of the fix size for frame to let the icon can be scaled accroding to different accessibility size category
                .scaledToFill()
        }
    }
}

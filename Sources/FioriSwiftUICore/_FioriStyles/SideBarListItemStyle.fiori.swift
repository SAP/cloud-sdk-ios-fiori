import FioriThemeManager
import Foundation
import SwiftUI

//
/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct SideBarListItemBaseStyle: SideBarListItemStyle {
    @Environment(\.editMode) private var editMode
    @EnvironmentObject private var modelObject: SideBarModelObject
    @Environment(\.sizeCategory) private var sizeCategory
    @ScaledMetric var scale: CGFloat = 1
    
    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        Group {
            let dragImage = Image(systemName: "line.horizontal.3")
                .font(.fiori(forTextStyle: .title3))
                .foregroundStyle(Color.preferredColor(.secondaryLabel))
            
            if self.sizeCategory.isAccessibilityCategory {
                VStack {
                    HStack(spacing: 11) {
                        if configuration.isSelected, self.editMode?.wrappedValue == .inactive {
                            configuration.filledIcon
                        } else {
                            configuration.icon
                        }
                        configuration.title.multilineTextAlignment(.leading)
                        Spacer()
                    }
                    
                    HStack(spacing: 11) {
                        Spacer()
                        if self.editMode?.wrappedValue == .inactive {
                            configuration.subtitle.multilineTextAlignment(.trailing)
                            configuration.accessoryIcon
                        } else if self.editMode?.wrappedValue == .active {
                            configuration._switch
                                .frame(width: 60 * self.scale, height: 22 * self.scale)
                            dragImage
                        }
                    }
                }
            } else {
                HStack(spacing: 11) {
                    if configuration.isSelected, self.editMode?.wrappedValue == .inactive {
                        configuration.filledIcon
                    } else {
                        configuration.icon
                    }
                    
                    configuration.title.frame(height: 44, alignment: .leading).multilineTextAlignment(.leading)
                    Spacer()
                    if self.editMode?.wrappedValue == .inactive {
                        configuration.subtitle.frame(height: 44, alignment: .leading).multilineTextAlignment(.trailing)
                        configuration.accessoryIcon
                    } else if self.editMode?.wrappedValue == .active {
                        configuration._switch
                            .frame(width: 50, height: 35)
                            .tint(Color.preferredColor(configuration.isOn ? .tintColor : .secondaryFill))
                            .opacity(1.0)
                        dragImage
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
        .cornerRadius(8, antialiased: true)
        .frame(width: self.sizeCategory.isAccessibilityCategory ? nil : (UIDevice.current.userInterfaceIdiom != .pad ? nil : 288), height: self.sizeCategory.isAccessibilityCategory ? nil : 44)
        .accessibilityElement(children: .ignore)
        .accessibilityAddTraits(.isButton)
        .accessibilityRemoveTraits(.isSelected)
        .accessibilityLabel(configuration.data.title)
    }
}

// Default fiori styles
extension SideBarListItemFioriStyle {
    struct ContentFioriStyle: SideBarListItemStyle {
        @Environment(\.editMode) private var editMode
        @EnvironmentObject private var modelObject: SideBarModelObject
        
        func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
            Group {
                if configuration.isSelected, self.editMode?.wrappedValue == .inactive {
                    SideBarListItem(configuration)
                        .accessibilityAddTraits(.isSelected)
                        .environmentObject(SideBarListItemModelObject(isSelected: configuration.isSelected))
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.preferredColor(.tintColor)))
                } else {
                    SideBarListItem(configuration)
                        .accessibilityAddTraits(.isButton)
                        .environmentObject(SideBarListItemModelObject(isSelected: configuration.isSelected))
                        .background(Color.preferredColor(.secondaryBackground))
                }
            }
        }
    }

    struct IconFioriStyle: IconStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
        @EnvironmentObject private var modelObject: SideBarListItemModelObject
        @Environment(\.editMode) private var editMode
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Group {
                if self.modelObject.isSelected, self.editMode?.wrappedValue == .inactive {
                    Icon(configuration)
                        .font(.fiori(forTextStyle: .body))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.preferredColor(.quinaryLabel))
                } else {
                    Icon(configuration)
                        .font(.fiori(forTextStyle: .body))
                        .foregroundStyle(Color.preferredColor(.tintColor))
                }
            }
        }
    }

    struct FilledIconFioriStyle: FilledIconStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
    
        func makeBody(_ configuration: FilledIconConfiguration) -> some View {
            FilledIcon(configuration)
                .font(.fiori(forTextStyle: .body))
                .fontWeight(.bold)
                .foregroundStyle(Color.preferredColor(.quinaryLabel))
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
        @EnvironmentObject private var modelObject: SideBarListItemModelObject
        @Environment(\.editMode) private var editMode
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            if self.modelObject.isSelected, self.editMode?.wrappedValue == .inactive {
                Title(configuration)
                    .font(.fiori(forTextStyle: .body, weight: .bold))
                    .foregroundStyle(Color.preferredColor(.quinaryLabel))
            } else {
                Title(configuration)
                    .font(.fiori(forTextStyle: .body, weight: .regular))
                    .foregroundStyle(Color.preferredColor(.primaryLabel))
            }
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
        @EnvironmentObject private var modelObject: SideBarListItemModelObject
        @Environment(\.editMode) private var editMode
    
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            if self.modelObject.isSelected, self.editMode?.wrappedValue == .inactive {
                Subtitle(configuration)
                    .font(.fiori(forTextStyle: .body, weight: .bold))
                    .foregroundStyle(Color.preferredColor(.quinaryLabel))
            } else {
                Subtitle(configuration)
                    .font(.fiori(forTextStyle: .body, weight: .regular))
                    .foregroundStyle(Color.preferredColor(.secondaryLabel))
            }
        }
    }

    struct AccessoryIconFioriStyle: AccessoryIconStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
        @EnvironmentObject private var modelObject: SideBarListItemModelObject
        @Environment(\.editMode) private var editMode
    
        func makeBody(_ configuration: AccessoryIconConfiguration) -> some View {
            Group {
                if self.modelObject.isSelected, self.editMode?.wrappedValue == .inactive {
                    AccessoryIcon(configuration)
                        .font(.fiori(forTextStyle: .body))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.preferredColor(.quinaryLabel))
                } else {
                    AccessoryIcon(configuration)
                        .font(.fiori(forTextStyle: .body))
                        .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                }
            }
        }
    }

    struct SwitchFioriStyle: SwitchStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
    
        func makeBody(_ configuration: SwitchConfiguration) -> some View {
            Switch(configuration)
        }
    }
}

// Default nss styles
extension SideBarListItemNSSStyle {
    struct ContentNSSStyle: SideBarListItemStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
            SideBarListItem(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct IconNSSStyle: IconStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Icon
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct FilledIconNSSStyle: FilledIconStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: FilledIconConfiguration) -> some View {
            FilledIcon(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for FilledIcon
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TitleNSSStyle: TitleStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Title
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct SubtitleNSSStyle: SubtitleStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Subtitle
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct AccessoryIconNSSStyle: AccessoryIconStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: AccessoryIconConfiguration) -> some View {
            AccessoryIcon(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for AccessoryIcon
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct SwitchNSSStyle: SwitchStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: SwitchConfiguration) -> some View {
            Switch(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Switch
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}

class SideBarListItemModelObject: ObservableObject {
    @Published var isSelected: Bool
    
    init(isSelected: Bool) {
        self.isSelected = isSelected
    }
}

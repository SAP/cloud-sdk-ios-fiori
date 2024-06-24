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
                .frame(width: 22 * self.scale, height: 22 * self.scale)
            
            if self.sizeCategory.isAccessibilityCategory {
                VStack {
                    HStack(spacing: 11) {
                        if configuration.isSelected, self.editMode?.wrappedValue == .inactive {
                            configuration.filledIcon
                                .frame(width: 22 * self.scale, height: 22 * self.scale)
                        } else {
                            configuration.icon
                                .frame(width: 22 * self.scale, height: 22 * self.scale)
                        }
                        configuration.title
                        Spacer()
                    }
                    
                    HStack(spacing: 11) {
                        Spacer()
                        if self.editMode?.wrappedValue == .inactive {
                            configuration.subtitle
                            configuration.accessoryIcon
                                .frame(width: 22 * self.scale, height: 22 * self.scale)
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
                            .frame(width: 22 * self.scale, height: 22 * self.scale)
                    } else {
                        configuration.icon
                            .frame(width: 22 * self.scale, height: 22 * self.scale)
                    }
                    
                    configuration.title.frame(height: 44, alignment: .leading)
                    Spacer()
                    if self.editMode?.wrappedValue == .inactive {
                        configuration.subtitle.frame(height: 44, alignment: .leading)
                        configuration.accessoryIcon
                            .frame(width: 22 * self.scale, height: 22 * self.scale)
                    } else if self.editMode?.wrappedValue == .active {
                        configuration._switch
                            .frame(width: 60 * self.scale, height: 22 * self.scale)
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
            SideBarListItem(configuration)
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill((configuration.isSelected && self.editMode?.wrappedValue == .inactive) ? Color.preferredColor(.tintColor) : Color.clear))
                .accessibilityAddTraits((configuration.isSelected && self.editMode?.wrappedValue == .inactive) ? .isSelected : .isButton)
                .environmentObject(SideBarListItemModelObject(isSelected: configuration.isSelected))
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
                        .fontWeight(.bold)
                        .foregroundStyle(Color.preferredColor(.quinaryLabel))
                } else {
                    Icon(configuration)
                        .foregroundStyle(Color.preferredColor(.tintColor))
                }
            }
        }
    }

    struct FilledIconFioriStyle: FilledIconStyle {
        let sideBarListItemConfiguration: SideBarListItemConfiguration
    
        func makeBody(_ configuration: FilledIconConfiguration) -> some View {
            FilledIcon(configuration)
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
                    .font(.fiori(forTextStyle: .subheadline, weight: .bold))
                    .foregroundStyle(Color.preferredColor(.quinaryLabel))
            } else {
                Subtitle(configuration)
                    .font(.fiori(forTextStyle: .subheadline, weight: .regular))
                    .foregroundStyle(Color.preferredColor(.tertiaryLabel))
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
                        .fontWeight(.bold)
                        .foregroundStyle(Color.preferredColor(.quinaryLabel))
                } else {
                    AccessoryIcon(configuration)
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

class SideBarListItemModelObject: ObservableObject {
    @Published var isSelected: Bool
    
    init(isSelected: Bool) {
        self.isSelected = isSelected
    }
}

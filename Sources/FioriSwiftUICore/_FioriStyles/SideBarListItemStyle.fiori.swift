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
                        if configuration.isSelected, !SideBarUtility.isEditing(self.modelObject, self.editMode?.wrappedValue) {
                            configuration.filledIcon
                        } else {
                            configuration.icon
                        }
                        configuration.title.multilineTextAlignment(.leading)
                        Spacer()
                    }
                    
                    HStack(spacing: 11) {
                        Spacer()
                        if !SideBarUtility.isEditing(self.modelObject, self.editMode?.wrappedValue) {
                            configuration.subtitle.multilineTextAlignment(.trailing)
                            configuration.accessoryIcon
                        } else if SideBarUtility.isEditing(self.modelObject, self.editMode?.wrappedValue) {
                            configuration._switch
                                .frame(width: 60 * self.scale, height: 22 * self.scale)
                            dragImage
                        }
                    }
                }
            } else {
                HStack(spacing: 11) {
                    if configuration.isSelected, !SideBarUtility.isEditing(self.modelObject, self.editMode?.wrappedValue) {
                        configuration.filledIcon
                    } else {
                        configuration.icon
                    }
                    
                    configuration.title.frame(height: 44, alignment: .leading).multilineTextAlignment(.leading)
                    Spacer()
                    if !SideBarUtility.isEditing(self.modelObject, self.editMode?.wrappedValue) {
                        configuration.subtitle.frame(height: 44, alignment: .leading).multilineTextAlignment(.trailing)
                        configuration.accessoryIcon
                    } else if SideBarUtility.isEditing(self.modelObject, self.editMode?.wrappedValue) {
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
        .frame(width: nil, height: self.sizeCategory.isAccessibilityCategory ? nil : 44)
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
                if configuration.isSelected, !SideBarUtility.isEditing(self.modelObject, self.editMode?.wrappedValue) {
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
        @EnvironmentObject private var sidebarModelObject: SideBarModelObject
        @Environment(\.editMode) private var editMode
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Group {
                if self.modelObject.isSelected, !SideBarUtility.isEditing(self.sidebarModelObject, self.editMode?.wrappedValue) {
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
        @EnvironmentObject private var sidebarModelObject: SideBarModelObject
        @Environment(\.editMode) private var editMode
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            if self.modelObject.isSelected, !SideBarUtility.isEditing(self.sidebarModelObject, self.editMode?.wrappedValue) {
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
        @EnvironmentObject private var sidebarModelObject: SideBarModelObject
        @Environment(\.editMode) private var editMode
    
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            if self.modelObject.isSelected, !SideBarUtility.isEditing(self.sidebarModelObject, self.editMode?.wrappedValue) {
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
        @EnvironmentObject private var sidebarModelObject: SideBarModelObject
        @Environment(\.editMode) private var editMode
    
        func makeBody(_ configuration: AccessoryIconConfiguration) -> some View {
            Group {
                if self.modelObject.isSelected, !SideBarUtility.isEditing(self.sidebarModelObject, self.editMode?.wrappedValue) {
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

class SideBarListItemModelObject: ObservableObject {
    @Published var isSelected: Bool
    
    init(isSelected: Bool) {
        self.isSelected = isSelected
    }
}

class SideBarUtility {
    // See issue HCPSDKFIORIUIKIT-3047, the .environment(\.editMode) can't work for UIKit Sidebar which wrapper the SWiftUIs's sidebar.
    // So, here, to use 'isEditing' in configuration directly for UIKit Sidebar
    static func isEditing(_ modelObject: SideBarModelObject, _ editMode: EditMode?) -> Bool {
        // Consider this is a workaround for the @Environment(\.editMode) can't work for UIKit Sidebar which wrap the SwiftUI sidebar.
        // So, when 'isUsedInSplitView' is false (for UIkit only), always check the isEditing in configuration.
        modelObject.configuration.isUsedInSplitView && editMode == .active
            || !modelObject.configuration.isUsedInSplitView && modelObject.configuration.isEditing
    }
}

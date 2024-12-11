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
public struct MenuSelectionBaseStyle: MenuSelectionStyle {
    @Environment(\.maxNumberOfItems) var maxNumberOfItems
    @State private var itemCount = 0
    
    public func makeBody(_ configuration: MenuSelectionConfiguration) -> some View {
        VStack(alignment: .leading) {
            _CountableView(maxNumberOfItems: !self.isListCollapsed(configuration) ? 0 : self.maxNumberOfItems) {
                configuration.items
            }
            .onPreferenceChange(ItemCountPreferenceKey.self, perform: { value in
                self.itemCount = value
            })
           
            if self.isListCollapsed(configuration) {
                Group {
                    if configuration.action.isEmpty {
                        self.defaultAction
                    } else {
                        configuration.action
                    }
                }
                .onSimultaneousTapGesture {
                    configuration.isExpanded = true
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func isListCollapsed(_ config: MenuSelectionConfiguration) -> Bool {
        self.maxNumberOfItems > 0 && !config.isExpanded && self.itemCount > self.maxNumberOfItems
    }
    
    private var defaultAction: some View {
        FioriButton(title: .init("View All (%d)", args: self.itemCount))
            .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .normal))
            .accessibilityIdentifier("FioriSwiftUICore.MenuSelection.ViewAllButton")
    }
}

// Default fiori styles
extension MenuSelectionFioriStyle {
    struct ContentFioriStyle: MenuSelectionStyle {
        func makeBody(_ configuration: MenuSelectionConfiguration) -> some View {
            MenuSelection(configuration)
                // Add default style for its content
                .frame(maxWidth: .infinity)
        }
    }
    
    struct ActionFioriStyle: ActionStyle {
        let menuSelectionConfiguration: MenuSelectionConfiguration
        
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
                // Add default style for Action
                .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .negative))
        }
    }
}

// Default nss styles
extension MenuSelectionNSSStyle {
    struct ContentNSSStyle: MenuSelectionStyle {
        let menuSelectionConfiguration: MenuSelectionConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: MenuSelectionConfiguration) -> some View {
            MenuSelection(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct ActionNSSStyle: ActionStyle {
        let menuSelectionConfiguration: MenuSelectionConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Action
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}

#Preview(body: {
    MenuSelection(isExpanded: .constant(false)) {
        ForEach(0 ..< 10) {
            Text("Item \($0)")
        }
    }
    .environment(\.maxNumberOfItems, 5)
    .padding()
})

#Preview(body: {
    MenuSelection(isExpanded: .constant(true)) {
        ForEach(0 ..< 10) {
            Text("Item \($0)")
        }
    }
    .environment(\.maxNumberOfItems, 5)
    .padding()
})

private struct MockModel: MenuSelectionItemProtocol {
    var icon: Image?
    
    var title: AttributedString
}

private let models = [
    MockModel(icon: FioriIcon.calendars.calendar, title: "One"),
    MockModel(icon: FioriIcon.calendars.calendar, title: "Two"),
    MockModel(icon: FioriIcon.calendars.calendar, title: "Three"),
    MockModel(icon: FioriIcon.calendars.calendar, title: "Four"),
    MockModel(icon: FioriIcon.calendars.calendar, title: "Five")
]

#Preview(body: {
    MenuSelection(isExpanded: .constant(false), items: models)
        .environment(\.maxNumberOfItems, 3)
        .padding()
})

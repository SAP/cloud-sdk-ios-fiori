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
    @Environment(\.locale) var locale
    @Environment(\.isLoading) var isLoading
    
    public func makeBody(_ configuration: MenuSelectionConfiguration) -> some View {
        VStack(alignment: .leading) {
            let items = configuration.items()
            let isListCollapsed = self.maxNumberOfItems > 0 && !configuration.isExpanded && items.count > self.maxNumberOfItems
            
            self.makeItemsBody(items, isListCollapsed: isListCollapsed)
            
            if isListCollapsed {
                Group {
                    if configuration.action.isEmpty {
                        self.defaultAction(items)
                    } else {
                        configuration.action
                    }
                }
                .onSimultaneousTapGesture {
                    configuration.isExpanded = true
                }
            }
        }
    }
    
    func defaultAction(_ items: [any View]) -> some View {
        FioriButton(title: .init("View All (%d)", args: items.count, locale: self.locale))
            .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .normal, isLoading: self.isLoading))
            .environment(\.isEnabled, true)
            .accessibilityIdentifier("FioriSwiftUICore.MenuSelection.ViewAllButton")
    }
    
    func makeItemsBody(_ items: [any View], isListCollapsed: Bool) -> some View {
        var limitedNumberOfItems = !isListCollapsed ? 0 : self.maxNumberOfItems
        limitedNumberOfItems = limitedNumberOfItems <= 0 ? items.count : limitedNumberOfItems
        
        return ForEach(0 ..< min(limitedNumberOfItems, items.count), id: \.self) {
            items[$0]
                .typeErased
        }
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

#Preview(body: {
    MenuSelection(isExpanded: .constant(false)) {
        (0 ..< 10).map {
            Text("Item \($0)")
        }
    }
    .environment(\.maxNumberOfItems, 5)
    .padding()
})

#Preview(body: {
    MenuSelection(isExpanded: .constant(true)) {
        (0 ..< 10).map {
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
    MockModel(icon: FioriIcon.calendars.calendar, title: "ThreNSLocalizedStringNSLocalizedStringNSLocalizedStringNSLocalizedStringe"),
    MockModel(icon: FioriIcon.calendars.calendar, title: "Four"),
    MockModel(icon: FioriIcon.calendars.calendar, title: "Five")
]

#Preview(body: {
    MenuSelection(isExpanded: .constant(false), items: models, actionHandler: { _ in
        // do nothing
    })
    .environment(\.maxNumberOfItems, 3)
    .padding()
})

#Preview("Disabled State") {
    MenuSelection(isExpanded: .constant(false), items: models, actionHandler: { _ in
        // do nothing
    })
    .environment(\.maxNumberOfItems, 3)
    .padding()
    .disabled(true)
}

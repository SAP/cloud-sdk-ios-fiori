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
    public func makeBody(_ configuration: MenuSelectionConfiguration) -> some View {
        _VariadicView.Tree(MenuSelectionViewLayout(configuration: configuration)) {
            configuration.items
        }
    }
}

struct MenuSelectionViewLayout: _VariadicView_MultiViewRoot {
    let configuration: MenuSelectionConfiguration
    
    @Environment(\.maxNumberOfItems) var maxNumberOfItems
    @Environment(\.locale) var locale
    @Environment(\.isLoading) var isLoading
    
    func body(children: _VariadicView.Children) -> some View {
        VStack(alignment: .leading) {
            let isListCollapsed = self.maxNumberOfItems > 0 && !self.configuration.isExpanded && children.count > self.maxNumberOfItems
            
            self.makeItemsBody(children, isListCollapsed: isListCollapsed)
            
            if isListCollapsed {
                Group {
                    if self.configuration.action.isEmpty {
                        self.defaultAction(children)
                    } else {
                        self.configuration.action
                    }
                }
                .onSimultaneousTapGesture {
                    self.configuration.isExpanded = true
                }
            }
        }
    }

    func defaultAction(_ children: _VariadicView.Children) -> some View {
        // `children.count` is the total unfiltered count, as _VariadicView always provides all children.
        FioriButton(title: .init("View All (%d)", args: children.count, locale: self.locale))
            .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .normal, isLoading: self.isLoading))
            .environment(\.isEnabled, true)
            .accessibilityIdentifier("FioriSwiftUICore.MenuSelection.ViewAllButton")
    }
    
    @ViewBuilder
    func makeItemsBody(_ children: _VariadicView.Children, isListCollapsed: Bool) -> some View {
        let limitedNumberOfItems = !isListCollapsed ? 0 : self.maxNumberOfItems
        if limitedNumberOfItems <= 0 {
            children
        } else {
            ForEach(0 ..< min(limitedNumberOfItems, children.count), id: \.self) {
                children[$0]
            }
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
    MockModel(icon: FioriIcon.calendars.calendar, title: "ThreNSLocalizedStringNSLocalizedStringNSLocalizedStringNSLocalizedStringe"),
    MockModel(icon: FioriIcon.calendars.calendar, title: "Four"),
    MockModel(icon: FioriIcon.calendars.calendar, title: "Five")
]

#Preview(body: {
    MenuSelection(isExpanded: .constant(false), items: models)
        .environment(\.maxNumberOfItems, 3)
        .padding()
})

#Preview("Disabled State") {
    MenuSelection(isExpanded: .constant(false), items: models)
        .environment(\.maxNumberOfItems, 3)
        .padding()
        .disabled(true)
}

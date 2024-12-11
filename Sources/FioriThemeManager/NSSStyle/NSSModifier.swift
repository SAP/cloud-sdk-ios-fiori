import SwiftUI

public struct NSSStyleModifier<T: NSSCovert & RawRepresentable>: ViewModifier where T.RawValue == String {
    let styles: NSSStyleData
    public init(styles: NSSStyleData) {
        self.styles = styles
    }
    
    public func body(content: Content) -> some View {
        var currentView: any View = content
        for (key, value) in self.styles {
            if let property = T(rawValue: key) {
                currentView = property.apply(value: value, to: currentView)
            }
        }
        
        return AnyView(currentView)
    }
}

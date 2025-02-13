import SwiftUI

public struct NSSStyleModifier<T: NSSCovert & RawRepresentable>: ViewModifier where T.RawValue == String {
    let styles: NSSStyleData
    @Binding var state: NSSTool.ControlState?
    public init(styles: NSSStyleData, state: Binding<NSSTool.ControlState>? = nil) {
        self.styles = styles
        self._state = state.map { Binding($0) } ?? .constant(.normal)
    }
    
    public func body(content: Content) -> some View {
        var currentView: any View = content
        for (key, value) in self.styles {
            let v = self.extractStyleValue(from: value, for: self.state ?? .normal, baseKey: key)
            if let property = T(rawValue: key) {
                currentView = property.apply(value: v, to: currentView)
            }
        }
        
        return AnyView(currentView)
    }
    
    // Extract the correct style according to the state.
    private func extractStyleValue(from value: Any, for state: NSSTool.ControlState, baseKey: String) -> Any {
        if let stateStyles = value as? [String: Any] {
            let stateKey: String
            switch state {
            case .normal:
                stateKey = baseKey
            case .selected:
                stateKey = "\(baseKey)-selected"
            case .disabled:
                stateKey = "\(baseKey)-disabled"
            case .highlighted:
                stateKey = "\(baseKey)-highlighted"
            case .readOnly:
                stateKey = "\(baseKey)-readOnly"
            case .focused:
                stateKey = "\(baseKey)-focused"
            default:
                stateKey = baseKey
            }
                    
            return stateStyles[stateKey] ?? stateStyles[baseKey] ?? value
        }
        
        return value
    }
}

import Foundation
import SwiftUI

/// An object that provides fiori style color and interaction for `Button`.
public struct StatefulButtonStyle: PrimitiveButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    // TODO: style configuration struct?
    let foregroundColor: Color
    let depressedColor: Color
    let disabledColor: Color
    let isSelectionPersistent: Bool
    
    /// Creates a style object that provides fiori style color and interaction for `Button`.
    /// - Parameters:
    ///   - color: The color for normal state.
    ///   - depressedColor: The color for a depressed button.
    ///   - disabledColor: The color for a disabled button.
    ///   - isSelectionPersistent: A boolean value determines whether the selection should be persistent or not.
    public init(color: Color = .preferredColor(.tintColor),
                depressedColor: Color = .preferredColor(.tintColorTapState),
                disabledColor: Color = .gray,
                isSelectionPersistent: Bool = false)
    {
        self.foregroundColor = color
        self.depressedColor = depressedColor
        self.disabledColor = disabledColor
        self.isSelectionPersistent = isSelectionPersistent
    }
    
    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: PrimitiveButtonStyle.Configuration) -> some View {
        if self.isEnabled {
            return AnyView(EnabledButton(configuration: configuration, color: self.foregroundColor, pressedColor: self.depressedColor, isSelectionPersistent: self.isSelectionPersistent))
        } else {
            return AnyView(DisabledButton(configuration: configuration, color: self.disabledColor))
        }
    }
    
    struct EnabledButton: View {
        @State var pressed = false
        
        let configuration: PrimitiveButtonStyle.Configuration
        let color: Color
        let pressedColor: Color
        let isSelectionPersistent: Bool
        
        var body: some View {
            configuration.label
                .foregroundColor(.white)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: 5).fill(pressed ? pressedColor : color))
                .gesture(createGesture())
        }
        
        func createGesture() -> _EndedGesture<_ChangedGesture<DragGesture>> {
            if self.isSelectionPersistent {
                return DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                    }
                    .onEnded { _ in
                        self.pressed.toggle()
                        self.configuration.trigger()
                    }
            } else {
                return DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        self.pressed = true
                    }
                    .onEnded { _ in
                        self.pressed = false
                        self.configuration.trigger()
                    }
            }
        }
    }
    
    struct DisabledButton: View {
        let configuration: PrimitiveButtonStyle.Configuration
        let color: Color
        
        var body: some View {
            configuration.label
                .foregroundColor(.white)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: 5).fill(color))
        }
    }
}

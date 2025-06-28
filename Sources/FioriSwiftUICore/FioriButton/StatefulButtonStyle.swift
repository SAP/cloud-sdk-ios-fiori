import FioriThemeManager
import Foundation
import SwiftUI

/// An object that provides Fiori style color and interaction for `Button`.
public struct StatefulButtonStyle: PrimitiveButtonStyle {
    // TODO: style configuration struct?
    let color: Color
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
        self.color = color
        self.depressedColor = depressedColor
        self.disabledColor = disabledColor
        self.isSelectionPersistent = isSelectionPersistent
    }
    
    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each `Button` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: PrimitiveButtonStyle.Configuration) -> some View {
        StatefulButton(configuration: configuration, isSelectionPersistent: self.isSelectionPersistent) { state in
            switch state {
            case .normal:
                return FioriButtonConfiguration(foregroundColor: .white, backgroundColor: self.color)
            case .highlighted, .selected:
                return FioriButtonConfiguration(foregroundColor: .white, backgroundColor: self.depressedColor)
            default:
                return FioriButtonConfiguration(foregroundColor: .white, backgroundColor: self.disabledColor)
            }
        }
    }
}

/// An object that provides Fiori primary button style for `Button`.
public struct PrimaryButtonStyle: PrimitiveButtonStyle {
    let isSelectionPersistent: Bool
    @Environment(\.isLoading) var isLoading
    public init(isSelectionPersistent: Bool = false) {
        self.isSelectionPersistent = isSelectionPersistent
    }
    
    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each `Button` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: PrimitiveButtonStyle.Configuration) -> some View {
        StatefulButton(configuration: configuration, isSelectionPersistent: self.isSelectionPersistent) { state in
            FioriButtonStyleProvider.getPrimaryButtonStyle(state: state, isLoading: self.isLoading)
        }
    }
}

/// An object that provides the Fiori secondary button style for `Button`.
public struct SecondaryButtonStyle: PrimitiveButtonStyle {
    let colorStyle: FioriButtonColorStyle
    let isSelectionPersistent: Bool
    @Environment(\.isLoading) var isLoading
    public init(colorStyle: FioriButtonColorStyle = .tint, isSelectionPersistent: Bool = false) {
        self.colorStyle = colorStyle
        self.isSelectionPersistent = isSelectionPersistent
    }
    
    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each `Button` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: PrimitiveButtonStyle.Configuration) -> some View {
        StatefulButton(configuration: configuration, isSelectionPersistent: self.isSelectionPersistent) { state in
            FioriButtonStyleProvider.getSecondaryButtonStyle(colorStyle: self.colorStyle, for: state, isLoading: self.isLoading)
        }
    }
}

/// An object that provides the Fiori tertiary button style for `Button`.
public struct TertiaryButtonStyle: PrimitiveButtonStyle {
    let colorStyle: FioriButtonColorStyle
    let isSelectionPersistent: Bool
    @Environment(\.isLoading) var isLoading
    
    public init(colorStyle: FioriButtonColorStyle = .tint, isSelectionPersistent: Bool = false) {
        self.colorStyle = colorStyle
        self.isSelectionPersistent = isSelectionPersistent
    }
    
    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each `Button` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    public func makeBody(configuration: PrimitiveButtonStyle.Configuration) -> some View {
        StatefulButton(configuration: configuration, isSelectionPersistent: self.isSelectionPersistent) { state in
            FioriButtonStyleProvider.getTertiaryButtonStyle(colorStyle: self.colorStyle, for: state, isLoading: self.isLoading)
        }
    }
}

private struct StatefulButton: View {
    @State var pressed = false
    @Environment(\.isEnabled) var isEnabled: Bool
    var state: UIControl.State {
        if !self.isEnabled {
            return .disabled
        }
        
        return self.pressed ? (self.isSelectionPersistent ? .selected : .highlighted) : .normal
    }
    
    let configuration: PrimitiveButtonStyle.Configuration
    let isSelectionPersistent: Bool
    let fioriButtonConfiguration: (UIControl.State) -> FioriButtonConfiguration
    
    var body: some View {
        self.configuration.label
            .fioriButtonConfiguration(self.fioriButtonConfiguration(self.state))
            .gesture(self.createGesture())
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

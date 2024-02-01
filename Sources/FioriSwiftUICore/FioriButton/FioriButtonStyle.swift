import Foundation
import SwiftUI

/// The object that supplies styles to the content of `FioriButton` instances.
public protocol FioriButtonStyle {
    /// A view that represents the body of a button.
    associatedtype Body: View
    
    /// Creates a view that represents the body of a Fiori button.
    ///
    /// The system calls this method for each `FioriButton` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration: The properties of the Fiori button.
    func makeBody(configuration: Configuration) -> Self.Body

    /// The properties of a Fiori button.
    typealias Configuration = FioriButtonStyleConfiguration
}

public extension FioriButtonStyle {
    /// Return a type-erased Fiori button style.
    /// - Returns: An `AnyFioriButtonStyle` wrapping this button style.
    func eraseToAnyFioriButtonStyle() -> AnyFioriButtonStyle {
        AnyFioriButtonStyle(self)
    }
}

/// The properties of a Fiori button.
public struct FioriButtonStyleConfiguration {
    /// A type-erased label of a button.
    public struct Label: View {
        let view: AnyView
        
        init<V: View>(_ view: V) {
            self.view = AnyView(view)
        }
        
        /// The content of the label.
        public var body: some View {
            view
        }
    }

    /// The current state of the button.
    public let state: UIControl.State
    
    let _label: (UIControl.State) -> Label
    
    /// The label for the current state.
    public var label: Label {
        label(for: self.state)
    }
    
    /// Returns the label for the specific state.
    /// - Parameter state: A valid state for a button. For a Fiori button with non-persistent selection, `.normal`, `.disabled`, and `.highlighted` are supported. For a button with persistent selection, use `.selected` instead of `.highlighted`.
    /// - Returns: The label for the specific state.
    public func label(for state: UIControl.State) -> Label {
        self._label(state)
    }
}

/// A Fiori button style for the plain button.
public struct FioriPlainButtonStyle: FioriButtonStyle {
    /// Create a `FioriPrimaryButtonStyle` instance.
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = FioriButtonStyleProvider.getPlainButtonStyle(state: configuration.state)
        
        return configuration.label
            .fioriButtonConfiguration(config)
    }
}

/// A Fiori button style for the primary button.
public struct FioriPrimaryButtonStyle: FioriButtonStyle {
    /// Create a `FioriPrimaryButtonStyle` instance.
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = FioriButtonStyleProvider.getPrimaryButtonStyle(state: configuration.state)
        
        return configuration.label
            .fioriButtonConfiguration(config)
    }
}

/// A Fiori button style for the secondary button.
public struct FioriSecondaryButtonStyle: FioriButtonStyle {
    private let colorStyle: FioriButtonColorStyle
    
    /// Create a `FioriSecondaryButtonStyle` instance.
    /// - Parameter colorStyle: The color style used for this button style.
    public init(colorStyle: FioriButtonColorStyle = .tint) {
        self.colorStyle = colorStyle
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = FioriButtonStyleProvider.getSecondaryButtonStyle(colorStyle: self.colorStyle, for: configuration.state)
        
        return configuration.label
            .fioriButtonConfiguration(config)
    }
}

/// A Fiori button style for the tertiary button.
public struct FioriTertiaryButtonStyle: FioriButtonStyle {
    private let colorStyle: FioriButtonColorStyle
    
    /// Create a `FioriTertiaryButtonStyle` instance.
    /// - Parameter colorStyle: The color style used for this button style.
    public init(colorStyle: FioriButtonColorStyle = .tint) {
        self.colorStyle = colorStyle
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = FioriButtonStyleProvider.getTertiaryButtonStyle(colorStyle: self.colorStyle, for: configuration.state)
        
        return configuration.label
            .fioriButtonConfiguration(config)
    }
}

/// The color style of a Fiori button.
public enum FioriButtonColorStyle {
    case normal
    case tint
    case negative
}

public extension View {
    /// Sets the style for Fiori buttons within this view.
    ///     HStack {
    ///         FioriButton { _ in "A" }
    ///         FioriButton { _ in "B" }
    ///     }
    ///     .fioriButtonStyle(CustomFioriButtonStyle())
    ///
    /// - Parameter style: A Fiori button style instance.
    /// - Returns: A view that uses the style provided.
    func fioriButtonStyle<S>(_ style: S) -> some View where S: FioriButtonStyle {
        self.environment(\.fioriButtonStyle, AnyFioriButtonStyle(style))
    }
}

struct FioriButtonLabelKey: EnvironmentKey {
    static let defaultValue = AnyFioriButtonStyle(FioriPrimaryButtonStyle())
}

extension EnvironmentValues {
    var fioriButtonStyle: AnyFioriButtonStyle {
        get { self[FioriButtonLabelKey.self] }
        set { self[FioriButtonLabelKey.self] = newValue }
    }
}

/// A type-erased Fiori button style.
public struct AnyFioriButtonStyle: FioriButtonStyle {
    let view: (FioriButtonStyleConfiguration) -> AnyView
    
    public init<S: FioriButtonStyle>(_ style: S) {
        self.view = {
            AnyView(style.makeBody(configuration: $0))
        }
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        self.view(configuration)
    }
}

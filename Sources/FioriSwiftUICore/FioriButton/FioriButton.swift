import Foundation
import SwiftUI

/// A control which is able to display different views depending on current tap state and responds to action.
///
/// # Create a fiori button by providing an action and different labels depending on states.
///
///     FioriButton(action: { state in
///         print("Button tapped with state: \(state)")
///     },
///     label: { state in
///         switch state {
///         case .normal:
///             Text("Normal")
///         case .highlighted:
///             HStack {
///                 Image(systemName: "checkmark")
///                 Text("Highlighted")
///             }
///         case .selected:
///             HStack {
///                 Image(systemName: "checkmark")
///                 Text("Selected")
///             }
///         default:
///             Text("Disabled")
///         }
///     })
///
/// # Create a fiori button with title text.
///
///     FioriButton { _ in "Start" }
///
/// # Style customization
///
/// Create a style that conforms to `FioriButtonStyle`. To set the style to a fiori button or to a container within which all fiori buttons should share the same style, use the `fioriButtonStyle(_:)` modifier.
///
///     struct CustomFioriButtonStyle: FioriButtonStyle {
///         func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
///             let color: Color
///             switch configuration.state {
///             case .normal:
///                 color = Color.preferredColor(.tintColor)
///             case .highlighted, .selected:
///                 color = .red
///             default:
///                 color = Color.preferredColor(.primary3)
///             }
///
///             return configuration.label
///                 .foregroundColor(.white)
///                 .padding(50)
///                 .background(Circle().fill(color))
///         }
///     }
public struct FioriButton<Label: View>: View {
    let action: ((UIControl.State) -> Void)?
    let label: (UIControl.State) -> Label
    let isSelectionPersistent: Bool
    
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.fioriButtonStyle) private var fioriButtonStyle
    @State private var _state: UIControl.State = .normal

    var state: UIControl.State {
        if !self.isEnabled {
            return .disabled
        }
            
        return self._state
    }
    
    /// Create a fiori button.
    /// - Parameters:
    ///   - isSelectionPersistent: A boolean value determines whether the selection should be persistent or not.
    ///   - action: Action triggered when tap on button.
    ///   - label: A closure that returns a label for each state. For a button with non-persistent selection, `.normal`, `.disabled`, `.highlighted` are supported. For a button with persistent selection, use `.selected` instead of `.highlighted`.
    public init(isSelectionPersistent: Bool = false,
                action: ((UIControl.State) -> Void)? = nil,
                @ViewBuilder label: @escaping (UIControl.State) -> Label)
    {
        self.action = action
        self.label = label
        self.isSelectionPersistent = isSelectionPersistent
    }

    /// The content of the button.
    public var body: some View {
        let config = FioriButtonStyleConfiguration(state: state) { state in
            let v = self.label(state)
            return FioriButtonStyleConfiguration.Label(v)
        }
        
        return ZStack {
            self.fioriButtonStyle.makeBody(configuration: config)
        }
        .gesture(createGesture())
    }
    
    func createGesture() -> some Gesture {
        if self.isSelectionPersistent {
            return DragGesture(minimumDistance: 0)
                .onChanged { _ in
                }
                .onEnded { _ in
                    self._state = self.state == .normal ? .selected : .normal
                    self.action?(state)
                }
        } else {
            return DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    self._state = .highlighted
                }
                .onEnded { _ in
                    self._state = .normal
                    self.action?(state)
                }
        }
    }
}

public extension FioriButton where Label == Text {
    /// Create a fiori button with title text.
    /// - Parameters:
    ///   - isSelectionPersistent: A boolean value determines whether the button should be persistent or not.
    ///   - action: Action triggered when tap on button.
    ///   - title: A closure that returns a title text for each state. For a button with non-persistent selection, `.normal`, `.disabled`, `.highlighted` are supported. For a button with persistent selection, use `.selected` instead of `.highlighted`.
    init<S: StringProtocol>(isSelectionPersistent: Bool = false,
                            action: ((UIControl.State) -> Void)? = nil,
                            title: @escaping (UIControl.State) -> S)
    {
        self.isSelectionPersistent = isSelectionPersistent
        self.action = action
        self.label = {
            Text(title($0))
        }
    }
}

/// The object that supplies styles to the content of `FioriButton` instances.
public protocol FioriButtonStyle {
    /// A view that represents the body of a button.
    associatedtype Body: View
    
    /// Creates a view that represents the body of a fiori button.
    ///
    /// The system calls this method for each ``FioriButton`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the fiori button.
    func makeBody(configuration: Configuration) -> Self.Body

    /// The properties of a fiori button.
    typealias Configuration = FioriButtonStyleConfiguration
}

/// The properties of a fiori button.
public struct FioriButtonStyleConfiguration {
    /// A type-erased label of a button.
    public struct Label: View {
        let view: AnyView
        
        init<V: View>(_ view: V) {
            self.view = AnyView(view)
        }
        
        /// The content of label.
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
    /// - Parameter state: A valid state for button. For a fiori button with non-persistent selection, `.normal`, `.disabled`, `.highlighted` are supported. For a button with persistent selection, use `.selected` instead of `.highlighted`.
    /// - Returns: The label for the specific state.
    public func label(for state: UIControl.State) -> Label {
        self._label(state)
    }
}

struct DefaultFioriButtonStyle: FioriButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let color: Color
        switch configuration.state {
        case .normal:
            color = Color.preferredColor(.tintColor)
        case .highlighted, .selected:
            color = Color.preferredColor(.tintColorTapState)
        default:
            color = Color.preferredColor(.primary3)
        }
        
        return configuration.label
            .foregroundColor(.white)
            .padding(15)
            .background(RoundedRectangle(cornerRadius: 5).fill(color))
    }
}

public extension View {
    /// Sets the style for fiori buttons within this view.
    ///     HStack {
    ///         FioriButton { _ in "A" }
    ///         FioriButton { _ in "B" }
    ///     }
    ///     .fioriButtonStyle(CustomFioriButtonStyle())
    ///
    /// - Parameter style: A fiori button style instance.
    /// - Returns: A view that uses the style provided.
    func fioriButtonStyle<S>(_ style: S) -> some View where S: FioriButtonStyle {
        self.environment(\.fioriButtonStyle, AnyFioriButtonStyle(style))
    }
}

struct FioriButtonLabelKey: EnvironmentKey {
    static let defaultValue = AnyFioriButtonStyle(DefaultFioriButtonStyle())
}

extension EnvironmentValues {
    var fioriButtonStyle: AnyFioriButtonStyle {
        get { self[FioriButtonLabelKey.self] }
        set { self[FioriButtonLabelKey.self] = newValue }
    }
}

struct AnyFioriButtonStyle: FioriButtonStyle {
    let view: (FioriButtonStyleConfiguration) -> AnyView
    
    init<S: FioriButtonStyle>(_ style: S) {
        self.view = {
            AnyView(style.makeBody(configuration: $0))
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        self.view(configuration)
    }
}

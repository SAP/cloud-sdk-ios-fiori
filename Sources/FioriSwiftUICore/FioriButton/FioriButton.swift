import Foundation
import SwiftUI

public struct FioriButton<Label: View>: View {
    let action: (UIControl.State) -> Void
    let label: (UIControl.State) -> Label
    let isSelectionPersistent: Bool
    
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.fioriButtonLabel) private var fioriButtonLabel
    @State private var _state: UIControl.State = .normal

    var state: UIControl.State {
        get {
            if !self.isEnabled {
                return .disabled
            }
            
            return self._state
        }
        
        set {
            self._state = newValue
        }
    }

    public init(isSelectionPersistent: Bool = false,
                action: @escaping (UIControl.State) -> Void,
                @ViewBuilder label: @escaping (UIControl.State) -> Label)
    {
        self.action = action
        self.label = label
        self.isSelectionPersistent = isSelectionPersistent
    }

    public var body: some View {
        let config = FioriButtonStyleConfiguration(state: state) { state in
            let v = self.label(state)
            return FioriButtonStyleConfiguration.Label(v)
        }
        
        return ZStack {
            self.fioriButtonLabel(config)
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
                    self.action(state)
                }
        } else {
            return DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    self._state = .highlighted
                }
                .onEnded { _ in
                    self._state = .normal
                    self.action(state)
                }
        }
    }
}

public extension FioriButton where Label == Text {
    init<S: StringProtocol>(isSelectionPersistent: Bool = false,
                            action: @escaping (UIControl.State) -> Void,
                            title: @escaping (UIControl.State) -> S)
    {
        self.isSelectionPersistent = isSelectionPersistent
        self.action = action
        self.label = {
            Text(title($0))
        }
    }
}

public protocol FioriButtonStyle {
    /// A view that represents the body of a button.
    associatedtype Body: View
    
    /// Creates a view that represents the body of a button.
    ///
    /// The system calls this method for each ``Button`` instance in a view
    /// hierarchy where this style is the current button style.
    ///
    /// - Parameter configuration : The properties of the button.
    func makeBody(configuration: Configuration) -> Self.Body

    /// The properties of a button.
    typealias Configuration = FioriButtonStyleConfiguration
}

public struct FioriButtonStyleConfiguration {
    /// A type-erased label of a button.
    public struct Label: View {
        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
//        public typealias Body = Never
        
        let view: AnyView
        
        init<V: View>(_ view: V) {
            self.view = AnyView(view)
        }
        
        public var body: some View {
            view
        }
    }

    public let state: UIControl.State
    let _label: (UIControl.State) -> Label
    
    /// A view that describes the effect of calling the button's action.
    public var label: Label {
        label(for: self.state)
    }
    
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
    func fioriButtonStyle<S>(_ style: S) -> some View where S: FioriButtonStyle {
        let label: (FioriButtonStyleConfiguration) -> AnyView = { config in
            AnyView(style.makeBody(configuration: config))
        }
        return self.environment(\.fioriButtonLabel, label)
    }
}

struct FioriButtonLabelKey: EnvironmentKey {
    static let defaultValue: (FioriButtonStyleConfiguration) -> AnyView = { config in
        AnyView(DefaultFioriButtonStyle().makeBody(configuration: config))
    }
}

extension EnvironmentValues {
    var fioriButtonLabel: (FioriButtonStyleConfiguration) -> AnyView {
        get { self[FioriButtonLabelKey.self] }
        set { self[FioriButtonLabelKey.self] = newValue }
    }
}

import Foundation
import SwiftUI

/// A control which is able to display different views depending on current tap state and responds to action.
///
/// ## Create a Fiori button by providing an action and different labels depending on states.
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
/// ## Create a Fiori button with title text.
///
///     FioriButton { _ in "Start" }
///
/// ## Style customization
///
/// Create a style that conforms to `FioriButtonStyle`. There are three pre-defined fiori button styles: `FioriPrimaryButtonStyle`, `FioriSecondaryButtonStyle` and `FioriTertiaryButtonStyle`. To set the style to a `FioriButton` or to a container within which all fiori buttons should share the same style, use the `fioriButtonStyle(_:)` modifier.
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
///
///  To apply these styles to a `Button`, use `PrimaryButtonStyle`, `SecondaryButtonStyle` and `TertiaryButtonStyle` instead.
public struct FioriButton<Label: View>: View {
    let action: ((UIControl.State) -> Void)?
    let label: (UIControl.State) -> Label
    let isSelectionPersistent: Bool
    private let touchAreaInset: CGFloat = 50
    
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
        
        return Group {
            if isSelectionPersistent {
                self.fioriButtonStyle.makeBody(configuration: config)
                    .overlay(GeometryReader { proxy in
                        Color.clear.contentShape(Rectangle()).gesture(createGesture(proxy.size))
                    })
            } else {
                Button {
                    action?(.normal)
                } label: {
                    EmptyView()
                }
                .buttonStyle(_ButtonStyleImpl(fioriButtonStyle: fioriButtonStyle, label: label, isEnabled: isEnabled))
            }
        }
    }
    
    func createGesture(_ size: CGSize) -> some Gesture {
        let touchArea = CGRect(origin: .zero, size: size).insetBy(dx: -self.touchAreaInset, dy: -self.touchAreaInset)
        var isCancelled = false
        
        return DragGesture(minimumDistance: 0)
            .onChanged { value in
                guard !isCancelled else {
                    return
                }
                
                if !touchArea.contains(value.location) {
                    isCancelled = true
                }
            }
            .onEnded { _ in
                defer {
                    isCancelled = false
                }
                
                guard !isCancelled else {
                    return
                }
                
                self._state = self.state == .normal ? .selected : .normal
                self.action?(state)
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

private struct _ButtonStyleImpl<Label: View>: ButtonStyle {
    let fioriButtonStyle: AnyFioriButtonStyle
    let label: (UIControl.State) -> Label
    let isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        let state: UIControl.State = self.isEnabled ? (configuration.isPressed ? .highlighted : .normal) : .disabled
        let config = FioriButtonStyleConfiguration(state: state) { state in
            let v = self.label(state)
            return FioriButtonStyleConfiguration.Label(v)
        }
        
        return ZStack {
            fioriButtonStyle.makeBody(configuration: config)
            
            configuration.label.hidden()
        }
    }
}

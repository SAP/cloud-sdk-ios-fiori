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
/// Create a style that conforms to `FioriButtonStyle`. There are three predefined Fiori button styles: `FioriPrimaryButtonStyle`, `FioriSecondaryButtonStyle`, and `FioriTertiaryButtonStyle`. To set the style to a `FioriButton` or to a container within which all Fiori buttons should share the same style, use the `fioriButtonStyle(_:)` modifier.
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
///  To apply these styles to a `Button`, use `PrimaryButtonStyle`, `SecondaryButtonStyle`, and `TertiaryButtonStyle` instead.
public struct FioriButton: View {
    let action: ((UIControl.State) -> Void)?
    let label: (UIControl.State) -> any View
    let isSelectionPersistent: Bool
    let image: (UIControl.State) -> any View
    let imagePosition: FioriButtonImagePosition
    let imageTitleSpacing: CGFloat
    private let touchAreaInset: CGFloat = 3
    
    @Environment(\.isLoading) var isLoading
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
                @ViewBuilder label: @escaping (UIControl.State) -> any View)
    {
        self.init(isSelectionPersistent: isSelectionPersistent, action: action, label: label, image: { _ in
            EmptyView()
        }, imagePosition: .leading, imageTitleSpacing: 8.0)
    }
    
    /// Create a fiori button.
    /// - Parameters:
    ///   - isSelectionPersistent: A boolean value determines whether the selection should be persistent or not.
    ///   - action: Action triggered when tap on button.
    ///   - label: A closure that returns a label for each state. For a button with non-persistent selection, `.normal`, `.disabled`, `.highlighted` are supported. For a button with persistent selection, use `.selected` instead of `.highlighted`.
    ///   - image: Image of the button.
    ///   - imagePosition: Place the image along the top, leading, bottom, or trailing edge of the button.
    ///   - imageTitleSpacing: Spacing between image and title.
    public init(isSelectionPersistent: Bool = false,
                action: ((UIControl.State) -> Void)? = nil,
                @ViewBuilder label: @escaping (UIControl.State) -> any View = { _ in EmptyView() },
                @ViewBuilder image: @escaping (UIControl.State) -> any View = { _ in EmptyView() },
                imagePosition: FioriButtonImagePosition = .leading,
                imageTitleSpacing: CGFloat = 8.0)
    {
        self.isSelectionPersistent = isSelectionPersistent
        self.action = action
        self.label = label
        self.image = image
        self.imagePosition = imagePosition
        self.imageTitleSpacing = imageTitleSpacing
    }
    
    /// Create a fiori button.
    /// - Parameters:
    ///   - isSelectionPersistent: A boolean value determines whether the selection should be persistent or not.
    ///   - action: Action triggered when tap on button.
    ///   - title: A closure that returns an attributed string for each state. For a button with non-persistent selection, `.normal`, `.disabled`, `.highlighted` are supported. For a button with persistent selection, use `.selected` instead of `.highlighted`.
    public init(isSelectionPersistent: Bool = false,
                title: @escaping (UIControl.State) -> AttributedString,
                action: ((UIControl.State) -> Void)? = nil)
    {
        self.init(isSelectionPersistent: isSelectionPersistent, action: action) {
            let text = title($0)
            Text(text)
        } image: { _ in
            EmptyView()
        }
    }
    
    /// Create a fiori button.
    /// - Parameters:
    ///   - isSelectionPersistent: A boolean value determines whether the selection should be persistent or not.
    ///   - action: Action triggered when tap on button.
    ///   - title: An attributed string for button label.
    public init(isSelectionPersistent: Bool = false,
                title: AttributedString,
                action: ((UIControl.State) -> Void)? = nil)
    {
        self.init(isSelectionPersistent: isSelectionPersistent, action: action) { _ in
            Text(title)
        } image: { _ in
            EmptyView()
        }
    }

    /// The content of the button.
    public var body: some View {
        SkeletonLoadingContainer(isLoading: self.isLoading) {
            // For menu use case, fioriButton should be based on Button
            Button {
                // This will be called when tapped for use case in Menu component
                self.action?(.normal)
            } label: {
                EmptyView()
            }
            .buttonStyle(_ButtonStyleImpl(fioriButtonStyle: self.fioriButtonStyle, label: self.label, image: self.image, imagePosition: self.imagePosition, imageTitleSpacing: self.imageTitleSpacing, isEnabled: self.isEnabled, state: self.state))
            .overlay(GeometryReader { proxy in
                Color.clear.contentShape(Rectangle()).simultaneousGesture(self.createGesture(proxy.size))
            })
            .setOnChange(of: self.isSelectionPersistent) {
                self._state = .normal
            }
            .ifApply(self.isLoading) { view in
                view.opacity(0.25)
            }
        }
    }
    
    // only handle once when gesture onChanged
    @State private var isHandledDragGestureOnChanged = false
    
    func createGesture(_ size: CGSize) -> some Gesture {
        let touchArea = CGRect(origin: .zero, size: size).insetBy(dx: 0, dy: -self.touchAreaInset)
        var isCancelled = false
        
        return DragGesture(minimumDistance: 0)
            .onChanged { value in
                guard !isCancelled else {
                    return
                }
                if !touchArea.contains(value.location) {
                    isCancelled = true
                    self._state = .normal
                } else if !self.isSelectionPersistent,
                          !self.isHandledDragGestureOnChanged
                {
                    self.isHandledDragGestureOnChanged = true
                    self._state = self.state == .normal ? .selected : .normal
                }
            }
            .onEnded { _ in
                defer {
                    isCancelled = false
                    self.isHandledDragGestureOnChanged = false
                }
                
                guard !isCancelled else {
                    return
                }
                
                if self.isSelectionPersistent {
                    self._state = self.state == .normal ? .selected : .normal
                } else {
                    self._state = .normal
                }
                self.action?(self.state)
            }
    }
}

public extension FioriButton {
    @available(*, deprecated, message: "Use other initializers with AttributedString argument instead.")
    /// Create a fiori button with title text.
    /// - Parameters:
    ///   - isSelectionPersistent: A boolean value determines whether the button should be persistent or not.
    ///   - action: Action triggered when tap on button.
    ///   - title: A closure that returns a title text for each state. For a button with non-persistent selection, `.normal`, `.disabled`, `.highlighted` are supported. For a button with persistent selection, use `.selected` instead of `.highlighted`.
    init(isSelectionPersistent: Bool = false,
         action: ((UIControl.State) -> Void)? = nil,
         title: @escaping (UIControl.State) -> some StringProtocol)
    {
        self.isSelectionPersistent = isSelectionPersistent
        self.action = action
        self.label = {
            Text(title($0))
        }
        self.image = { _ in
            EmptyView()
        }
        self.imagePosition = .leading
        self.imageTitleSpacing = 8.0
    }
}

private struct _ButtonStyleImpl: ButtonStyle {
    let fioriButtonStyle: AnyFioriButtonStyle
    let label: (UIControl.State) -> any View
    let image: (UIControl.State) -> any View
    let imagePosition: FioriButtonImagePosition
    let imageTitleSpacing: CGFloat
    let isEnabled: Bool
    let state: UIControl.State
    
    func makeBody(configuration: Configuration) -> some View {
        let config = FioriButtonStyleConfiguration(state: self.state, _label: { state in
            let v = self.label(state)
            return FioriButtonStyleConfiguration.Label(v)
        }, _image: { state in
            let v = self.image(state)
            return FioriButtonStyleConfiguration.Image(v)
        }, imagePosition: self.imagePosition, imageTitleSpacing: self.imageTitleSpacing)

        return ZStack {
            self.fioriButtonStyle.makeBody(configuration: config)
            
            configuration.label.hidden()
        }
    }
}

/// Place the image along the top, leading, bottom, or trailing edge of the button.
public enum FioriButtonImagePosition {
    /// place the image along the top edge of the button.
    case top
    /// place the image along the leading edge of the button.
    case leading
    /// place the image along the bottom edge of the button.
    case bottom
    /// place the image along the trailing edge of the button.
    case trailing
}

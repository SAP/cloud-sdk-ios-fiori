import FioriThemeManager
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
        
        init(_ view: some View) {
            self.view = AnyView(view)
        }
        
        /// The content of the label.
        public var body: some View {
            self.view
        }
    }

    /// A type-erased Image of a button.
    public struct Image: View {
        let view: AnyView
        init(_ view: some View) {
            self.view = AnyView(view)
        }

        /// The content of the Image.
        public var body: some View {
            self.view
        }
    }

    /// The current state of the button.
    public let state: UIControl.State
    
    let _label: (UIControl.State) -> Label
    let _image: (UIControl.State) -> Image
    
    /// Place the image along the top, leading, bottom, or trailing edge of the button.
    public let imagePosition: FioriButtonImagePosition
    /// Spacing between image and title.
    public let imageTitleSpacing: CGFloat
    
    /// The label for the current state.
    public var label: Label {
        label(for: self.state)
    }

    /// The Image for the current state.
    public var image: Image {
        image(for: self.state)
    }
    
    /// Returns the label for the specific state.
    /// - Parameter state: A valid state for a button. For a Fiori button with non-persistent selection, `.normal`, `.disabled`, and `.highlighted` are supported. For a button with persistent selection, use `.selected` instead of `.highlighted`.
    /// - Returns: The label for the specific state.
    public func label(for state: UIControl.State) -> Label {
        self._label(state)
    }
    
    /// Returns the Image for the specific state.
    /// - Parameter state: A valid state for a button. For a Fiori button with non-persistent selection, `.normal`, `.disabled`, and `.highlighted` are supported. For a button with persistent selection, use `.selected` instead of `.highlighted`.
    /// - Returns: The Image for the specific state.
    public func image(for state: UIControl.State) -> Image {
        self._image(state)
    }
    
    @ViewBuilder
    public func containerView(_ loadingState: FioriButtonLoadingState) -> some View {
        let showImageView = showImageView(loadingState, image: image)
        switch self.imagePosition {
        case .top:
            VStack(spacing: self.imageTitleSpacing, content: {
                showImageView
                self.label
            })
        case .leading:
            HStack(spacing: self.imageTitleSpacing, content: {
                showImageView
                self.label
            })
        case .bottom:
            VStack(spacing: self.imageTitleSpacing, content: {
                self.label
                showImageView
            })
        case .trailing:
            HStack(spacing: self.imageTitleSpacing, content: {
                self.label
                showImageView
            })
        }
    }
    
    @ViewBuilder
    private func showImageView(_ loadingState: FioriButtonLoadingState, image: Image) -> some View {
        switch loadingState {
        case .unspecified:
            image
        case .processing:
            ProgressView(value: 0).progressViewStyle(.circular)
        case .success:
            FioriIcon.status.sysEnter.font(.fiori(forTextStyle: .subheadline))
        }
    }
}

/// A Fiori button style for the plain button.
public struct FioriPlainButtonStyle: FioriButtonStyle {
    private var isLoading: Bool = false
    /// Create a `FioriPrimaryButtonStyle` instance.
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = FioriButtonStyleProvider.getPlainButtonStyle(state: configuration.state, isLoading: self.isLoading)
        
        return configuration.label
            .fioriButtonConfiguration(config)
    }
}

/// A Fiori button style for the primary button.
public struct FioriPrimaryButtonStyle: FioriButtonStyle {
    private let maxWidth: CGFloat?
    private let minHeight: CGFloat?
    private let loadingState: FioriButtonLoadingState
    private var isLoading: Bool = false
    
    /// Create a `FioriPrimaryButtonStyle` instance.
    /// - Parameters:
    ///   - maxWidth: Max width of the button visible area.
    ///   - minHeight: Min height of the button visible area.
    ///   - loadingState: Loading state of the button.
    public init(_ maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, loadingState: FioriButtonLoadingState = .unspecified, isLoading: Bool = false) {
        self.maxWidth = maxWidth
        self.minHeight = minHeight
        self.loadingState = loadingState
        self.isLoading = isLoading
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = FioriButtonStyleProvider.getPrimaryButtonStyle(state: configuration.state, loadingState: self.loadingState, isLoading: self.isLoading).withMaxWidth(self.maxWidth).withMinHeight(self.minHeight)
        
        return configuration.containerView(self.loadingState)
            .fioriButtonConfiguration(config)
    }
}

/// A Fiori button style for the secondary button.
public struct FioriSecondaryButtonStyle: FioriButtonStyle {
    private let colorStyle: FioriButtonColorStyle
    private let maxWidth: CGFloat?
    private let minHeight: CGFloat?
    private let loadingState: FioriButtonLoadingState
    private var isLoading: Bool = false
    
    /// Create a `FioriSecondaryButtonStyle` instance.
    /// - Parameters:
    ///   - colorStyle: The color style used for this button style.
    ///   - maxWidth: Max width of the button visible area.
    ///   - minHeight: Min height of the button visible area.
    ///   - loadingState: Loading state of the button.
    public init(colorStyle: FioriButtonColorStyle = .tint, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, loadingState: FioriButtonLoadingState = .unspecified, isLoading: Bool = false) {
        self.colorStyle = colorStyle
        self.maxWidth = maxWidth
        self.minHeight = minHeight
        self.loadingState = loadingState
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = FioriButtonStyleProvider.getSecondaryButtonStyle(colorStyle: self.colorStyle, for: configuration.state, loadingState: self.loadingState, isLoading: self.isLoading).withMaxWidth(self.maxWidth).withMinHeight(self.minHeight)
        
        return configuration.containerView(self.loadingState)
            .fioriButtonConfiguration(config)
    }
}

/// A Fiori button style for the tertiary button.
public struct FioriTertiaryButtonStyle: FioriButtonStyle {
    private let colorStyle: FioriButtonColorStyle
    private let maxWidth: CGFloat?
    private let minHeight: CGFloat?
    private let loadingState: FioriButtonLoadingState
    private var isLoading: Bool = false
    
    /// Create a `FioriTertiaryButtonStyle` instance.
    /// - Parameters:
    ///   - colorStyle: The color style used for this button style.
    ///   - maxWidth: Max width of the button visible area.
    ///   - minHeight: Min height of the button visible area.
    ///   - loadingState: Loading state of the button.
    public init(colorStyle: FioriButtonColorStyle = .tint, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, loadingState: FioriButtonLoadingState = .unspecified, isLoading: Bool = false) {
        self.colorStyle = colorStyle
        self.maxWidth = maxWidth
        self.minHeight = minHeight
        self.loadingState = loadingState
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = FioriButtonStyleProvider.getTertiaryButtonStyle(colorStyle: self.colorStyle, for: configuration.state, loadingState: self.loadingState, isLoading: self.isLoading).withMaxWidth(self.maxWidth).withMinHeight(self.minHeight)
        
        return configuration.containerView(self.loadingState)
            .fioriButtonConfiguration(config)
    }
}

/// A Fiori button style for the navigation bar action.
public struct FioriNavigationButtonStyle: FioriButtonStyle {
    private let colorStyle: FioriButtonColorStyle
    
    /// Create a `FioriNavigationButtonStyle` instance.
    /// - Parameters:
    ///   - colorStyle: The color style used for this button style.
    ///   - maxWidth: Max width of the button visible area.
    ///   - minHeight: Min height of the button visible area.
    ///   - loadingState: Loading state of the button.
    public init(colorStyle: FioriButtonColorStyle = .tint) {
        self.colorStyle = colorStyle
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let foregroundColor: Color
        switch configuration.state {
        case .normal:
            foregroundColor = .preferredColor(.tintColor)
        case .highlighted, .selected:
            foregroundColor = .preferredColor(.tintColorTapState)
        case .disabled:
            foregroundColor = .preferredColor(.quaternaryLabel)
        default:
            foregroundColor = .preferredColor(.separator)
        }
        let config = FioriButtonConfiguration(foregroundColor: foregroundColor,
                                              backgroundColor: Color.clear,
                                              font: .fiori(forTextStyle: .body, weight: .semibold),
                                              padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        return configuration.containerView(.unspecified)
            .fioriButtonConfiguration(config)
            .contentShape(.accessibility, .rect.scale(x: 1.4, y: 1.1))
    }
}

/// A Fiori button style that renders the button with a glass material effect.
///
/// `FioriGlassButtonStyle` leverages the system's liquid glass rendering introduced
/// in iOS 26, macOS 26, tvOS 26, and watchOS 26 to produce a translucent, frosted
/// appearance that adapts to the content behind the button.
///
/// ## Overview
///
/// Use `.fioriButtonStyle(FioriGlassButtonStyle())` to apply this style to a
/// `FioriButton` or any view that contains Fiori buttons. You can control the
/// visual treatment by passing a ``FioriButtonGlassEffectStyle`` value:
///
/// | Style | Appearance | Label color |
/// |---|---|---|
/// | `.plain` (default) | Untinted frosted glass | Primary label |
/// | `.tint` | Glass tinted with the app's tint color | White |
/// | `.systemManaged` | No glass applied; the system provides it | Primary label |
///
/// ## Layout
///
/// The button enforces a minimum tap target width of 44 pt and applies default
/// padding of 8 pt vertically and 16 pt horizontally. You can extend the button
/// to fill available width or set a custom minimum height through `maxWidth` and
/// `minHeight`.
///
/// ## Availability
///
/// This style requires iOS 26, macOS 26, tvOS 26, or watchOS 26 and later.
/// It is **not** available on visionOS, where the platform provides its own
/// depth-aware material treatments.
///
/// ## Example
///
/// ```swift
/// // Default plain glass button
/// FioriButton { _ in Text("Confirm") }
///     .fioriButtonStyle(FioriGlassButtonStyle())
///
/// // Full-width tinted glass button
/// FioriButton { _ in Text("Submit") }
///     .fioriButtonStyle(FioriGlassButtonStyle(glassEffect: .tint, maxWidth: .infinity))
///
/// // Inside a toolbar — system handles the glass background
/// ToolbarItem {
///     FioriButton { _ in Text("Done") }
///         .fioriButtonStyle(FioriGlassButtonStyle(glassEffect: .systemManaged))
/// }
/// ```
///
/// - Note: When using `.systemManaged`, do not nest this button inside another view
///   that already applies a glass effect, as doing so may produce unexpected
///   layering artifacts.
@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
@available(visionOS, unavailable)
public struct FioriGlassButtonStyle: FioriButtonStyle {
    private let glassEffect: FioriButtonGlassEffectStyle
    private let maxWidth: CGFloat?
    private let minHeight: CGFloat?
    
    /// Creates a `FioriGlassButtonStyle` instance.
    ///
    /// - Parameters:
    ///   - glassEffect: The glass effect style applied to the button. Defaults to `.plain`.
    ///     Use `.tint` to apply the app's tint color to the glass material, or `.systemManaged`
    ///     when the button is placed inside a container where the system supplies the glass background.
    ///   - maxWidth: The maximum width of the button's visible area. Pass `.infinity` to
    ///     make the button expand to fill its container. Defaults to `nil` (intrinsic size).
    ///   - minHeight: The minimum height of the button's visible area. Defaults to `nil`
    ///     (intrinsic size).
    public init(glassEffect: FioriButtonGlassEffectStyle = .plain, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil) {
        self.glassEffect = glassEffect
        self.maxWidth = maxWidth
        self.minHeight = minHeight
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let foregroundColor: Color = self.glassEffect == .tint ? .white : .preferredColor(.primaryLabel)
        
        let config = FioriButtonConfiguration(foregroundColor: foregroundColor,
                                              backgroundColor: Color.clear,
                                              font: .fiori(forTextStyle: .body, weight: .semibold),
                                              padding: EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16),
                                              maxWidth: self.maxWidth,
                                              minHeight: self.minHeight)
        return configuration.containerView(config.loadingState)
            .font(config.font)
            .foregroundColor(config.foregroundColor)
            .tint(config.foregroundColor)
            .padding(config.padding)
            .frame(minWidth: 44, maxWidth: config.maxWidth, minHeight: config.minHeight)
            .ifApply(self.glassEffect == .tint, content: {
                $0.glassEffect(.regular.tint(.preferredColor(.tintColor)))
            })
            .ifApply(self.glassEffect == .plain, content: {
                $0.glassEffect(.regular)
            })
    }
}

/// The color style of a Fiori button.
public enum FioriButtonColorStyle {
    case normal
    case tint
    case negative
}

/// Defines the visual glass effect appearance applied to a `FioriGlassButtonStyle`.
///
/// Use this enum to control how the glass material effect is rendered on a Fiori button.
/// Glass effects are available on iOS 26, macOS 26, tvOS 26, and watchOS 26 and later,
/// and are not available on visionOS.
///
/// ## Overview
///
/// There are three available styles:
///
/// - ``systemManaged``: Delegates glass rendering to the system. Use this when placing
///   the button inside a container such as a toolbar or navigation bar, where the system
///   automatically applies the appropriate glass background.
///
/// - ``plain``: Applies a standard, untinted glass material effect. The button label
///   uses the primary label color. This is the default style for `FioriGlassButtonStyle`.
///
/// - ``tint``: Applies a glass material effect tinted with the app's tint color.
///   The button label uses white to ensure legibility against the tinted background.
///
/// ## Example
///
/// ```swift
/// // Default plain glass effect
/// FioriButton { _ in Text("Confirm") }
///     .fioriButtonStyle(FioriGlassButtonStyle())
///
/// // Tinted glass effect using the app's tint color
/// FioriButton { _ in Text("Confirm") }
///     .fioriButtonStyle(FioriGlassButtonStyle(glassEffect: .tint))
///
/// // Inside a toolbar — let the system handle the glass background
/// FioriButton { _ in Text("Done") }
///     .fioriButtonStyle(FioriGlassButtonStyle(glassEffect: .systemManaged))
/// ```
public enum FioriButtonGlassEffectStyle {
    /// Delegates the glass effect rendering to the system.
    ///
    /// Use this case when the button is placed inside a container that already provides
    /// a glass background, such as a toolbar or navigation bar. The system automatically
    /// supplies the appropriate glass material, so no additional glass effect is applied
    /// by `FioriGlassButtonStyle` itself.
    case systemManaged

    /// Applies a standard, untinted glass material effect to the button.
    ///
    /// The button label uses the primary label color for legibility. This is the
    /// default glass effect style for `FioriGlassButtonStyle`.
    case plain

    /// Applies a glass material effect tinted with the app's tint color.
    ///
    /// The button label color is set to white to maintain legibility against
    /// the tinted glass background.
    case tint
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
    func fioriButtonStyle(_ style: some FioriButtonStyle) -> some View {
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
    
    public init(_ style: some FioriButtonStyle) {
        self.view = {
            AnyView(style.makeBody(configuration: $0))
        }
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        self.view(configuration)
    }
}

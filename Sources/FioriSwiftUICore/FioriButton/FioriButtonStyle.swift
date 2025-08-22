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
    func containerView(_ loadingState: FioriButtonLoadingState) -> some View {
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
                                              padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),)
        return configuration.containerView(.unspecified)
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

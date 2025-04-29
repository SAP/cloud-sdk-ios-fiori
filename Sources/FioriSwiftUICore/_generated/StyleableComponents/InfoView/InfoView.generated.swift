// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `InfoView` is a multifunctional view for displaying Information or Splash screen.
/// The UI elements can be displayed or hidden depending on functionality.
/// The text properties must be set before displaying the view.
///
/// ## Initialization Parameters
/// - Required:
///   - title: The primary heading text (AttributedString or ViewBuilder)
/// - Optional:
///   - descriptionText: Supplemental information text
///   - action: Primary action control
///   - secondaryAction: Secondary action control
///   - loadingIndicator: Loading state visualization
///
/// ## Usage
/// ## AttributedString Shortcut (Quick Setup)
/// ```
/// InfoView(
///     title: AttributedString("Title"),
///     descriptionText: AttributedString("Description Text"),
///     action: FioriButton(title: "Update Now") {
///         startUpdate()
///     },
///     secondaryAction: FioriButton(title: "Remind Later") {
///         scheduleReminder()
///     }
/// )
/// ```
///
/// ## ViewBuilder Approach (Fully Customizable)
/// ```
/// // Custom loading indicator with red circular style
/// let loadingIndicator = LoadingIndicator(
///     title: { Text("") },
///     progress: {
///         ProgressView()
///             .progressViewStyle(CircularProgressViewStyle(tint: .red))
///     },
///     isPresented: .constant(true)
/// )
///
/// InfoView(
///     title: {
///         HStack(spacing: 8) {
///             Image(systemName: "exclamationmark.triangle.fill")
///                 .foregroundColor(.yellow)
///             Text("Title")
///                 .font(.headline)
///         }
///     },
///     descriptionText: {
///         Text(AttributedString(self.model.descriptionText ?? "")) // Dynamic title from model
///             .foregroundColor(.blue)  // Custom text color
///     },
///     action: {
///         Toggle("Trust Device", isOn: $trustDevice)
///             .toggleStyle(.switch)
///     },
///     secondaryAction: {
///         Button("Start Tutorial") {
///             print("InfoView secondary button clicked")
///         }
///     },
///     loadingIndicator: { loadingIndicator }  // Customized indicator
/// )
/// ```
public struct InfoView {
    let title: any View
    let descriptionText: any View
    let action: any View
    let secondaryAction: any View
    let loadingIndicator: any View

    @Environment(\.infoViewStyle) var style

    var componentIdentifier: String = InfoView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder descriptionText: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() },
                @ViewBuilder secondaryAction: () -> any View = { EmptyView() },
                @ViewBuilder loadingIndicator: () -> any View = { EmptyView() },
                componentIdentifier: String? = InfoView.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.descriptionText = DescriptionText(descriptionText: descriptionText, componentIdentifier: componentIdentifier)
        self.action = Action(action: action, componentIdentifier: componentIdentifier)
        self.secondaryAction = SecondaryAction(secondaryAction: secondaryAction, componentIdentifier: componentIdentifier)
        self.loadingIndicator = loadingIndicator()
        self.componentIdentifier = componentIdentifier ?? InfoView.identifier
    }
}

public extension InfoView {
    static let identifier = "fiori_infoview_component"
}

public extension InfoView {
    init(title: AttributedString,
         descriptionText: AttributedString? = nil,
         action: FioriButton? = nil,
         secondaryAction: FioriButton? = nil,
         loadingIndicator: LoadingIndicator? = nil)
    {
        self.init(title: { Text(title) }, descriptionText: { OptionalText(descriptionText) }, action: { action }, secondaryAction: { secondaryAction }, loadingIndicator: { loadingIndicator })
    }
}

public extension InfoView {
    init(_ configuration: InfoViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: InfoViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.descriptionText = configuration.descriptionText
        self.action = configuration.action
        self.secondaryAction = configuration.secondaryAction
        self.loadingIndicator = configuration.loadingIndicator
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension InfoView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), descriptionText: .init(self.descriptionText), action: .init(self.action), secondaryAction: .init(self.secondaryAction), loadingIndicator: .init(self.loadingIndicator))).typeErased
                .transformEnvironment(\.infoViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension InfoView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        InfoView(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), descriptionText: .init(self.descriptionText), action: .init(self.action), secondaryAction: .init(self.secondaryAction), loadingIndicator: .init(self.loadingIndicator)))
            .shouldApplyDefaultStyle(false)
            .infoViewStyle(InfoViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

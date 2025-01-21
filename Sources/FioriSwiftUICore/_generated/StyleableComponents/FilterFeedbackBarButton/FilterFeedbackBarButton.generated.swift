// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct FilterFeedbackBarButton {
    let icon: any View
    let title: any View
    /// Whether the item is selected or not
    let isSelected: Bool
    /// The custom spacing between icon and title.
    let spacing: CGFloat

    @Environment(\.filterFeedbackBarButtonStyle) var style

    var componentIdentifier: String = FilterFeedbackBarButton.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                isSelected: Bool,
                spacing: CGFloat = 4,
                componentIdentifier: String? = FilterFeedbackBarButton.identifier)
    {
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.isSelected = isSelected
        self.spacing = spacing
        self.componentIdentifier = componentIdentifier ?? FilterFeedbackBarButton.identifier
    }
}

public extension FilterFeedbackBarButton {
    static let identifier = "fiori_filterfeedbackbarbutton_component"
}

public extension FilterFeedbackBarButton {
    init(icon: Image? = nil,
         title: AttributedString,
         isSelected: Bool,
         spacing: CGFloat = 4)
    {
        self.init(icon: { icon }, title: { Text(title) }, isSelected: isSelected, spacing: spacing)
    }
}

public extension FilterFeedbackBarButton {
    init(_ configuration: FilterFeedbackBarButtonConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FilterFeedbackBarButtonConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.title = configuration.title
        self.isSelected = configuration.isSelected
        self.spacing = configuration.spacing
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension FilterFeedbackBarButton: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), isSelected: self.isSelected, spacing: self.spacing)).typeErased
                .transformEnvironment(\.filterFeedbackBarButtonStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension FilterFeedbackBarButton {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        FilterFeedbackBarButton(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), isSelected: self.isSelected, spacing: self.spacing))
            .shouldApplyDefaultStyle(false)
            .filterFeedbackBarButtonStyle(FilterFeedbackBarButtonFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

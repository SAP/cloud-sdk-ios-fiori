// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AINotice {
    let icon: any View
    ///  An `AttributedString` representing the AI notice message.
    let description: AttributedString?
    /// An `AttributedString` that triggers an action to view more details.
    let actionLabel: AttributedString?
    /// A callback triggered when the actionLabel is clicked to display more message details.
    let viewMoreAction: (() -> Void)?
    /// The`HorizontalAlignment` of the AINotice view. The default value is `leading`.
    let viewAlignment: HorizontalAlignment

    @Environment(\.aINoticeStyle) var style

    var componentIdentifier: String = AINotice.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                description: AttributedString? = nil,
                actionLabel: AttributedString? = nil,
                viewMoreAction: (() -> Void)? = nil,
                viewAlignment: HorizontalAlignment = .leading,
                componentIdentifier: String? = AINotice.identifier)
    {
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.description = description
        self.actionLabel = actionLabel
        self.viewMoreAction = viewMoreAction
        self.viewAlignment = viewAlignment
        self.componentIdentifier = componentIdentifier ?? AINotice.identifier
    }
}

public extension AINotice {
    static let identifier = "fiori_ainotice_component"
}

public extension AINotice {
    init(icon: Image? = nil,
         description: AttributedString? = nil,
         actionLabel: AttributedString? = nil,
         viewMoreAction: (() -> Void)? = nil,
         viewAlignment: HorizontalAlignment = .leading)
    {
        self.init(icon: { icon }, description: description, actionLabel: actionLabel, viewMoreAction: viewMoreAction, viewAlignment: viewAlignment)
    }
}

public extension AINotice {
    init(_ configuration: AINoticeConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AINoticeConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.description = configuration.description
        self.actionLabel = configuration.actionLabel
        self.viewMoreAction = configuration.viewMoreAction
        self.viewAlignment = configuration.viewAlignment
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AINotice: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), description: self.description, actionLabel: self.actionLabel, viewMoreAction: self.viewMoreAction, viewAlignment: self.viewAlignment)).typeErased
                .transformEnvironment(\.aINoticeStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AINotice {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AINotice(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), description: self.description, actionLabel: self.actionLabel, viewMoreAction: self.viewMoreAction, viewAlignment: self.viewAlignment))
            .shouldApplyDefaultStyle(false)
            .aINoticeStyle(AINoticeFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

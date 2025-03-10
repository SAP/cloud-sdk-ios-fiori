// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol EULAViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: EULAViewConfiguration) -> Body
}

struct AnyEULAViewStyle: EULAViewStyle {
    let content: (EULAViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (EULAViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: EULAViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct EULAViewConfiguration {
    public var componentIdentifier: String = "fiori_eulaview_component"
    public let title: Title
    public let bodyText: BodyText
    public let agreeAction: AgreeAction
    public let disagreeAction: DisagreeAction
    public let cancelAction: CancelAction
    public let didAgree: (() -> Void)?
    public let didDisagree: (() -> Void)?
    public let didCancel: (() -> Void)?

    public typealias Title = ConfigurationViewWrapper
    public typealias BodyText = ConfigurationViewWrapper
    public typealias AgreeAction = ConfigurationViewWrapper
    public typealias DisagreeAction = ConfigurationViewWrapper
    public typealias CancelAction = ConfigurationViewWrapper
}

extension EULAViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct EULAViewFioriStyle: EULAViewStyle {
    public func makeBody(_ configuration: EULAViewConfiguration) -> some View {
        EULAView(configuration)
            .titleStyle(TitleFioriStyle(eULAViewConfiguration: configuration))
            .bodyTextStyle(BodyTextFioriStyle(eULAViewConfiguration: configuration))
            .agreeActionStyle(AgreeActionFioriStyle(eULAViewConfiguration: configuration))
            .disagreeActionStyle(DisagreeActionFioriStyle(eULAViewConfiguration: configuration))
            .cancelActionStyle(CancelActionFioriStyle(eULAViewConfiguration: configuration))
    }
}

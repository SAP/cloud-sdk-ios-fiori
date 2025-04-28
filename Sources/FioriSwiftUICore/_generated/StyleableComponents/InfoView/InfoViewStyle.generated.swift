// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol InfoViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: InfoViewConfiguration) -> Body
}

struct AnyInfoViewStyle: InfoViewStyle {
    let content: (InfoViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (InfoViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: InfoViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct InfoViewConfiguration {
    public var componentIdentifier: String = "fiori_infoview_component"
    public let title: Title
    public let descriptionText: DescriptionText
    public let action: Action
    public let secondaryAction: SecondaryAction
    public let loadingIndicator: LoadingIndicator?

    public typealias Title = ConfigurationViewWrapper
    public typealias DescriptionText = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
    public typealias SecondaryAction = ConfigurationViewWrapper
}

extension InfoViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct InfoViewFioriStyle: InfoViewStyle {
    public func makeBody(_ configuration: InfoViewConfiguration) -> some View {
        InfoView(configuration)
            .titleStyle(TitleFioriStyle(infoViewConfiguration: configuration))
            .descriptionTextStyle(DescriptionTextFioriStyle(infoViewConfiguration: configuration))
            .actionStyle(ActionFioriStyle(infoViewConfiguration: configuration))
            .secondaryActionStyle(SecondaryActionFioriStyle(infoViewConfiguration: configuration))
    }
}

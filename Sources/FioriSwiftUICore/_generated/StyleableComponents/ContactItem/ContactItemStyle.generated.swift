// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ContactItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ContactItemConfiguration) -> Body
}

struct AnyContactItemStyle: ContactItemStyle {
    let content: (ContactItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ContactItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ContactItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ContactItemConfiguration {
    public var componentIdentifier: String = "fiori_contactitem_component"
    public let title: Title
    public let subtitle: Subtitle
    public let description: Description
    public let detailImage: DetailImage
    public let activityItems: ActivityItems

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias DetailImage = ConfigurationViewWrapper
    public typealias ActivityItems = ConfigurationViewWrapper
}

extension ContactItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct ContactItemFioriStyle: ContactItemStyle {
    public func makeBody(_ configuration: ContactItemConfiguration) -> some View {
        ContactItem(configuration)
            .titleStyle(TitleFioriStyle(contactItemConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(contactItemConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(contactItemConfiguration: configuration))
            .detailImageStyle(DetailImageFioriStyle(contactItemConfiguration: configuration))
            .activityItemsStyle(ActivityItemsFioriStyle(contactItemConfiguration: configuration))
    }
}

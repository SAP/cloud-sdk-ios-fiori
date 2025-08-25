// Generated using Sourcery 2.2.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol WhatsNewListItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: WhatsNewListItemConfiguration) -> Body
}

struct AnyWhatsNewListItemStyle: WhatsNewListItemStyle {
    let content: (WhatsNewListItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (WhatsNewListItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: WhatsNewListItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct WhatsNewListItemConfiguration {
    public var componentIdentifier: String = "fiori_whatsnewlistitem_component"
    public let detailImage: DetailImage
    public let title: Title
    public let subtitle: Subtitle

    public typealias DetailImage = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
}

extension WhatsNewListItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct WhatsNewListItemFioriStyle: WhatsNewListItemStyle {
    public func makeBody(_ configuration: WhatsNewListItemConfiguration) -> some View {
        WhatsNewListItem(configuration)
            .detailImageStyle(DetailImageFioriStyle(whatsNewListItemConfiguration: configuration))
            .titleStyle(TitleFioriStyle(whatsNewListItemConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(whatsNewListItemConfiguration: configuration))
    }
}

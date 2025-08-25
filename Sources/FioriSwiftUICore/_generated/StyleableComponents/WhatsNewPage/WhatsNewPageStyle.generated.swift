// Generated using Sourcery 2.2.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol WhatsNewPageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: WhatsNewPageConfiguration) -> Body
}

struct AnyWhatsNewPageStyle: WhatsNewPageStyle {
    let content: (WhatsNewPageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (WhatsNewPageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: WhatsNewPageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct WhatsNewPageConfiguration {
    public var componentIdentifier: String = "fiori_whatsnewpage_component"
    public let detailImage: DetailImage
    public let title: Title
    public let description: Description
    public let imageSize: CGSize?
    public let isImageExpanded: Bool

    public typealias DetailImage = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
}

extension WhatsNewPageConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct WhatsNewPageFioriStyle: WhatsNewPageStyle {
    public func makeBody(_ configuration: WhatsNewPageConfiguration) -> some View {
        WhatsNewPage(configuration)
            .detailImageStyle(DetailImageFioriStyle(whatsNewPageConfiguration: configuration))
            .titleStyle(TitleFioriStyle(whatsNewPageConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(whatsNewPageConfiguration: configuration))
    }
}

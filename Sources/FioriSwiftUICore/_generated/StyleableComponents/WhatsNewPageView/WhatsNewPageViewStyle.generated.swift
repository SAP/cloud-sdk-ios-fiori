// Generated using Sourcery 2.2.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol WhatsNewPageViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: WhatsNewPageViewConfiguration) -> Body
}

struct AnyWhatsNewPageViewStyle: WhatsNewPageViewStyle {
    let content: (WhatsNewPageViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (WhatsNewPageViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: WhatsNewPageViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct WhatsNewPageViewConfiguration {
    public var componentIdentifier: String = "fiori_whatsnewpageview_component"
    public let whatsNewPages: WhatsNewPages
    @Binding public var currentIndex: Int?
    public let didClose: (() -> Void)?
    public let didFinish: (() -> Void)?

    public typealias WhatsNewPages = ConfigurationViewWrapper
}

extension WhatsNewPageViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct WhatsNewPageViewFioriStyle: WhatsNewPageViewStyle {
    public func makeBody(_ configuration: WhatsNewPageViewConfiguration) -> some View {
        WhatsNewPageView(configuration)
    }
}

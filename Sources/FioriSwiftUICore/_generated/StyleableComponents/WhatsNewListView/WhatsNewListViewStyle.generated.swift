// Generated using Sourcery 2.2.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol WhatsNewListViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: WhatsNewListViewConfiguration) -> Body
}

struct AnyWhatsNewListViewStyle: WhatsNewListViewStyle {
    let content: (WhatsNewListViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (WhatsNewListViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: WhatsNewListViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct WhatsNewListViewConfiguration {
    public var componentIdentifier: String = "fiori_whatsnewlistview_component"
    public let whatsNewListItems: WhatsNewListItems
    public let didClose: (() -> Void)?
    public let didFinish: (() -> Void)?

    public typealias WhatsNewListItems = any IndexedViewContainer
}

extension WhatsNewListViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct WhatsNewListViewFioriStyle: WhatsNewListViewStyle {
    public func makeBody(_ configuration: WhatsNewListViewConfiguration) -> some View {
        WhatsNewListView(configuration)
    }
}

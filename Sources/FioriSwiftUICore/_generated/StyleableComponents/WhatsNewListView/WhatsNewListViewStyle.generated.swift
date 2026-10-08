// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol WhatsNewListViewStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: WhatsNewListViewConfiguration) -> Body
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

struct WhatsNewListViewDefaultStyle: WhatsNewListViewStyle {
    nonisolated init() {}

    func makeBody(_ configuration: WhatsNewListViewConfiguration) -> some View {
        WhatsNewListView(configuration)
            .whatsNewListViewStyle(WhatsNewListViewFioriStyle())
            .modifier(WhatsNewListViewStyleModifier(style: WhatsNewListViewBaseStyle()))
    }
}

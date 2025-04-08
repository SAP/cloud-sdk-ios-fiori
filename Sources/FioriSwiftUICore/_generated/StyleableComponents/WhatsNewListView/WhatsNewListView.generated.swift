// Generated using Sourcery 2.2.6 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct WhatsNewListView {
    let whatsNewListItems: any IndexedViewContainer
    let didClose: (() -> Void)?
    let didFinish: (() -> Void)?

    @Environment(\.whatsNewListViewStyle) var style

    var componentIdentifier: String = WhatsNewListView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@IndexedViewBuilder whatsNewListItems: () -> any IndexedViewContainer = { EmptyView() },
                didClose: (() -> Void)? = nil,
                didFinish: (() -> Void)? = nil,
                componentIdentifier: String? = WhatsNewListView.identifier)
    {
        self.whatsNewListItems = whatsNewListItems()
        self.didClose = didClose
        self.didFinish = didFinish
        self.componentIdentifier = componentIdentifier ?? WhatsNewListView.identifier
    }
}

public extension WhatsNewListView {
    static let identifier = "fiori_whatsnewlistview_component"
}

public extension WhatsNewListView {
    init(whatsNewListItems: [WhatsNewListItem] = [],
         didClose: (() -> Void)? = nil,
         didFinish: (() -> Void)? = nil)
    {
        self.init(whatsNewListItems: { _WhatsNewListItemsContainer(whatsNewListItems) }, didClose: didClose, didFinish: didFinish)
    }
}

public extension WhatsNewListView {
    init(_ configuration: WhatsNewListViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: WhatsNewListViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.whatsNewListItems = configuration.whatsNewListItems
        self.didClose = configuration.didClose
        self.didFinish = configuration.didFinish
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension WhatsNewListView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, whatsNewListItems: self.whatsNewListItems, didClose: self.didClose, didFinish: self.didFinish)).typeErased
                .transformEnvironment(\.whatsNewListViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension WhatsNewListView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        WhatsNewListView(.init(componentIdentifier: self.componentIdentifier, whatsNewListItems: self.whatsNewListItems, didClose: self.didClose, didFinish: self.didFinish))
            .shouldApplyDefaultStyle(false)
            .whatsNewListViewStyle(WhatsNewListViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

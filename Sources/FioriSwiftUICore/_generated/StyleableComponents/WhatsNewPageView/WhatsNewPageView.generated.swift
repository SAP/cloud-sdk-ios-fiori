// Generated using Sourcery 2.2.6 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct WhatsNewPageView {
    let whatsNewPages: any IndexedViewContainer
    let didClose: (() -> Void)?
    let didFinish: (() -> Void)?

    @Environment(\.whatsNewPageViewStyle) var style

    var componentIdentifier: String = WhatsNewPageView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@IndexedViewBuilder whatsNewPages: () -> any IndexedViewContainer = { EmptyView() },
                didClose: (() -> Void)? = nil,
                didFinish: (() -> Void)? = nil,
                componentIdentifier: String? = WhatsNewPageView.identifier)
    {
        self.whatsNewPages = whatsNewPages()
        self.didClose = didClose
        self.didFinish = didFinish
        self.componentIdentifier = componentIdentifier ?? WhatsNewPageView.identifier
    }
}

public extension WhatsNewPageView {
    static let identifier = "fiori_whatsnewpageview_component"
}

public extension WhatsNewPageView {
    init(whatsNewPages: [WhatsNewPage] = [],
         didClose: (() -> Void)? = nil,
         didFinish: (() -> Void)? = nil)
    {
        self.init(whatsNewPages: { _WhatsNewPagesContainer(whatsNewPages) }, didClose: didClose, didFinish: didFinish)
    }
}

public extension WhatsNewPageView {
    init(_ configuration: WhatsNewPageViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: WhatsNewPageViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.whatsNewPages = configuration.whatsNewPages
        self.didClose = configuration.didClose
        self.didFinish = configuration.didFinish
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension WhatsNewPageView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, whatsNewPages: self.whatsNewPages, didClose: self.didClose, didFinish: self.didFinish)).typeErased
                .transformEnvironment(\.whatsNewPageViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension WhatsNewPageView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        WhatsNewPageView(.init(componentIdentifier: self.componentIdentifier, whatsNewPages: self.whatsNewPages, didClose: self.didClose, didFinish: self.didFinish))
            .shouldApplyDefaultStyle(false)
            .whatsNewPageViewStyle(WhatsNewPageViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

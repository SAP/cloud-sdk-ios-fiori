// Generated using Sourcery 2.2.6 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct WhatsNewPage {
    let detailImage: any View
    let title: any View
    let description: any View

    @Environment(\.whatsNewPageStyle) var style

    var componentIdentifier: String = WhatsNewPage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder description: () -> any View = { EmptyView() },
                componentIdentifier: String? = WhatsNewPage.identifier)
    {
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? WhatsNewPage.identifier
    }
}

public extension WhatsNewPage {
    static let identifier = "fiori_whatsnewpage_component"
}

public extension WhatsNewPage {
    init(detailImage: Image? = nil,
         title: AttributedString,
         description: AttributedString? = nil)
    {
        self.init(detailImage: { detailImage }, title: { Text(title) }, description: { OptionalText(description) })
    }
}

public extension WhatsNewPage {
    init(_ configuration: WhatsNewPageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: WhatsNewPageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.detailImage = configuration.detailImage
        self.title = configuration.title
        self.description = configuration.description
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension WhatsNewPage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description))).typeErased
                .transformEnvironment(\.whatsNewPageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension WhatsNewPage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        WhatsNewPage(.init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description)))
            .shouldApplyDefaultStyle(false)
            .whatsNewPageStyle(WhatsNewPageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

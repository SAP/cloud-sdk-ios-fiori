// Generated using Sourcery 2.2.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// A single page to be displayed within the `WhatsNewPageView`.
public struct WhatsNewPage {
    let detailImage: any View
    let title: any View
    let description: any View
    /// Sets image size. The default value is 173x173.
    let imageSize: CGSize?
    /// Determines whether image is expanded to take up the full width of the page. If set to true, `imageSize` will not take effect.
    let isImageExpanded: Bool

    @Environment(\.whatsNewPageStyle) var style

    var componentIdentifier: String = WhatsNewPage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder description: () -> any View = { EmptyView() },
                imageSize: CGSize? = nil,
                isImageExpanded: Bool = false,
                componentIdentifier: String? = WhatsNewPage.identifier)
    {
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.imageSize = imageSize
        self.isImageExpanded = isImageExpanded
        self.componentIdentifier = componentIdentifier ?? WhatsNewPage.identifier
    }
}

public extension WhatsNewPage {
    static let identifier = "fiori_whatsnewpage_component"
}

public extension WhatsNewPage {
    init(detailImage: Image? = nil,
         title: AttributedString,
         description: AttributedString? = nil,
         imageSize: CGSize? = nil,
         isImageExpanded: Bool = false)
    {
        self.init(detailImage: { detailImage }, title: { Text(title) }, description: { OptionalText(description) }, imageSize: imageSize, isImageExpanded: isImageExpanded)
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
        self.imageSize = configuration.imageSize
        self.isImageExpanded = configuration.isImageExpanded
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension WhatsNewPage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), imageSize: self.imageSize, isImageExpanded: self.isImageExpanded)).typeErased
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
        WhatsNewPage(.init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), description: .init(self.description), imageSize: self.imageSize, isImageExpanded: self.isImageExpanded))
            .shouldApplyDefaultStyle(false)
            .whatsNewPageStyle(WhatsNewPageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

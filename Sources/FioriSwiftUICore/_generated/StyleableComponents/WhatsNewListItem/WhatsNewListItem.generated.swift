// Generated using Sourcery 2.2.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// A single list item to be displayed within the `WhatsNewListView`.
public struct WhatsNewListItem {
    let detailImage: any View
    let title: any View
    let subtitle: any View

    @Environment(\.whatsNewListItemStyle) var style

    var componentIdentifier: String = WhatsNewListItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                componentIdentifier: String? = WhatsNewListItem.identifier)
    {
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? WhatsNewListItem.identifier
    }
}

public extension WhatsNewListItem {
    static let identifier = "fiori_whatsnewlistitem_component"
}

public extension WhatsNewListItem {
    init(detailImage: Image? = nil,
         title: AttributedString,
         subtitle: AttributedString? = nil)
    {
        self.init(detailImage: { detailImage }, title: { Text(title) }, subtitle: { OptionalText(subtitle) })
    }
}

public extension WhatsNewListItem {
    init(_ configuration: WhatsNewListItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: WhatsNewListItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.detailImage = configuration.detailImage
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension WhatsNewListItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), subtitle: .init(self.subtitle))).typeErased
                .transformEnvironment(\.whatsNewListItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension WhatsNewListItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        WhatsNewListItem(.init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), subtitle: .init(self.subtitle)))
            .shouldApplyDefaultStyle(false)
            .whatsNewListItemStyle(WhatsNewListItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

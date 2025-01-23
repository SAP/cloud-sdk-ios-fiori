// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Card {
    let mediaImage: any View
    let description: any View
    let title: any View
    let subtitle: any View
    let icons: any View
    let detailImage: any View
    let headerAction: any View
    let counter: any View
    let row1: any View
    let row2: any View
    let row3: any View
    let kpi: any View
    let kpiCaption: any View
    let cardBody: any View
    let action: any View
    let secondaryAction: any View
    let tertiaryAction: any View
    let overflowAction: any View

    @Environment(\.cardStyle) var style

    var componentIdentifier: String = Card.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder mediaImage: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @IconBuilder icons: () -> any View = { EmptyView() },
                @ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder headerAction: () -> any View = { EmptyView() },
                @ViewBuilder counter: () -> any View = { EmptyView() },
                @ViewBuilder row1: () -> any View = { EmptyView() },
                @ViewBuilder row2: () -> any View = { EmptyView() },
                @ViewBuilder row3: () -> any View = { EmptyView() },
                @ViewBuilder kpi: () -> any View = { EmptyView() },
                @ViewBuilder kpiCaption: () -> any View = { EmptyView() },
                @ViewBuilder cardBody: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() },
                @ViewBuilder secondaryAction: () -> any View = { EmptyView() },
                @ViewBuilder tertiaryAction: () -> any View = { EmptyView() },
                @ViewBuilder overflowAction: () -> any View = { FioriButton { _ in Image(systemName: "ellipsis") } },
                componentIdentifier: String? = Card.identifier)
    {
        self.mediaImage = MediaImage(mediaImage: mediaImage, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.icons = Icons(icons: icons, componentIdentifier: componentIdentifier)
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.headerAction = HeaderAction(headerAction: headerAction, componentIdentifier: componentIdentifier)
        self.counter = Counter(counter: counter, componentIdentifier: componentIdentifier)
        self.row1 = Row1(row1: row1, componentIdentifier: componentIdentifier)
        self.row2 = Row2(row2: row2, componentIdentifier: componentIdentifier)
        self.row3 = Row3(row3: row3, componentIdentifier: componentIdentifier)
        self.kpi = Kpi(kpi: kpi, componentIdentifier: componentIdentifier)
        self.kpiCaption = KpiCaption(kpiCaption: kpiCaption, componentIdentifier: componentIdentifier)
        self.cardBody = CardBody(cardBody: cardBody, componentIdentifier: componentIdentifier)
        self.action = Action(action: action, componentIdentifier: componentIdentifier)
        self.secondaryAction = SecondaryAction(secondaryAction: secondaryAction, componentIdentifier: componentIdentifier)
        self.tertiaryAction = TertiaryAction(tertiaryAction: tertiaryAction, componentIdentifier: componentIdentifier)
        self.overflowAction = OverflowAction(overflowAction: overflowAction, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? Card.identifier
    }
}

public extension Card {
    static let identifier = "fiori_card_component"
}

public extension Card {
    init(mediaImage: Image? = nil,
         description: AttributedString? = nil,
         title: AttributedString,
         subtitle: AttributedString? = nil,
         icons: [TextOrIcon] = [],
         detailImage: Image? = nil,
         headerAction: FioriButton? = nil,
         counter: AttributedString? = nil,
         @ViewBuilder row1: () -> any View = { EmptyView() },
         @ViewBuilder row2: () -> any View = { EmptyView() },
         @ViewBuilder row3: () -> any View = { EmptyView() },
         kpi: KPIItemData? = nil,
         kpiCaption: AttributedString? = nil,
         @ViewBuilder cardBody: () -> any View = { EmptyView() },
         action: FioriButton? = nil,
         secondaryAction: FioriButton? = nil,
         tertiaryAction: FioriButton? = nil,
         overflowAction: FioriButton? = FioriButton { _ in Image(systemName: "ellipsis") })
    {
        self.init(mediaImage: { OptionalImage(mediaImage) }, description: { OptionalText(description) }, title: { Text(title) }, subtitle: { OptionalText(subtitle) }, icons: { IconStack(icons) }, detailImage: { detailImage }, headerAction: { headerAction }, counter: { OptionalText(counter) }, row1: row1, row2: row2, row3: row3, kpi: { OptionalKPIItem(kpi) }, kpiCaption: { OptionalText(kpiCaption) }, cardBody: cardBody, action: { action }, secondaryAction: { secondaryAction }, tertiaryAction: { tertiaryAction }, overflowAction: { overflowAction })
    }
}

public extension Card {
    init(_ configuration: CardConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CardConfiguration, shouldApplyDefaultStyle: Bool) {
        self.mediaImage = configuration.mediaImage
        self.description = configuration.description
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.icons = configuration.icons
        self.detailImage = configuration.detailImage
        self.headerAction = configuration.headerAction
        self.counter = configuration.counter
        self.row1 = configuration.row1
        self.row2 = configuration.row2
        self.row3 = configuration.row3
        self.kpi = configuration.kpi
        self.kpiCaption = configuration.kpiCaption
        self.cardBody = configuration.cardBody
        self.action = configuration.action
        self.secondaryAction = configuration.secondaryAction
        self.tertiaryAction = configuration.tertiaryAction
        self.overflowAction = configuration.overflowAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Card: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, mediaImage: .init(self.mediaImage), description: .init(self.description), title: .init(self.title), subtitle: .init(self.subtitle), icons: .init(self.icons), detailImage: .init(self.detailImage), headerAction: .init(self.headerAction), counter: .init(self.counter), row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3), kpi: .init(self.kpi), kpiCaption: .init(self.kpiCaption), cardBody: .init(self.cardBody), action: .init(self.action), secondaryAction: .init(self.secondaryAction), tertiaryAction: .init(self.tertiaryAction), overflowAction: .init(self.overflowAction))).typeErased
                .transformEnvironment(\.cardStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Card {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Card(.init(componentIdentifier: self.componentIdentifier, mediaImage: .init(self.mediaImage), description: .init(self.description), title: .init(self.title), subtitle: .init(self.subtitle), icons: .init(self.icons), detailImage: .init(self.detailImage), headerAction: .init(self.headerAction), counter: .init(self.counter), row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3), kpi: .init(self.kpi), kpiCaption: .init(self.kpiCaption), cardBody: .init(self.cardBody), action: .init(self.action), secondaryAction: .init(self.secondaryAction), tertiaryAction: .init(self.tertiaryAction), overflowAction: .init(self.overflowAction)))
            .shouldApplyDefaultStyle(false)
            .cardStyle(CardFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

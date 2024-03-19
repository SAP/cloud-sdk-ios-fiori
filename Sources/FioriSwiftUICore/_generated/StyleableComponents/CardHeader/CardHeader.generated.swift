// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CardHeader {
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

    @Environment(\.cardHeaderStyle) var style

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
                @ViewBuilder kpiCaption: () -> any View = { EmptyView() })
    {
        self.mediaImage = MediaImage { mediaImage() }
        self.description = Description { description() }
        self.title = Title { title() }
        self.subtitle = Subtitle { subtitle() }
        self.icons = Icons { icons() }
        self.detailImage = DetailImage { detailImage() }
        self.headerAction = HeaderAction { headerAction() }
        self.counter = Counter { counter() }
        self.row1 = Row1 { row1() }
        self.row2 = Row2 { row2() }
        self.row3 = Row3 { row3() }
        self.kpi = Kpi { kpi() }
        self.kpiCaption = KpiCaption { kpiCaption() }
    }
}

public extension CardHeader {
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
         kpiCaption: AttributedString? = nil)
    {
        self.init(mediaImage: { mediaImage }, description: { OptionalText(description) }, title: { Text(title) }, subtitle: { OptionalText(subtitle) }, icons: { IconStack(icons) }, detailImage: { detailImage }, headerAction: { headerAction }, counter: { OptionalText(counter) }, row1: row1, row2: row2, row3: row3, kpi: { KPIItem(kpi) }, kpiCaption: { OptionalText(kpiCaption) })
    }
}

public extension CardHeader {
    init(_ configuration: CardHeaderConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CardHeaderConfiguration, shouldApplyDefaultStyle: Bool) {
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
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension CardHeader: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(mediaImage: .init(self.mediaImage), description: .init(self.description), title: .init(self.title), subtitle: .init(self.subtitle), icons: .init(self.icons), detailImage: .init(self.detailImage), headerAction: .init(self.headerAction), counter: .init(self.counter), row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3), kpi: .init(self.kpi), kpiCaption: .init(self.kpiCaption))).typeErased
                .transformEnvironment(\.cardHeaderStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CardHeader {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        CardHeader(.init(mediaImage: .init(self.mediaImage), description: .init(self.description), title: .init(self.title), subtitle: .init(self.subtitle), icons: .init(self.icons), detailImage: .init(self.detailImage), headerAction: .init(self.headerAction), counter: .init(self.counter), row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3), kpi: .init(self.kpi), kpiCaption: .init(self.kpiCaption)))
            .shouldApplyDefaultStyle(false)
            .cardHeaderStyle(CardHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

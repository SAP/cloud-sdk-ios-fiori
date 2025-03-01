// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CardExtHeader {
    let row1: any View
    let row2: any View
    let row3: any View
    let kpi: any View
    let kpiCaption: any View

    @Environment(\.cardExtHeaderStyle) var style

    var componentIdentifier: String = CardExtHeader.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder row1: () -> any View = { EmptyView() },
                @ViewBuilder row2: () -> any View = { EmptyView() },
                @ViewBuilder row3: () -> any View = { EmptyView() },
                @ViewBuilder kpi: () -> any View = { EmptyView() },
                @ViewBuilder kpiCaption: () -> any View = { EmptyView() },
                componentIdentifier: String? = CardExtHeader.identifier)
    {
        self.row1 = Row1(row1: row1, componentIdentifier: componentIdentifier)
        self.row2 = Row2(row2: row2, componentIdentifier: componentIdentifier)
        self.row3 = Row3(row3: row3, componentIdentifier: componentIdentifier)
        self.kpi = Kpi(kpi: kpi, componentIdentifier: componentIdentifier)
        self.kpiCaption = KpiCaption(kpiCaption: kpiCaption, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? CardExtHeader.identifier
    }
}

public extension CardExtHeader {
    static let identifier = "fiori_cardextheader_component"
}

public extension CardExtHeader {
    init(@ViewBuilder row1: () -> any View = { EmptyView() },
         @ViewBuilder row2: () -> any View = { EmptyView() },
         @ViewBuilder row3: () -> any View = { EmptyView() },
         kpi: KPIItemData? = nil,
         kpiCaption: AttributedString? = nil)
    {
        self.init(row1: row1, row2: row2, row3: row3, kpi: { OptionalKPIItem(kpi) }, kpiCaption: { OptionalText(kpiCaption) })
    }
}

public extension CardExtHeader {
    init(_ configuration: CardExtHeaderConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CardExtHeaderConfiguration, shouldApplyDefaultStyle: Bool) {
        self.row1 = configuration.row1
        self.row2 = configuration.row2
        self.row3 = configuration.row3
        self.kpi = configuration.kpi
        self.kpiCaption = configuration.kpiCaption
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension CardExtHeader: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3), kpi: .init(self.kpi), kpiCaption: .init(self.kpiCaption))).typeErased
                .transformEnvironment(\.cardExtHeaderStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CardExtHeader {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        CardExtHeader(.init(componentIdentifier: self.componentIdentifier, row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3), kpi: .init(self.kpi), kpiCaption: .init(self.kpiCaption)))
            .shouldApplyDefaultStyle(false)
            .cardExtHeaderStyle(CardExtHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

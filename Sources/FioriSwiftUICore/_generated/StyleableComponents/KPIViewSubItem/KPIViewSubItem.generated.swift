// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct KPIViewSubItem {
    let kPIViewSubItemValue: any View
    let kPIViewSubItemType: KPISubitemType

    @Environment(\.kPIViewSubItemStyle) var style

    var componentIdentifier: String = KPIViewSubItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder kPIViewSubItemValue: () -> any View = { EmptyView() },
                kPIViewSubItemType: KPISubitemType = KPISubitemType.unit,
                componentIdentifier: String? = KPIViewSubItem.identifier)
    {
        self.kPIViewSubItemValue = kPIViewSubItemValue()
        self.kPIViewSubItemType = kPIViewSubItemType
        self.componentIdentifier = componentIdentifier ?? KPIViewSubItem.identifier
    }
}

public extension KPIViewSubItem {
    static let identifier = "fiori_kpiviewsubitem_component"
}

public extension KPIViewSubItem {
    init(kPIViewSubItemValue: TextOrIcon? = nil,
         kPIViewSubItemType: KPISubitemType = KPISubitemType.unit)
    {
        self.init(kPIViewSubItemValue: { TextOrIconView(kPIViewSubItemValue) }, kPIViewSubItemType: kPIViewSubItemType)
    }
}

public extension KPIViewSubItem {
    init(_ configuration: KPIViewSubItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: KPIViewSubItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.kPIViewSubItemValue = configuration.kPIViewSubItemValue
        self.kPIViewSubItemType = configuration.kPIViewSubItemType
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension KPIViewSubItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, kPIViewSubItemValue: .init(self.kPIViewSubItemValue), kPIViewSubItemType: self.kPIViewSubItemType)).typeErased
                .transformEnvironment(\.kPIViewSubItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension KPIViewSubItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        KPIViewSubItem(.init(componentIdentifier: self.componentIdentifier, kPIViewSubItemValue: .init(self.kPIViewSubItemValue), kPIViewSubItemType: self.kPIViewSubItemType))
            .shouldApplyDefaultStyle(false)
            .kPIViewSubItemStyle(.fiori)
            .typeErased
    }
}

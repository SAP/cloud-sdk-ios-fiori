// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct KPISubItem {
    let kPISubItemValue: any View
    let kPISubItemType: KPISubitemType

    @Environment(\.kPISubItemStyle) var style

    var componentIdentifier: String = KPISubItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder kPISubItemValue: () -> any View = { EmptyView() },
                kPISubItemType: KPISubitemType = KPISubitemType.unit,
                componentIdentifier: String? = KPISubItem.identifier)
    {
        self.kPISubItemValue = kPISubItemValue()
        self.kPISubItemType = kPISubItemType
        self.componentIdentifier = componentIdentifier ?? KPISubItem.identifier
    }
}

public extension KPISubItem {
    static let identifier = "fiori_kpisubitem_component"
}

public extension KPISubItem {
    init(kPISubItemValue: TextOrIcon? = nil,
         kPISubItemType: KPISubitemType = KPISubitemType.unit)
    {
        self.init(kPISubItemValue: { TextOrIconView(kPISubItemValue) }, kPISubItemType: kPISubItemType)
    }
}

public extension KPISubItem {
    init(_ configuration: KPISubItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: KPISubItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.kPISubItemValue = configuration.kPISubItemValue
        self.kPISubItemType = configuration.kPISubItemType
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension KPISubItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, kPISubItemValue: .init(self.kPISubItemValue), kPISubItemType: self.kPISubItemType)).typeErased
                .transformEnvironment(\.kPISubItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension KPISubItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        KPISubItem(.init(componentIdentifier: self.componentIdentifier, kPISubItemValue: .init(self.kPISubItemValue), kPISubItemType: self.kPISubItemType))
            .shouldApplyDefaultStyle(false)
            .kPISubItemStyle(.fiori)
            .typeErased
    }
}

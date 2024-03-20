// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Kpi {
    let kpi: any View

    @Environment(\.kpiStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder kpi: () -> any View = { EmptyView() }) {
        self.kpi = kpi()
    }
}

public extension Kpi {
    init(kpi: KPIItemData? = nil) {
        self.init(kpi: { OptionalKPIItem(kpi) })
    }
}

public extension Kpi {
    init(_ configuration: KpiConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: KpiConfiguration, shouldApplyDefaultStyle: Bool) {
        self.kpi = configuration.kpi
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension Kpi: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(kpi: .init(self.kpi))).typeErased
                .transformEnvironment(\.kpiStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Kpi {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Kpi(kpi: { self.kpi })
            .shouldApplyDefaultStyle(false)
            .kpiStyle(.fiori)
            .typeErased
    }
}

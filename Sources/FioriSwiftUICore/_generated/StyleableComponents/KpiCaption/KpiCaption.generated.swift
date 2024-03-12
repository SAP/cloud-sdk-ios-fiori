// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct KpiCaption {
    let kpiCaption: any View

    @Environment(\.kpiCaptionStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder kpiCaption: () -> any View = { EmptyView() }) {
        self.kpiCaption = kpiCaption()
    }
}

public extension KpiCaption {
    init(kpiCaption: AttributedString? = nil) {
        self.init(kpiCaption: { OptionalText(kpiCaption) })
    }
}

public extension KpiCaption {
    init(_ configuration: KpiCaptionConfiguration) {
        self.kpiCaption = configuration.kpiCaption
        self._shouldApplyDefaultStyle = false
    }
}

extension KpiCaption: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(kpiCaption: .init(self.kpiCaption))).typeErased
                .transformEnvironment(\.kpiCaptionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension KpiCaption {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        KpiCaption(kpiCaption: { self.kpiCaption })
            .shouldApplyDefaultStyle(false)
            .kpiCaptionStyle(.fiori)
            .typeErased
    }
}

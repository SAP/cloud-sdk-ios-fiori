// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct KpiCaption {
    let kpiCaption: any View

    @Environment(\.kpiCaptionStyle) var style

    var componentIdentifier: String = KpiCaption.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder kpiCaption: () -> any View = { EmptyView() },
                componentIdentifier: String? = KpiCaption.identifier)
    {
        self.kpiCaption = kpiCaption()
        self.componentIdentifier = componentIdentifier ?? KpiCaption.identifier
    }
}

public extension KpiCaption {
    static let identifier = "fiori_kpicaption_component"
}

public extension KpiCaption {
    init(kpiCaption: AttributedString? = nil,
         componentIdentifier: String? = KpiCaption.identifier)
    {
        self.init(kpiCaption: { OptionalText(kpiCaption) }, componentIdentifier: componentIdentifier)
    }
}

public extension KpiCaption {
    init(_ configuration: KpiCaptionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: KpiCaptionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.kpiCaption = configuration.kpiCaption
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension KpiCaption: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, kpiCaption: .init(self.kpiCaption))).typeErased
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
        KpiCaption(.init(componentIdentifier: self.componentIdentifier, kpiCaption: .init(self.kpiCaption)))
            .shouldApplyDefaultStyle(false)
            .kpiCaptionStyle(.fiori)
            .typeErased
    }
}

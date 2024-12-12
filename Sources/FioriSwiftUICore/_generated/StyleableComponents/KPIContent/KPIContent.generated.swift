// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct KPIContent {
    let kPIContent: any View

    @Environment(\.kPIContentStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder kPIContent: () -> any View = { EmptyView() }) {
        self.kPIContent = kPIContent()
    }
}

public extension KPIContent {
    init(_ configuration: KPIContentConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: KPIContentConfiguration, shouldApplyDefaultStyle: Bool) {
        self.kPIContent = configuration.kPIContent
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension KPIContent: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(kPIContent: .init(self.kPIContent))).typeErased
                .transformEnvironment(\.kPIContentStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension KPIContent {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        KPIContent(.init(kPIContent: .init(self.kPIContent)))
            .shouldApplyDefaultStyle(false)
            .kPIContentStyle(.fiori)
            .typeErased
    }
}

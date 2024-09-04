// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct FilledIcon {
    let filledIcon: any View

    @Environment(\.filledIconStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder filledIcon: () -> any View = { EmptyView() }) {
        self.filledIcon = filledIcon()
    }
}

public extension FilledIcon {
    init(filledIcon: Image? = nil) {
        self.init(filledIcon: { filledIcon })
    }
}

public extension FilledIcon {
    init(_ configuration: FilledIconConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FilledIconConfiguration, shouldApplyDefaultStyle: Bool) {
        self.filledIcon = configuration.filledIcon
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension FilledIcon: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(filledIcon: .init(self.filledIcon))).typeErased
                .transformEnvironment(\.filledIconStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension FilledIcon {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        FilledIcon(.init(filledIcon: .init(self.filledIcon)))
            .shouldApplyDefaultStyle(false)
            .filledIconStyle(.fiori)
            .typeErased
    }
}

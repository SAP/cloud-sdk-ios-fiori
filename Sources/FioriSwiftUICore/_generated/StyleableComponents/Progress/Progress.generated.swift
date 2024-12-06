// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Progress {
    let progress: any View

    @Environment(\.progressStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder progress: () -> any View) {
        self.progress = progress()
    }
}

public extension Progress {
    init(progress: ProgressView<EmptyView, EmptyView> = ProgressView()) {
        self.init(progress: { progress })
    }
}

public extension Progress {
    init(_ configuration: ProgressConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ProgressConfiguration, shouldApplyDefaultStyle: Bool) {
        self.progress = configuration.progress
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension Progress: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(progress: .init(self.progress))).typeErased
                .transformEnvironment(\.progressStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Progress {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Progress(.init(progress: .init(self.progress)))
            .shouldApplyDefaultStyle(false)
            .progressStyle(.fiori)
            .typeErased
    }
}

// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct LinearProgressIndicator {
    @Binding var indicatorProgress: Double

    @Environment(\.linearProgressIndicatorStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(indicatorProgress: Binding<Double>) {
        self._indicatorProgress = indicatorProgress
    }
}

public extension LinearProgressIndicator {
    init(_ configuration: LinearProgressIndicatorConfiguration) {
        self._indicatorProgress = configuration.$indicatorProgress
        self._shouldApplyDefaultStyle = false
    }
}

extension LinearProgressIndicator: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(indicatorProgress: self.$indicatorProgress)).typeErased
                .transformEnvironment(\.linearProgressIndicatorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension LinearProgressIndicator {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        LinearProgressIndicator(indicatorProgress: self.$indicatorProgress)
            .shouldApplyDefaultStyle(false)
            .linearProgressIndicatorStyle(.fiori)
            .typeErased
    }
}

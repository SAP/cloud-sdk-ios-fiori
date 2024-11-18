// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ProgressIndicatorProtocol {
    @Binding var progress: Double

    @Environment(\.progressIndicatorProtocolStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(progress: Binding<Double>) {
        self._progress = progress
    }
}

public extension ProgressIndicatorProtocol {
    init(_ configuration: ProgressIndicatorProtocolConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ProgressIndicatorProtocolConfiguration, shouldApplyDefaultStyle: Bool) {
        self._progress = configuration.$progress
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ProgressIndicatorProtocol: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(progress: self.$progress)).typeErased
                .transformEnvironment(\.progressIndicatorProtocolStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ProgressIndicatorProtocol {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ProgressIndicatorProtocol(.init(progress: self.$progress))
            .shouldApplyDefaultStyle(false)
            .progressIndicatorProtocolStyle(.fiori)
            .typeErased
    }
}

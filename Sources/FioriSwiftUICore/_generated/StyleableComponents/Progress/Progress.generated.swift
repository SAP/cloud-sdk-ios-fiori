// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct FioriProgressView {
    let progress: any View

    @Environment(\.fioriProgressViewStyle) var style

    var componentIdentifier: String = FioriProgressView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder progress: () -> any View,
                componentIdentifier: String? = FioriProgressView.identifier)
    {
        self.progress = progress()
        self.componentIdentifier = componentIdentifier ?? FioriProgressView.identifier
    }
}

public extension FioriProgressView {
    static let identifier = "fiori_progress_component"
}

public extension FioriProgressView {
    init(progress: ProgressView<EmptyView, EmptyView> = ProgressView()) {
        self.init(progress: { progress })
    }
}

public extension FioriProgressView {
    init(_ configuration: FioriProgressViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FioriProgressViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.progress = configuration.progress
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension FioriProgressView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, progress: .init(self.progress))).typeErased
                .transformEnvironment(\.fioriProgressViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension FioriProgressView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        FioriProgressView(.init(componentIdentifier: self.componentIdentifier, progress: .init(self.progress)))
            .shouldApplyDefaultStyle(false)
            .fioriProgressViewStyle(.fiori)
            .typeErased
    }
}

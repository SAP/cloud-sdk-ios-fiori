// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct FioriProgressView {
    let fioriProgressView: any View

    @Environment(\.fioriProgressViewStyle) var style

    var componentIdentifier: String = FioriProgressView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder fioriProgressView: () -> any View = { ProgressView() },
                componentIdentifier: String? = FioriProgressView.identifier)
    {
        self.fioriProgressView = fioriProgressView()
        self.componentIdentifier = componentIdentifier ?? FioriProgressView.identifier
    }
}

public extension FioriProgressView {
    static let identifier = "fiori_fioriprogressview_component"
}

public extension FioriProgressView {
    init(fioriProgressView: ProgressView<EmptyView, EmptyView> = ProgressView()) {
        self.init(fioriProgressView: { fioriProgressView })
    }
}

public extension FioriProgressView {
    init(_ configuration: FioriProgressViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FioriProgressViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.fioriProgressView = configuration.fioriProgressView
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension FioriProgressView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, fioriProgressView: .init(self.fioriProgressView))).typeErased
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
        FioriProgressView(.init(componentIdentifier: self.componentIdentifier, fioriProgressView: .init(self.fioriProgressView)))
            .shouldApplyDefaultStyle(false)
            .fioriProgressViewStyle(.fiori)
            .typeErased
    }
}

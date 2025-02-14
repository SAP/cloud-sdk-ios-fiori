// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Xmark {
    let xmark: any View

    @Environment(\.xmarkStyle) var style

    var componentIdentifier: String = Xmark.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder xmark: () -> any View = { Image(systemName: "xmark") },
                componentIdentifier: String? = Xmark.identifier)
    {
        self.xmark = xmark()
        self.componentIdentifier = componentIdentifier ?? Xmark.identifier
    }
}

public extension Xmark {
    static let identifier = "fiori_xmark_component"
}

public extension Xmark {
    init(xmark: Image? = Image(systemName: "xmark")) {
        self.init(xmark: { xmark })
    }
}

public extension Xmark {
    init(_ configuration: XmarkConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: XmarkConfiguration, shouldApplyDefaultStyle: Bool) {
        self.xmark = configuration.xmark
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Xmark: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, xmark: .init(self.xmark))).typeErased
                .transformEnvironment(\.xmarkStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Xmark {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Xmark(.init(componentIdentifier: self.componentIdentifier, xmark: .init(self.xmark)))
            .shouldApplyDefaultStyle(false)
            .xmarkStyle(.fiori)
            .typeErased
    }
}

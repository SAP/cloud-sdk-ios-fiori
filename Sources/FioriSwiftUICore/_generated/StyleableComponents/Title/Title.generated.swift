// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Title {
    let title: any View

    @Environment(\.titleStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View) {
        self.title = title()
    }
}

public extension Title {
    init(title: AttributedString) {
        self.init(title: { Text(title) })
    }
}

public extension Title {
    init(_ configuration: TitleConfiguration) {
        self.title = configuration.title
        self._shouldApplyDefaultStyle = false
    }
}

extension Title: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title))).typeErased
                .transformEnvironment(\.titleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Title {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Title(title: { self.title })
            .shouldApplyDefaultStyle(false)
            .titleStyle(.fiori)
            .typeErased
    }
}

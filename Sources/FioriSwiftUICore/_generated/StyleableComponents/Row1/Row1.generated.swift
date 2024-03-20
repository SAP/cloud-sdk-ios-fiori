// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Row1 {
    let row1: any View

    @Environment(\.row1Style) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder row1: () -> any View = { EmptyView() }) {
        self.row1 = row1()
    }
}

public extension Row1 {
    init(_ configuration: Row1Configuration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: Row1Configuration, shouldApplyDefaultStyle: Bool) {
        self.row1 = configuration.row1
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension Row1: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(row1: .init(self.row1))).typeErased
                .transformEnvironment(\.row1StyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Row1 {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Row1(row1: { self.row1 })
            .shouldApplyDefaultStyle(false)
            .row1Style(.fiori)
            .typeErased
    }
}

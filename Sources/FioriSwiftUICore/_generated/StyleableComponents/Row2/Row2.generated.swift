// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Row2 {
    let row2: any View

    @Environment(\.row2Style) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder row2: () -> any View = { EmptyView() }) {
        self.row2 = row2()
    }
}

public extension Row2 {
    init(_ configuration: Row2Configuration) {
        self.row2 = configuration.row2
        self._shouldApplyDefaultStyle = false
    }
}

extension Row2: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(row2: .init(self.row2))).typeErased
                .transformEnvironment(\.row2StyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Row2 {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Row2(row2: { self.row2 })
            .shouldApplyDefaultStyle(false)
            .row2Style(.fiori)
    }
}

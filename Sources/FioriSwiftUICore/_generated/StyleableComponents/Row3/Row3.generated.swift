// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Row3 {
    let row3: any View

    @Environment(\.row3Style) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder row3: () -> any View = { EmptyView() }) {
        self.row3 = row3()
    }
}

public extension Row3 {
    init(_ configuration: Row3Configuration) {
        self.row3 = configuration.row3
        self._shouldApplyDefaultStyle = false
    }
}

extension Row3: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(row3: .init(self.row3))).typeErased
                .transformEnvironment(\.row3StyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Row3 {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Row3(row3: { self.row3 })
            .shouldApplyDefaultStyle(false)
            .row3Style(.fiori)
            .typeErased
    }
}

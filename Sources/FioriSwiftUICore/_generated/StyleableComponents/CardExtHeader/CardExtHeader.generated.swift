// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CardExtHeader {
    let row1: any View
    let row2: any View
    let row3: any View

    @Environment(\.cardExtHeaderStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder row1: () -> any View = { EmptyView() },
                @ViewBuilder row2: () -> any View = { EmptyView() },
                @ViewBuilder row3: () -> any View = { EmptyView() })
    {
        self.row1 = Row1 { row1() }
        self.row2 = Row2 { row2() }
        self.row3 = Row3 { row3() }
    }
}

public extension CardExtHeader {
    init(_ configuration: CardExtHeaderConfiguration) {
        self.row1 = configuration.row1
        self.row2 = configuration.row2
        self.row3 = configuration.row3
        self._shouldApplyDefaultStyle = false
    }
}

extension CardExtHeader: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3))).typeErased
                .transformEnvironment(\.cardExtHeaderStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CardExtHeader {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        CardExtHeader(.init(row1: .init(self.row1), row2: .init(self.row2), row3: .init(self.row3)))
            .shouldApplyDefaultStyle(false)
            .cardExtHeaderStyle(CardExtHeaderFioriStyle.ContentFioriStyle())
    }
}

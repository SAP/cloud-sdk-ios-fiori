// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Substatus {
    let substatus: any View

    @Environment(\.substatusStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder substatus: () -> any View = { EmptyView() }) {
        self.substatus = substatus()
    }
}

public extension Substatus {
    init(substatus: TextOrIcon? = nil) {
        self.init(substatus: { TextOrIconView(substatus) })
    }
}

public extension Substatus {
    init(_ configuration: SubstatusConfiguration) {
        self.substatus = configuration.substatus
        self._shouldApplyDefaultStyle = false
    }
}

extension Substatus: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(substatus: .init(self.substatus))).typeErased
                .transformEnvironment(\.substatusStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Substatus {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Substatus(substatus: { self.substatus })
            .shouldApplyDefaultStyle(false)
            .substatusStyle(.fiori)
            .typeErased
    }
}

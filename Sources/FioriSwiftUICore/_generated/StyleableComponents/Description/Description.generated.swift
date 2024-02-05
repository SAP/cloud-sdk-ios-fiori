// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Description {
    let description: any View

    @Environment(\.descriptionStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder description: () -> any View = { EmptyView() }) {
        self.description = description()
    }
}

public extension Description {
    init(description: AttributedString? = nil) {
        self.init(description: { OptionalText(description) })
    }
}

public extension Description {
    init(_ configuration: DescriptionConfiguration) {
        self.description = configuration.description
        self._shouldApplyDefaultStyle = false
    }
}

extension Description: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(description: .init(self.description))).typeErased
                .transformEnvironment(\.descriptionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Description {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Description(description: { self.description })
            .shouldApplyDefaultStyle(false)
            .descriptionStyle(.fiori)
    }
}

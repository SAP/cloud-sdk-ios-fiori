// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Row2 {
    let row2: any View

    @Environment(\.row2Style) var style

    var componentIdentifier: String = Row2.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder row2: () -> any View = { EmptyView() },
                componentIdentifier: String? = Row2.identifier)
    {
        self.row2 = row2()
        self.componentIdentifier = componentIdentifier ?? Row2.identifier
    }
}

public extension Row2 {
    static let identifier = "fiori_row2_component"
}

public extension Row2 {
    init(_ configuration: Row2Configuration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: Row2Configuration, shouldApplyDefaultStyle: Bool) {
        self.row2 = configuration.row2
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Row2: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, row2: .init(self.row2))).typeErased
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
        Row2(.init(componentIdentifier: self.componentIdentifier, row2: .init(self.row2)))
            .shouldApplyDefaultStyle(false)
            .row2Style(.fiori)
            .typeErased
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Row3 {
    let row3: any View

    @Environment(\.row3Style) var style

    var componentIdentifier: String = Row3.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder row3: () -> any View = { EmptyView() },
                componentIdentifier: String? = Row3.identifier)
    {
        self.row3 = row3()
        self.componentIdentifier = componentIdentifier ?? Row3.identifier
    }
}

public extension Row3 {
    static let identifier = "fiori_row3_component"
}

public extension Row3 {
    init(_ configuration: Row3Configuration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: Row3Configuration, shouldApplyDefaultStyle: Bool) {
        self.row3 = configuration.row3
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Row3: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, row3: .init(self.row3))).typeErased
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
        Row3(.init(componentIdentifier: self.componentIdentifier, row3: .init(self.row3)))
            .shouldApplyDefaultStyle(false)
            .row3Style(.fiori)
            .typeErased
    }
}

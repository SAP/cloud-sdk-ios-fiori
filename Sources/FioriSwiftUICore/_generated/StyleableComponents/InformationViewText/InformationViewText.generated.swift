// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct InformationViewText {
    let informationViewText: any View

    @Environment(\.informationViewTextStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder informationViewText: () -> any View) {
        self.informationViewText = informationViewText()
    }
}

public extension InformationViewText {
    init(informationViewText: AttributedString) {
        self.init(informationViewText: { Text(informationViewText) })
    }
}

public extension InformationViewText {
    init(_ configuration: InformationViewTextConfiguration) {
        self.informationViewText = configuration.informationViewText
        self._shouldApplyDefaultStyle = false
    }
}

extension InformationViewText: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(informationViewText: .init(self.informationViewText))).typeErased
                .transformEnvironment(\.informationViewTextStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension InformationViewText {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        InformationViewText(informationViewText: { self.informationViewText })
            .shouldApplyDefaultStyle(false)
            .informationViewTextStyle(.fiori)
    }
}

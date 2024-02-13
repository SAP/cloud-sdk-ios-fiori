// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct InformationViewContent {
    let informationViewContent: any View

    @Environment(\.informationViewContentStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder informationViewContent: () -> any View) {
        self.informationViewContent = informationViewContent()
    }
}

//public extension InformationViewContent {
//    init(informationViewContent: () -> any View) {
//        self.init(informationViewContent: { informationViewContent })
//    }
//}

public extension InformationViewContent {
    init(_ configuration: InformationViewContentConfiguration) {
        self.informationViewContent = configuration.informationViewContent
        self._shouldApplyDefaultStyle = false
    }
}

extension InformationViewContent: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(informationViewContent: .init(self.informationViewContent))).typeErased
                .transformEnvironment(\.informationViewContentStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension InformationViewContent {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        InformationViewContent(informationViewContent: { self.informationViewContent })
            .shouldApplyDefaultStyle(false)
            .informationViewContentStyle(.fiori)
    }
}

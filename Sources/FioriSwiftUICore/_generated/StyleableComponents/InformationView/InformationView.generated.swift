// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct InformationView {
    let informationViewContent: any View
    let informationViewIcon: any View
    let informationViewText: any View

    @Environment(\.informationViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder informationViewContent: () -> any View,
                @ViewBuilder informationViewIcon: () -> any View = { EmptyView() },
                @ViewBuilder informationViewText: () -> any View)
    {
        self.informationViewContent = InformationViewContent { informationViewContent() }
        self.informationViewIcon = InformationViewIcon { informationViewIcon() }
        self.informationViewText = InformationViewText { informationViewText() }
    }
}

public extension InformationView {
    init(informationViewContent: () -> any View,
         informationViewIcon: Image? = nil,
         informationViewText: AttributedString)
    {
        self.init(informationViewContent: informationViewContent, informationViewIcon: { informationViewIcon }, informationViewText: { Text(informationViewText) })
    }
}

public extension InformationView {
    init(_ configuration: InformationViewConfiguration) {
        self.informationViewContent = configuration.informationViewContent
        self.informationViewIcon = configuration.informationViewIcon
        self.informationViewText = configuration.informationViewText
        self._shouldApplyDefaultStyle = false
    }
}

extension InformationView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(informationViewContent: .init(self.informationViewContent), informationViewIcon: .init(self.informationViewIcon), informationViewText: .init(self.informationViewText))).typeErased
                .transformEnvironment(\.informationViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension InformationView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        InformationView(.init(informationViewContent: .init(self.informationViewContent), informationViewIcon: .init(self.informationViewIcon), informationViewText: .init(self.informationViewText)))
            .shouldApplyDefaultStyle(false)
            .informationViewStyle(InformationViewFioriStyle.ContentFioriStyle())
    }
}

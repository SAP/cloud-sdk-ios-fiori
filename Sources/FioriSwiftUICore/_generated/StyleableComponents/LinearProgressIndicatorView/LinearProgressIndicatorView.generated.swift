// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct LinearProgressIndicatorView {
    @Binding var indicatorProgress: Double
    let icon: any View
    let description: any View

    @Environment(\.linearProgressIndicatorViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(indicatorProgress: Binding<Double>,
                @ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() })
    {
        self._indicatorProgress = indicatorProgress
        self.icon = Icon { icon() }
        self.description = Description { description() }
    }
}

public extension LinearProgressIndicatorView {
    init(indicatorProgress: Binding<Double>,
         icon: Image? = nil,
         description: AttributedString? = nil)
    {
        self.init(indicatorProgress: indicatorProgress, icon: { icon }, description: { OptionalText(description) })
    }
}

public extension LinearProgressIndicatorView {
    init(_ configuration: LinearProgressIndicatorViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: LinearProgressIndicatorViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self._indicatorProgress = configuration.$indicatorProgress
        self.icon = configuration.icon
        self.description = configuration.description
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension LinearProgressIndicatorView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(indicatorProgress: self.$indicatorProgress, icon: .init(self.icon), description: .init(self.description))).typeErased
                .transformEnvironment(\.linearProgressIndicatorViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension LinearProgressIndicatorView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        LinearProgressIndicatorView(.init(indicatorProgress: self.$indicatorProgress, icon: .init(self.icon), description: .init(self.description)))
            .shouldApplyDefaultStyle(false)
            .linearProgressIndicatorViewStyle(LinearProgressIndicatorViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

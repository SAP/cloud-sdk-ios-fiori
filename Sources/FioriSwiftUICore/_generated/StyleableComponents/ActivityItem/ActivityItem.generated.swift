// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ActivityItem {
    let icon: any View
    let subtitle: any View
    /// Activity item layout. The default is .vertical
    let layout: ActivityItemLayout

    @Environment(\.activityItemStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                layout: ActivityItemLayout = .vertical)
    {
        self.icon = Icon(icon: icon)
        self.subtitle = Subtitle(subtitle: subtitle)
        self.layout = layout
    }
}

public extension ActivityItem {
    init(icon: Image? = nil,
         subtitle: AttributedString? = nil,
         layout: ActivityItemLayout = .vertical)
    {
        self.init(icon: { icon }, subtitle: { OptionalText(subtitle) }, layout: layout)
    }
}

public extension ActivityItem {
    init(_ configuration: ActivityItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ActivityItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.subtitle = configuration.subtitle
        self.layout = configuration.layout
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ActivityItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(icon: .init(self.icon), subtitle: .init(self.subtitle), layout: self.layout)).typeErased
                .transformEnvironment(\.activityItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ActivityItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ActivityItem(.init(icon: .init(self.icon), subtitle: .init(self.subtitle), layout: self.layout))
            .shouldApplyDefaultStyle(false)
            .activityItemStyle(ActivityItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

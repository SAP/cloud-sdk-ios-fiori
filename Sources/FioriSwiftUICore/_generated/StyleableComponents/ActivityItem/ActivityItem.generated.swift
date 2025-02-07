// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ActivityItem` provides a customizable activity item with an icon and a subtitle.
///
/// ## Usage
/// ```swift
/// ActivityItem(icon: Image(systemName: "phone"), subtitle: AttributedString("phone"))
/// ```
public struct ActivityItem {
    let icon: any View
    let subtitle: any View
    /// Activity item layout. The default is .vertical
    let layout: ActivityItemLayout

    @Environment(\.activityItemStyle) var style

    var componentIdentifier: String = ActivityItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                layout: ActivityItemLayout = .vertical,
                componentIdentifier: String? = ActivityItem.identifier)
    {
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.layout = layout
        self.componentIdentifier = componentIdentifier ?? ActivityItem.identifier
    }
}

public extension ActivityItem {
    static let identifier = "fiori_activityitem_component"
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
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ActivityItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), subtitle: .init(self.subtitle), layout: self.layout)).typeErased
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
        ActivityItem(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), subtitle: .init(self.subtitle), layout: self.layout))
            .shouldApplyDefaultStyle(false)
            .activityItemStyle(ActivityItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

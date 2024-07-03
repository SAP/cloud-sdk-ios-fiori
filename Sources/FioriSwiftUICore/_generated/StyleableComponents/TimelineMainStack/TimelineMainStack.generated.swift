// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TimelineMainStack {
    let title: any View
    let subtitle: any View
    let attribute: any View
    let status: any View
    let substatus: any View
    let subAttribute: any View

    @Environment(\.timelineMainStackStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder attribute: () -> any View = { EmptyView() },
                @ViewBuilder status: () -> any View = { EmptyView() },
                @ViewBuilder substatus: () -> any View = { EmptyView() },
                @ViewBuilder subAttribute: () -> any View = { EmptyView() })
    {
        self.title = Title { title() }
        self.subtitle = Subtitle { subtitle() }
        self.attribute = Attribute { attribute() }
        self.status = Status { status() }
        self.substatus = Substatus { substatus() }
        self.subAttribute = SubAttribute { subAttribute() }
    }
}

public extension TimelineMainStack {
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         attribute: AttributedString? = nil,
         status: TextOrIcon? = nil,
         substatus: TextOrIcon? = nil,
         subAttribute: AttributedString? = nil)
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, attribute: { OptionalText(attribute) }, status: { TextOrIconView(status) }, substatus: { TextOrIconView(substatus) }, subAttribute: { OptionalText(subAttribute) })
    }
}

public extension TimelineMainStack {
    init(_ configuration: TimelineMainStackConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelineMainStackConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.attribute = configuration.attribute
        self.status = configuration.status
        self.substatus = configuration.substatus
        self.subAttribute = configuration.subAttribute
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TimelineMainStack: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), subtitle: .init(self.subtitle), attribute: .init(self.attribute), status: .init(self.status), substatus: .init(self.substatus), subAttribute: .init(self.subAttribute))).typeErased
                .transformEnvironment(\.timelineMainStackStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TimelineMainStack {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TimelineMainStack(.init(title: .init(self.title), subtitle: .init(self.subtitle), attribute: .init(self.attribute), status: .init(self.status), substatus: .init(self.substatus), subAttribute: .init(self.subAttribute)))
            .shouldApplyDefaultStyle(false)
            .timelineMainStackStyle(TimelineMainStackFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

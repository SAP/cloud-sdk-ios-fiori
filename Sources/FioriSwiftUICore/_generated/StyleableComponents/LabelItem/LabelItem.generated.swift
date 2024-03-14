// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct LabelItem {
    let icon: any View
    let title: any View
    /// The icon's `HorizontalAlignment`. The default is `leading`.
    var alignment: HorizontalAlignment?

    @Environment(\.labelItemStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                alignment: HorizontalAlignment? = nil)
    {
        self.icon = Icon { icon() }
        self.title = Title { title() }
        self.alignment = alignment
    }
}

public extension LabelItem {
    init(icon: Image? = nil,
         title: AttributedString,
         alignment: HorizontalAlignment? = nil)
    {
        self.init(icon: { icon }, title: { Text(title) }, alignment: alignment)
    }
}

public extension LabelItem {
    init(_ configuration: LabelItemConfiguration) {
        self.icon = configuration.icon
        self.title = configuration.title
        self.alignment = configuration.alignment
        self._shouldApplyDefaultStyle = false
    }
}

extension LabelItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(icon: .init(self.icon), title: .init(self.title), alignment: self.alignment)).typeErased
                .transformEnvironment(\.labelItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension LabelItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        LabelItem(.init(icon: .init(self.icon), title: .init(self.title), alignment: self.alignment))
            .shouldApplyDefaultStyle(false)
            .labelItemStyle(LabelItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

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

    var componentIdentifier: String = LabelItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                alignment: HorizontalAlignment? = nil,
                componentIdentifier: String? = LabelItem.identifier)
    {
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.alignment = alignment
        self.componentIdentifier = componentIdentifier ?? LabelItem.identifier
    }
}

public extension LabelItem {
    static let identifier = "fiori_labelitem_component"
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
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: LabelItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.title = configuration.title
        self.alignment = configuration.alignment
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension LabelItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), alignment: self.alignment)).typeErased
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
        LabelItem(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), alignment: self.alignment))
            .shouldApplyDefaultStyle(false)
            .labelItemStyle(LabelItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

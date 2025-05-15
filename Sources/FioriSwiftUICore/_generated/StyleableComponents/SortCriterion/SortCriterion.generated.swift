// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SortCriterion {
    let checkmark: any View
    let title: any View
    let subtitle: any View
    let accessoryIcon: any View
    /// The data of the Order Picker Item
    @Binding var data: OrderPickerItemModel

    @Environment(\.sortCriterionStyle) var style

    var componentIdentifier: String = SortCriterion.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder checkmark: () -> any View = { Image(systemName: "checkmark") },
                @ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder accessoryIcon: () -> any View = { EmptyView() },
                data: Binding<OrderPickerItemModel>,
                componentIdentifier: String? = SortCriterion.identifier)
    {
        self.checkmark = Checkmark(checkmark: checkmark, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.accessoryIcon = AccessoryIcon(accessoryIcon: accessoryIcon, componentIdentifier: componentIdentifier)
        self._data = data
        self.componentIdentifier = componentIdentifier ?? SortCriterion.identifier
    }
}

public extension SortCriterion {
    static let identifier = "fiori_sortcriterion_component"
}

public extension SortCriterion {
    init(checkmark: Image? = Image(systemName: "checkmark"),
         title: AttributedString,
         subtitle: AttributedString? = nil,
         accessoryIcon: Image? = nil,
         data: Binding<OrderPickerItemModel>)
    {
        self.init(checkmark: { checkmark }, title: { Text(title) }, subtitle: { OptionalText(subtitle) }, accessoryIcon: { accessoryIcon }, data: data)
    }
}

public extension SortCriterion {
    init(_ configuration: SortCriterionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SortCriterionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.checkmark = configuration.checkmark
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.accessoryIcon = configuration.accessoryIcon
        self._data = configuration.$data
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SortCriterion: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, checkmark: .init(self.checkmark), title: .init(self.title), subtitle: .init(self.subtitle), accessoryIcon: .init(self.accessoryIcon), data: self.$data)).typeErased
                .transformEnvironment(\.sortCriterionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SortCriterion {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SortCriterion(.init(componentIdentifier: self.componentIdentifier, checkmark: .init(self.checkmark), title: .init(self.title), subtitle: .init(self.subtitle), accessoryIcon: .init(self.accessoryIcon), data: self.$data))
            .shouldApplyDefaultStyle(false)
            .sortCriterionStyle(SortCriterionFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

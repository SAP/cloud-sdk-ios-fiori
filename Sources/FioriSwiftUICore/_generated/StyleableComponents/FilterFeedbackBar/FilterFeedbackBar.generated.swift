// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// The `FilterFeedbackBar` is a SwiftUI component contains FilterFeedbackBarItem. When tapping FilterFeedbackBarItem, it will show some sort and filter types of controls, List Picker, Switch, Slider, Value Picker, Stepper, Date Picker.
///
/// ## Usage
///
/// `items` is the data for the FilterFeedbackBar..
/// `onUpdate` is the callback function  is triggered when the data is updated.
///
///  ```swift
///  @State var items: [[SortFilterItem]] = [
///    [.switch(item: .init(name: "Favorite", value: true, icon: "heart.fill"), showsOnFilterFeedbackBar: true),
///     .slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]
///  ]
///
///  FilterFeedbackBar(items: self.$items) {}
///  ```
///
public struct FilterFeedbackBar {
    /// The data for the FilterFeedbackBar.
    let items: any View
    /// The callback function is triggered when the data is updated.
    let onUpdate: (() -> Void)?

    @Environment(\.filterFeedbackBarStyle) var style

    var componentIdentifier: String = FilterFeedbackBar.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder items: () -> any View,
                onUpdate: (() -> Void)? = nil,
                componentIdentifier: String? = FilterFeedbackBar.identifier)
    {
        self.items = items()
        self.onUpdate = onUpdate
        self.componentIdentifier = componentIdentifier ?? FilterFeedbackBar.identifier
    }
}

public extension FilterFeedbackBar {
    static let identifier = "fiori_filterfeedbackbar_component"
}

public extension FilterFeedbackBar {
    init(items: Binding<[[SortFilterItem]]>,
         onUpdate: (() -> Void)? = nil)
    {
        self.init(items: { FilterFeedbackBarItemContainer(items) }, onUpdate: onUpdate)
    }
}

public extension FilterFeedbackBar {
    init(_ configuration: FilterFeedbackBarConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FilterFeedbackBarConfiguration, shouldApplyDefaultStyle: Bool) {
        self.items = configuration.items
        self.onUpdate = configuration.onUpdate
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension FilterFeedbackBar: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, items: .init(self.items), onUpdate: self.onUpdate)).typeErased
                .transformEnvironment(\.filterFeedbackBarStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension FilterFeedbackBar {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        FilterFeedbackBar(.init(componentIdentifier: self.componentIdentifier, items: .init(self.items), onUpdate: self.onUpdate))
            .shouldApplyDefaultStyle(false)
            .filterFeedbackBarStyle(FilterFeedbackBarFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

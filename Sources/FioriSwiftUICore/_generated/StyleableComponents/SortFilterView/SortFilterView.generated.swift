// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `SortFilterView` is a view that will be presented when tap the full configuration button in the filter feed back bar.
///  ## Usage:
///  ```swift
///  @Binding var items: [[SortFilterItem]]
///  SortFilterView(
///     title: {
///         Text("Full Configuration")
///     },
///     items: self.$items,
///     onUpdate: {},
///     onCancel: {},
///     onReset: {}
///  )
///  ```
public struct SortFilterView {
    let title: any View
    let cancelAction: any View
    let applyAction: any View
    let resetAction: any View
    /// The data for the items that will be displayed in sort filter view.
    @Binding var items: [[SortFilterItem]]
    /// The action to be performed when the apply button is tapped.
    let onUpdate: (() -> Void)?
    /// The action to be performed when the cancel button is tapped.
    let onCancel: (() -> Void)?
    /// The action to be performed when the reset button is tapped.
    let onReset: (() -> Void)?

    @Environment(\.sortFilterViewStyle) var style

    var componentIdentifier: String = SortFilterView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder cancelAction: () -> any View = { FioriButton { _ in Text("Cancel".localizedFioriString()) } },
                @ViewBuilder applyAction: () -> any View = { FioriButton { _ in Text("Apply".localizedFioriString()) } },
                @ViewBuilder resetAction: () -> any View = { FioriButton { _ in Text("Reset".localizedFioriString()) } },
                items: Binding<[[SortFilterItem]]>,
                onUpdate: (() -> Void)? = nil,
                onCancel: (() -> Void)? = nil,
                onReset: (() -> Void)? = nil,
                componentIdentifier: String? = SortFilterView.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.cancelAction = CancelAction(cancelAction: cancelAction, componentIdentifier: componentIdentifier)
        self.applyAction = ApplyAction(applyAction: applyAction, componentIdentifier: componentIdentifier)
        self.resetAction = ResetAction(resetAction: resetAction, componentIdentifier: componentIdentifier)
        self._items = items
        self.onUpdate = onUpdate
        self.onCancel = onCancel
        self.onReset = onReset
        self.componentIdentifier = componentIdentifier ?? SortFilterView.identifier
    }
}

public extension SortFilterView {
    static let identifier = "fiori_sortfilterview_component"
}

public extension SortFilterView {
    init(title: AttributedString,
         cancelAction: FioriButton? = FioriButton { _ in Text("Cancel".localizedFioriString()) },
         applyAction: FioriButton? = FioriButton { _ in Text("Apply".localizedFioriString()) },
         resetAction: FioriButton? = FioriButton { _ in Text("Reset".localizedFioriString()) },
         items: Binding<[[SortFilterItem]]>,
         onUpdate: (() -> Void)? = nil,
         onCancel: (() -> Void)? = nil,
         onReset: (() -> Void)? = nil)
    {
        self.init(title: { Text(title) }, cancelAction: { cancelAction }, applyAction: { applyAction }, resetAction: { resetAction }, items: items, onUpdate: onUpdate, onCancel: onCancel, onReset: onReset)
    }
}

public extension SortFilterView {
    init(_ configuration: SortFilterViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SortFilterViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.cancelAction = configuration.cancelAction
        self.applyAction = configuration.applyAction
        self.resetAction = configuration.resetAction
        self._items = configuration.$items
        self.onUpdate = configuration.onUpdate
        self.onCancel = configuration.onCancel
        self.onReset = configuration.onReset
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SortFilterView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), cancelAction: .init(self.cancelAction), applyAction: .init(self.applyAction), resetAction: .init(self.resetAction), items: self.$items, onUpdate: self.onUpdate, onCancel: self.onCancel, onReset: self.onReset)).typeErased
                .transformEnvironment(\.sortFilterViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SortFilterView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SortFilterView(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), cancelAction: .init(self.cancelAction), applyAction: .init(self.applyAction), resetAction: .init(self.resetAction), items: self.$items, onUpdate: self.onUpdate, onCancel: self.onCancel, onReset: self.onReset))
            .shouldApplyDefaultStyle(false)
            .sortFilterViewStyle(SortFilterViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

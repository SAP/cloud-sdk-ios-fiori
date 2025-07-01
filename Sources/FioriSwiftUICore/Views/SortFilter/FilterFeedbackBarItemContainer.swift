import SwiftUI

/// The view contains filter feedback bar items.
public struct FilterFeedbackBarItemContainer {
    @Environment(\.onModelUpdateAppCallback) var onUpdate: () -> Void
    @Environment(\.filterFeedbackBarFullConfigurationItem) var fullCFGButton
    @Binding var _items: [[SortFilterItem]]

    /// Create FilterFeedbackBarItemContainer with items.
    /// - Parameter items: Data of filter feedback bar items.
    public init(_ items: Binding<[[SortFilterItem]]>) {
        self.__items = items
    }
}

extension FilterFeedbackBarItemContainer: View {
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                if self.fullCFGButton.position == .leading {
                    FullCFGMenuItem(items: self.$_items, onUpdate: self.onUpdate)
                        .accessibilityElement()
                        .accessibilityLabel(self.fullCFGButton.name ?? "")
                        .accessibilityIdentifier(self.fullCFGButton.name ?? "")
                        .accessibility(addTraits: .isButton)
                }
                ForEach(0 ..< self._items.count, id: \.self) { r in
                    ForEach(0 ..< self._items[r].count, id: \.self) { c in
                        if self._items[r][c].showsOnFilterFeedbackBar {
                            switch self._items[r][c] {
                            case .picker:
                                PickerMenuItem(item: Binding<SortFilterItem.PickerItem>(get: { self._items[r][c].picker }, set: { self._items[r][c].picker = $0 }), onUpdate: self.onUpdate)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].picker.label)
                                    .accessibilityIdentifier(self._items[r][c].picker.name)
                                    .accessibility(addTraits: .isButton)
                            case .filterfeedback:
                                FilterFeedbackMenuItem(item: Binding<SortFilterItem.PickerItem>(get: { self._items[r][c].filterfeedback }, set: { self._items[r][c].filterfeedback = $0 }), onUpdate: self.onUpdate)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].filterfeedback.label)
                                    .accessibilityIdentifier(self._items[r][c].filterfeedback.name)
                                    .accessibility(addTraits: .isButton)
                            case .switch:
                                SwitchMenuItem(item: Binding<SortFilterItem.SwitchItem>(get: { self._items[r][c].switch }, set: { self._items[r][c].switch = $0 }), onUpdate: self.onUpdate)
                                    .accessibilityElement()
                                    .accessibilityLabel(self.switchItemAccessibilityLabel(switchItem: self._items[r][c].switch))
                                    .accessibilityIdentifier(self._items[r][c].switch.name)
                                    .accessibility(addTraits: .isButton)
                            case .slider:
                                SliderMenuItem(item: Binding<SortFilterItem.SliderItem>(get: { self._items[r][c].slider }, set: { self._items[r][c].slider = $0 }), onUpdate: self.onUpdate)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].slider.label)
                                    .accessibilityIdentifier(self._items[r][c].slider.name)
                                    .accessibility(addTraits: .isButton)
                            case .datetime:
                                DateTimeMenuItem(item: Binding<SortFilterItem.DateTimeItem>(get: { self._items[r][c].datetime }, set: { self._items[r][c].datetime = $0 }), onUpdate: self.onUpdate)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].datetime.label)
                                    .accessibilityIdentifier(self._items[r][c].datetime.name)
                            case .stepper:
                                StepperMenuItem(item: Binding<SortFilterItem.StepperItem>(get: { self._items[r][c].stepper }, set: { self._items[r][c].stepper = $0 }), onUpdate: self.onUpdate)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].stepper.label)
                                    .accessibilityIdentifier(self._items[r][c].stepper.name)
                                    .accessibility(addTraits: .isButton)
                            case .title:
                                TitleMenuItem(item: Binding<SortFilterItem.TitleItem>(get: { self._items[r][c].title }, set: { self._items[r][c].title = $0 }), onUpdate: self.onUpdate)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].title.label)
                                    .accessibilityIdentifier(self._items[r][c].title.name)
                            case .note:
                                NoteMenuItem(item: Binding<SortFilterItem.NoteItem>(get: { self._items[r][c].note }, set: { self._items[r][c].note = $0 }), onUpdate: self.onUpdate)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].note.label)
                                    .accessibilityIdentifier(self._items[r][c].note.name)
                            case .durationPicker:
                                DurationPickerMenuItem(item: Binding<SortFilterItem.DurationPickerItem>(get: { self._items[r][c].durationPicker }, set: { self._items[r][c].durationPicker = $0 }), onUpdate: self.onUpdate)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].durationPicker.label)
                                    .accessibilityIdentifier(self._items[r][c].durationPicker.name)
                            case .orderPicker:
                                OrderPickerMenuItem(item: Binding<SortFilterItem.OrderPickerItem>(get: { self._items[r][c].orderPicker }, set: { self._items[r][c].orderPicker = $0 }), onUpdate: self.onUpdate)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].orderPicker.label)
                                    .accessibilityIdentifier(self._items[r][c].orderPicker.name)
                            }
                        }
                    }
                }
                if self.fullCFGButton.position == .trailing {
                    FullCFGMenuItem(items: self.$_items, onUpdate: self.onUpdate)
                        .accessibilityElement()
                        .accessibilityLabel(self.fullCFGButton.name ?? "")
                        .accessibilityIdentifier(self.fullCFGButton.name ?? "")
                        .accessibility(addTraits: .isButton)
                }
            }
        }
        .frame(minHeight: 44)
    }
    
    private func switchItemAccessibilityLabel(switchItem: SortFilterItem.SwitchItem) -> String {
        var accessibilityLabel = switchItem.name
        if let value = switchItem.value {
            accessibilityLabel += "\(value ? 1 : 0)"
        } else {
            accessibilityLabel += "\(0)"
        }
        return accessibilityLabel
    }
}

struct FilterFeedbackBarFullConfigurationItemKey: EnvironmentKey {
    public static var defaultValue: FilterFeedbackBarFullConfigurationItem = .none
}

/// Filter feedback bar item for displaying full configuration list
public struct FilterFeedbackBarFullConfigurationItem {
    /// Name/title of the button
    public let name: String?
    /// SF icon name of the button
    public let icon: String?
    /// Position of the button
    public let position: Position
    
    /// Location of the button
    public enum Position {
        /// Disaplay the button as the first one
        case leading
        /// Display the button as the last one
        case trailing
        /// No button displayed
        case none
    }
    
    /// Name/title and icon of the button
    public enum ItemContent {
        /// Name of the button
        case name(String)
        /// Icon of the button
        case icon(String)
        ///  Name and icon of the button
        case nameAndIcon(name: String, icon: String)
    }
    
    private init(name: String? = nil, icon: String? = nil, position: Position) {
        self.name = name
        self.icon = icon
        self.position = position
    }
    
    /// Place and config the full configuration item.
    /// - Parameters:
    ///   - itemContent: name and icon value.
    ///   - position: Item position in the bar.  If value is `none`, full configuration item will not be shown.
    /// - Returns: Full configuration item.
    public static func fullConfiguration(itemContent: ItemContent, position: Position) -> FilterFeedbackBarFullConfigurationItem {
        switch itemContent {
        case .name(let name):
            FilterFeedbackBarFullConfigurationItem(name: name, position: position)
        case .icon(let icon):
            FilterFeedbackBarFullConfigurationItem(icon: icon, position: position)
        case .nameAndIcon(let name, let icon):
            FilterFeedbackBarFullConfigurationItem(name: name, icon: icon, position: position)
        }
    }
    
    /// No button for full configuration
    static var none = FilterFeedbackBarFullConfigurationItem(position: Position.none)
}

extension EnvironmentValues {
    var filterFeedbackBarFullConfigurationItem: FilterFeedbackBarFullConfigurationItem {
        get {
            self[FilterFeedbackBarFullConfigurationItemKey.self]
        }
        set {
            self[FilterFeedbackBarFullConfigurationItemKey.self] = newValue
        }
    }
}

public extension View {
    /// Config full configuration Item in FilterFeedbackBar.
    /// - Parameters:
    ///   - itemContent: name and icon value.
    ///   - position: Item position in the bar.  If value is `none`, full configuration item will not be shown.
    /// - Returns: Full configuration item.
    func fullConfigurationItem(itemContent: FilterFeedbackBarFullConfigurationItem.ItemContent, position: FilterFeedbackBarFullConfigurationItem.Position) -> some View {
        self.environment(\.filterFeedbackBarFullConfigurationItem, .fullConfiguration(itemContent: itemContent, position: position))
    }
}

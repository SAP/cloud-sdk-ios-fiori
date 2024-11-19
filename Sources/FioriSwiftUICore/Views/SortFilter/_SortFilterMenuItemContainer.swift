//
//  _SortFilterMenuItemContainer.swift
//
//
//  Created by Xu, Charles on 9/25/23.
//
import SwiftUI

/// :nodoc:
public struct _SortFilterMenuItemContainer {
    @Environment(\.onModelUpdateAppCallback) var onUpdate: () -> Void
//    @Environment(\.cancelActionView) var _cancelAction
    @Environment(\.sortFilterMenuItemFullConfigurationButton) var fullCFGButton
    @Binding var _items: [[SortFilterItem]]
    @Environment(\.isResetHidden) var isResetHidden
    @Environment(\.resetButtonType) var resetButtonType

    public init(items: Binding<[[SortFilterItem]]>) {
        self.__items = items
    }
}

extension _SortFilterMenuItemContainer: View {
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                if self.fullCFGButton.position == .leading {
                    FullCFGMenuItem(items: self.$_items, onUpdate: self.onUpdate, isResetHidden: self.isResetHidden, resetButtonType: self.resetButtonType)
                }
                ForEach(0 ..< self._items.count, id: \.self) { r in
                    ForEach(0 ..< self._items[r].count, id: \.self) { c in
                        if self._items[r][c].showsOnFilterFeedbackBar {
                            switch self._items[r][c] {
                            case .picker:
                                PickerMenuItem(item: Binding<SortFilterItem.PickerItem>(get: { self._items[r][c].picker }, set: { self._items[r][c].picker = $0 }), onUpdate: self.onUpdate, isResetHidden: self.isResetHidden, resetButtonType: self.resetButtonType)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].picker.label)
                                    .accessibilityIdentifier(self._items[r][c].picker.name)
                            case .filterfeedback:
                                FilterFeedbackMenuItem(item: Binding<SortFilterItem.PickerItem>(get: { self._items[r][c].filterfeedback }, set: { self._items[r][c].filterfeedback = $0 }), onUpdate: self.onUpdate)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].filterfeedback.label)
                                    .accessibilityIdentifier(self._items[r][c].filterfeedback.name)
                            case .switch:
                                SwitchMenuItem(item: Binding<SortFilterItem.SwitchItem>(get: { self._items[r][c].switch }, set: { self._items[r][c].switch = $0 }), onUpdate: self.onUpdate)
                                    .accessibilityElement()
                                    .accessibilityLabel(self.switchItemAccessibilityLabel(switchItem: self._items[r][c].switch))
                                    .accessibilityIdentifier(self._items[r][c].switch.name)
                            case .slider:
                                SliderMenuItem(item: Binding<SortFilterItem.SliderItem>(get: { self._items[r][c].slider }, set: { self._items[r][c].slider = $0 }), onUpdate: self.onUpdate, isResetHidden: self.isResetHidden)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].slider.label)
                                    .accessibilityIdentifier(self._items[r][c].slider.name)
                            case .datetime:
                                DateTimeMenuItem(item: Binding<SortFilterItem.DateTimeItem>(get: { self._items[r][c].datetime }, set: { self._items[r][c].datetime = $0 }), onUpdate: self.onUpdate, isResetHidden: self.isResetHidden)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].datetime.label)
                                    .accessibilityIdentifier(self._items[r][c].datetime.name)
                            case .stepper:
                                StepperMenuItem(item: Binding<SortFilterItem.StepperItem>(get: { self._items[r][c].stepper }, set: { self._items[r][c].stepper = $0 }), onUpdate: self.onUpdate, isResetHidden: self.isResetHidden)
                                    .accessibilityElement()
                                    .accessibilityLabel(self._items[r][c].stepper.label)
                                    .accessibilityIdentifier(self._items[r][c].stepper.name)
                            }
                        }
                    }
                }
                if self.fullCFGButton.position == .trailing {
                    FullCFGMenuItem(items: self.$_items, onUpdate: self.onUpdate, isResetHidden: self.isResetHidden, resetButtonType: self.resetButtonType)
                }
            }
        }
        .frame(minHeight: 44)
        .padding(.leading, 5)
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

struct SortFilterMenuItemFullConfigurationButtonKey: EnvironmentKey {
    public static var defaultValue: SortFilterMenuItemFullConfigurationButton = .none
}

/// Filter feedback bar item for displaying full configuration list
public struct SortFilterMenuItemFullConfigurationButton {
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
    
    private init(name: String? = nil, icon: String? = nil, position: Position) {
        self.name = name
        self.icon = icon
        self.position = position
    }
    
    /// Place the button at the beginning
    public static func leading(name: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(name: name, position: .leading)
    }
    
    /// Place the button at the beginning
    public static func leading(icon: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(icon: icon, position: .leading)
    }
    
    /// Place the button at the beginning
    public static func leading(name: String, icon: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(name: name, icon: icon, position: .leading)
    }
    
    /// Place the button at the end
    public static func trailing(name: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(name: name, position: .trailing)
    }
    
    /// Place the button at the end
    public static func trailing(icon: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(icon: icon, position: .trailing)
    }
    
    /// Place the button at the end
    public static func trailing(name: String, icon: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(name: name, icon: icon, position: .trailing)
    }
    
    /// No button for full configuration
    static var none = SortFilterMenuItemFullConfigurationButton(position: Position.none)
}

extension EnvironmentValues {
    var sortFilterMenuItemFullConfigurationButton: SortFilterMenuItemFullConfigurationButton {
        get {
            self[SortFilterMenuItemFullConfigurationButtonKey.self]
        }
        set {
            self[SortFilterMenuItemFullConfigurationButtonKey.self] = newValue
        }
    }
}

/// Experimental feature for adding full list of configuration to filter feedback bar
public extension View {
    /// Place the button at the beginning
    func leadingFullConfigurationMenuItem(name: String) -> some View {
        self.environment(\.sortFilterMenuItemFullConfigurationButton, .leading(name: name))
    }
    
    /// Place the button at the beginning
    func leadingFullConfigurationMenuItem(icon: String) -> some View {
        self.environment(\.sortFilterMenuItemFullConfigurationButton, .leading(icon: icon))
    }
    
    /// Place the button at the beginning
    func leadingFullConfigurationMenuItem(name: String, icon: String) -> some View {
        self.environment(\.sortFilterMenuItemFullConfigurationButton, .leading(name: name, icon: icon))
    }
    
    /// Place the button at the end
    func trailingFullConfigurationMenuItem(name: String) -> some View {
        self.environment(\.sortFilterMenuItemFullConfigurationButton, .trailing(name: name))
    }
    
    /// Place the button at the end
    func trailingFullConfigurationMenuItem(icon: String) -> some View {
        self.environment(\.sortFilterMenuItemFullConfigurationButton, .trailing(icon: icon))
    }
    
    /// Place the button at the end
    func trailingFullConfigurationMenuItem(name: String, icon: String) -> some View {
        self.environment(\.sortFilterMenuItemFullConfigurationButton, .trailing(name: name, icon: icon))
    }
}

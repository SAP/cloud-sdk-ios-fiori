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

    public init(items: Binding<[[SortFilterItem]]>) {
        self.__items = items
    }
}

extension _SortFilterMenuItemContainer: View {
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                if self.fullCFGButton.positon == .leading {
                    FullCFGMenuItem(items: self.$_items, onUpdate: self.onUpdate)
                }
                ForEach(0 ..< self._items.count) { r in
                    ForEach(0 ..< self._items[r].count) { c in
                        if self._items[r][c].showsOnFilterFeedbackBar {
                            switch self._items[r][c] {
                            case .picker:
                                PickerMenuItem(item: Binding<SortFilterItem.PickerItem>(get: { self._items[r][c].picker }, set: { self._items[r][c].picker = $0 }), onUpdate: self.onUpdate)
                            case .filterfeedback:
                                FilterFeedbackMenuItem(item: Binding<SortFilterItem.PickerItem>(get: { self._items[r][c].filterfeedback }, set: { self._items[r][c].filterfeedback = $0 }), onUpdate: self.onUpdate)
                            case .switch:
                                SwitchMenuItem(item: Binding<SortFilterItem.SwitchItem>(get: { self._items[r][c].switch }, set: { self._items[r][c].switch = $0 }), onUpdate: self.onUpdate)
                            case .slider:
                                SliderMenuItem(item: Binding<SortFilterItem.SliderItem>(get: { self._items[r][c].slider }, set: { self._items[r][c].slider = $0 }), onUpdate: self.onUpdate)
                            case .datetime:
                                DateTimeMenuItem(item: Binding<SortFilterItem.DateTimeItem>(get: { self._items[r][c].datetime }, set: { self._items[r][c].datetime = $0 }), onUpdate: self.onUpdate)
                            }
                        }
                    }
                }
                if self.fullCFGButton.positon == .trailing {
                    FullCFGMenuItem(items: self.$_items, onUpdate: self.onUpdate)
                }
            }
        }
        .frame(minHeight: 44)
        .padding(.leading, 5)
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
    public let positon: Position
    
    /// Location of the button
    public enum Position {
        /// Disaplay the button as the first one
        case leading
        /// Display the button as the last one
        case trailing
        /// No button displayed
        case none
    }
    
    private init(name: String? = nil, icon: String? = nil, positon: Position) {
        self.name = name
        self.icon = icon
        self.positon = positon
    }
    
    /// Place the button at the beginning
    public static func leading(name: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(name: name, positon: .leading)
    }
    
    /// Place the button at the beginning
    public static func leading(icon: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(icon: icon, positon: .leading)
    }
    
    /// Place the button at the beginning
    public static func leading(name: String, icon: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(name: name, icon: icon, positon: .leading)
    }
    
    /// Place the button at the end
    public static func trailing(name: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(name: name, positon: .trailing)
    }
    
    /// Place the button at the end
    public static func trailing(icon: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(icon: icon, positon: .trailing)
    }
    
    /// Place the button at the end
    public static func trailing(name: String, icon: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(name: name, icon: icon, positon: .trailing)
    }
    
    /// No button for full configuration
    static var none = SortFilterMenuItemFullConfigurationButton(positon: Position.none)
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

/// Experiemental feature for adding full list of configuraiton to filter feedback bar
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

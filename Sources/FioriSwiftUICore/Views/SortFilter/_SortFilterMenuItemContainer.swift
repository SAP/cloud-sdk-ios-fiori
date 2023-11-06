//
//  _SortFilterMenuItemContainer.swift
//
//
//  Created by Xu, Charles on 9/25/23.
//
import SwiftUI

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
                if fullCFGButton.positon == .leading {
                    FullCFGMenuItem(items: $_items, onUpdate: onUpdate)
                }
                ForEach(0 ..< _items.count) { r in
                    ForEach(0 ..< _items[r].count) { c in
                        if _items[r][c].showsOnFilterFeedbackBar {
                            switch _items[r][c] {
                            case .picker:
                                PickerMenuItem(item: Binding<PickerItem>(get: { _items[r][c].picker }, set: { _items[r][c].picker = $0 }), onUpdate: onUpdate)
                            case .filterfeedback:
                                FilterFeedbackMenuItem(item: Binding<PickerItem>(get: { _items[r][c].filterfeedback }, set: { _items[r][c].filterfeedback = $0 }), onUpdate: onUpdate)
                            case .switch:
                                SwitchMenuItem(item: Binding<SwitchItem>(get: { _items[r][c].switch }, set: { _items[r][c].switch = $0 }), onUpdate: onUpdate)
                            case .slider:
                                SliderMenuItem(item: Binding<SliderItem>(get: { _items[r][c].slider }, set: { _items[r][c].slider = $0 }), onUpdate: onUpdate)
                            case .datetime:
                                DateTimeMenuItem(item: Binding<DateTimeItem>(get: { _items[r][c].datetime }, set: { _items[r][c].datetime = $0 }), onUpdate: onUpdate)
                            }
                        }
                    }
                }
                if fullCFGButton.positon == .trailing {
                    FullCFGMenuItem(items: $_items, onUpdate: onUpdate)
                }
            }
        }
        .frame(minHeight: 44)
        .padding(.leading, 5)
    }
}

public struct SortFilterMenuItemFullConfigurationButtonKey: EnvironmentKey {
    public static var defaultValue: SortFilterMenuItemFullConfigurationButton = .none
}

public struct SortFilterMenuItemFullConfigurationButton {
    public let name: String?
    public let icon: String?
    public let positon: Position
    
    public enum Position {
        case leading, trailing, none
    }
    
    private init(name: String? = nil, icon: String? = nil, positon: Position) {
        self.name = name
        self.icon = icon
        self.positon = positon
    }
    
    public static func leading(name: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(name: name, positon: .leading)
    }
    
    public static func leading(icon: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(icon: icon, positon: .leading)
    }
    
    public static func leading(name: String, icon: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(name: name, icon: icon, positon: .leading)
    }
    
    public static func trailing(name: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(name: name, positon: .trailing)
    }
    
    public static func trailing(icon: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(icon: icon, positon: .trailing)
    }
    
    public static func trailing(name: String, icon: String) -> SortFilterMenuItemFullConfigurationButton {
        SortFilterMenuItemFullConfigurationButton(name: name, icon: icon, positon: .trailing)
    }
    
    static var none = SortFilterMenuItemFullConfigurationButton(positon: Position.none)
}

public extension EnvironmentValues {
    var sortFilterMenuItemFullConfigurationButton: SortFilterMenuItemFullConfigurationButton {
        get {
            self[SortFilterMenuItemFullConfigurationButtonKey.self]
        }
        set {
            self[SortFilterMenuItemFullConfigurationButtonKey.self] = newValue
        }
    }
}

public extension View {
    func leadingFullConfigurationMenuItem(name: String) -> some View {
        self.environment(\.sortFilterMenuItemFullConfigurationButton, .leading(name: name))
    }
    
    func leadingFullConfigurationMenuItem(icon: String) -> some View {
        self.environment(\.sortFilterMenuItemFullConfigurationButton, .leading(icon: icon))
    }
    
    func leadingFullConfigurationMenuItem(name: String, icon: String) -> some View {
        self.environment(\.sortFilterMenuItemFullConfigurationButton, .leading(name: name, icon: icon))
    }
    
    func trailingFullConfigurationMenuItem(name: String) -> some View {
        self.environment(\.sortFilterMenuItemFullConfigurationButton, .trailing(name: name))
    }
    
    func trailingFullConfigurationMenuItem(icon: String) -> some View {
        self.environment(\.sortFilterMenuItemFullConfigurationButton, .trailing(icon: icon))
    }
    
    func trailingFullConfigurationMenuItem(name: String, icon: String) -> some View {
        self.environment(\.sortFilterMenuItemFullConfigurationButton, .trailing(name: name, icon: icon))
    }
}

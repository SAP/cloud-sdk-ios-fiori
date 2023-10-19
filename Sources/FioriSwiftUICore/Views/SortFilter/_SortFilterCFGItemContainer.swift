//
import FioriThemeManager
//  _SortFilterMenuItemContainer.swift
//
//
//  Created by Xu, Charles on 9/25/23.
//
import SwiftUI

public struct _SortFilterCFGItemContainer {
//    @Environment(\.onModelUpdateAppCallback) var onUpdate: () -> Void
//    @Environment(\.cancelActionView) var cancelActionView: any View
//    @Environment(\.resetActionView) var resetActionView: any View
//    @Environment(\.applyActionView) var applyActionView: any View
    @EnvironmentObject var context: SortFilterContext

    @Binding var _items: [[SortFilterItem]]
    
    public init(items: Binding<[[SortFilterItem]]>) {
        self.__items = items
    }
}

extension _SortFilterCFGItemContainer: View {
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0 ..< _items.count) { r in
                    ForEach(0 ..< _items[r].count) { c in
                        switch _items[r][c] {
                        case .picker:
                            VStack {
                                HStack {
                                    Text(_items[r][c].picker.name)
                                        .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                                        .foregroundColor(Color.preferredColor(.primaryLabel))
                                    Spacer()
                                }
                                OptionListPicker(
                                    value: Binding<[Int]>(get: { _items[r][c].picker.workingValue }, set: { _items[r][c].picker.workingValue = $0 }),
                                    valueOptions: _items[r][c].picker.valueOptions,
                                    onTap: { index in
                                        _items[r][c].picker.onTap(option: _items[r][c].picker.valueOptions[index])
                                    }
                                )
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.preferredColor(.separator), lineWidth: 2)
                            )
                        case .filterfeedback:
                            VStack {
                                HStack {
                                    Text(_items[r][c].filterfeedback.name)
                                        .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                                        .foregroundColor(Color.preferredColor(.primaryLabel))
                                    Spacer()
                                }
                                OptionListPicker(
                                    value: Binding<[Int]>(get: { _items[r][c].filterfeedback.workingValue }, set: { _items[r][c].filterfeedback.workingValue = $0 }),
                                    valueOptions: _items[r][c].filterfeedback.valueOptions,
                                    onTap: { index in
                                        _items[r][c].filterfeedback.onTap(option: _items[r][c].filterfeedback.valueOptions[index])
                                    }
                                )
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.preferredColor(.separator), lineWidth: 2)
                            )
                            
                        case .switch:
                            VStack {
//                                Text(_items[r][c].switch.name)
                                SwitchPicker(value: Binding<Bool?>(get: { _items[r][c].switch.workingValue }, set: { _items[r][c].switch.workingValue = $0 }), name: _items[r][c].switch.name, hint: nil)
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.preferredColor(.separator), lineWidth: 2)
                            )
                        case .slider:
                            VStack {
                                HStack {
                                    Text(_items[r][c].slider.name)
                                        .font(.headline)
                                    Spacer()
                                }
                                SliderPicker(
                                    value: Binding<Int?>(get: { _items[r][c].slider.workingValue }, set: { _items[r][c].slider.workingValue = $0 }),
                                    minimumValue: _items[r][c].slider.minimumValue,
                                    maximumValue: _items[r][c].slider.maximumValue
                                )
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.preferredColor(.separator), lineWidth: 2)
                            )
                        case .datetime:
                            VStack {
                                HStack {
                                    Text(_items[r][c].datetime.name)
                                        .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                                        .foregroundColor(Color.preferredColor(.primaryLabel))
                                    Spacer()
                                    DatePicker(
                                        "Time",
                                        selection: Binding<Date>(get: { _items[r][c].datetime.workingValue ?? Date() }, set: { _items[r][c].datetime.workingValue = $0 }),
                                        displayedComponents: [.hourAndMinute]
                                    )
                                    .labelsHidden()
                                }

                                DatePicker(
                                    _items[r][c].datetime.label,
                                    selection: Binding<Date>(get: { _items[r][c].datetime.workingValue ?? Date() }, set: { _items[r][c].datetime.workingValue = $0 }),
                                    displayedComponents: [.date]
                                )
                                .datePickerStyle(.graphical)
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.preferredColor(.separator), lineWidth: 2)
                            )
                        }
                    }
                }
            }
        }
        .onChange(of: _items) { _ in
            for item in _items.joined() {
                if item.isChanged {
                    context.isResetButtonEnabled = true
                    context.isApplyButtonEnabled = true
                    return
                }
            }
            context.isResetButtonEnabled = true
        }
        .onAppear {
            context.handleCancel = {
                print("....cancel in context...")
                for r in 0 ..< _items.count {
                    for c in 0 ..< _items[r].count {
                        _items[r][c].cancel()
                    }
                }
            }
    
            context.handleReset = {
                print("....reset in context...")
                for r in 0 ..< _items.count {
                    for c in 0 ..< _items[r].count {
                        _items[r][c].reset()
                    }
                }
            }
    
            context.handleApply = {
                print("....apply in context...")
                for r in 0 ..< _items.count {
                    for c in 0 ..< _items[r].count {
                        _items[r][c].apply()
                    }
                }
            }
            
            context.isResetButtonEnabled = false
            context.isApplyButtonEnabled = false
        }
    }
}

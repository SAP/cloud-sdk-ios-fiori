//  _SortFilterMenuItemContainer.swift
//
//
//  Created by Xu, Charles on 9/25/23.
//
import SwiftUI
import FioriThemeManager

/// :nodoc:
public struct _SortFilterCFGItemContainer {
    @EnvironmentObject var context: SortFilterContext

    @Binding var _items: [[SortFilterItem]]
    
    public init(items: Binding<[[SortFilterItem]]>) {
        self.__items = items
    }
}

extension _SortFilterCFGItemContainer: View {
    /// :nodoc:
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 30) {
                ForEach(0 ..< _items.count) { r in
                    VStack {
                        ForEach(0 ..< _items[r].count) { c in
                            switch _items[r][c] {
                            case .picker:
                                picker(row: r, column: c)
                            case .filterfeedback:
                                filterfeedback(row: r, column: c)
                            case .switch:
                                switcher(row: r, column: c)
                            case .slider:
                                slider(row: r, column: c)
                            case .datetime:
                                datetimePicker(row: r, column: c)
                                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 : UIScreen.main.bounds.size.width)
                            }
                        }
                    }
                    .padding([.top], 12)
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 * 2: UIScreen.main.bounds.size.width - 16 * 2)
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 : UIScreen.main.bounds.size.width)
                    .background(Color.preferredColor(.secondaryGroupedBackground))
                }
            }
            .background(Color.preferredColor(.secondaryBackground))
        }
        .onChange(of: _items) { _ in
            checkUpdateButtonState()
        }
        .onAppear {
            context.handleCancel = {
                for r in 0 ..< _items.count {
                    for c in 0 ..< _items[r].count {
                        _items[r][c].cancel()
                    }
                }
            }
    
            context.handleReset = {
                for r in 0 ..< _items.count {
                    for c in 0 ..< _items[r].count {
                        _items[r][c].reset()
                    }
                }
            }
    
            context.handleApply = {
                for r in 0 ..< _items.count {
                    for c in 0 ..< _items[r].count {
                        _items[r][c].apply()
                    }
                }
            }
            
            checkUpdateButtonState()
        }
    }
    
    func checkUpdateButtonState() {
        var isApplyButtonEnabled = false
        var isResetButtonEnabled = false
        
        for item in _items.joined() {
            if !isApplyButtonEnabled && item.isChanged {
                isApplyButtonEnabled = true
                print("Enable apply button.")
            }
            if !isResetButtonEnabled && !item.isOriginal {
                isResetButtonEnabled = true
                print("Enable reset button.")
            }
        }
        context.isApplyButtonEnabled = isApplyButtonEnabled
        context.isResetButtonEnabled = isResetButtonEnabled
    }
    
    func picker(row r: Int, column c: Int) -> some View {
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
    }
    
    func filterfeedback(row r: Int, column c: Int) -> some View {
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
    }
    
    func switcher(row r: Int, column c: Int) -> some View {
        VStack {
            SwitchPicker(value: Binding<Bool?>(get: { _items[r][c].switch.workingValue }, set: { _items[r][c].switch.workingValue = $0 }), name: _items[r][c].switch.name, hint: nil)
        }
    }
    
    func slider(row r: Int, column c: Int) -> some View {
        VStack {
            HStack {
                Text(_items[r][c].slider.name)
                    .font(.headline)
                Spacer()
            }
            SliderPicker(
                value: Binding<Int?>(get: { _items[r][c].slider.workingValue }, set: { _items[r][c].slider.workingValue = $0 }),
                formatter: _items[r][c].slider.formatter,
                minimumValue: _items[r][c].slider.minimumValue,
                maximumValue: _items[r][c].slider.maximumValue
            )
        }
    }
    
    func datetimePicker(row r: Int, column c: Int) -> some View {
        VStack {
            HStack {
                Text(_items[r][c].datetime.name)
                    .font(.fiori(forTextStyle: .headline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                Spacer()
            }
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 * 2 : UIScreen.main.bounds.size.width - 16 * 2)

            HStack {
                Text(NSLocalizedString("Time", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                    .font(.fiori(forTextStyle: .headline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                Spacer()
                DatePicker(
                    "",
                    selection: Binding<Date>(get: { _items[r][c].datetime.workingValue ?? Date() }, set: { _items[r][c].datetime.workingValue = $0 }),
                    displayedComponents: [.hourAndMinute]
                )
                .labelsHidden()
            }
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 * 2 : UIScreen.main.bounds.size.width - 16 * 2)
            
            DatePicker(
                "",
                selection: Binding<Date>(get: { _items[r][c].datetime.workingValue ?? Date() }, set: { _items[r][c].datetime.workingValue = $0 }),
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .labelsHidden()
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 : UIScreen.main.bounds.size.width - 16)
//            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 : UIScreen.main.bounds.size.width)
            .clipped()
//            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 * 2: UIScreen.main.bounds.size.width)
        }
    }
}

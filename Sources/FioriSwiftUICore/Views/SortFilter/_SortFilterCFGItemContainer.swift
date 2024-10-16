import FioriThemeManager

//  _SortFilterMenuItemContainer.swift
//
//
//  Created by Xu, Charles on 9/25/23.
//
import SwiftUI

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
                ForEach(0 ..< self._items.count, id: \.self) { r in
                    VStack {
                        ForEach(0 ..< self._items[r].count, id: \.self) { c in
                            switch self._items[r][c] {
                            case .picker:
                                self.picker(row: r, column: c)
                            case .filterfeedback:
                                self.filterfeedback(row: r, column: c)
                            case .switch:
                                self.switcher(row: r, column: c)
                            case .slider:
                                self.slider(row: r, column: c)
                            case .datetime:
                                self.datetimePicker(row: r, column: c)
                                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 : Screen.bounds.size.width)
                            }
                        }
                    }
                    .padding([.top], 12)
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 * 2 : Screen.bounds.size.width - 16 * 2)
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 : Screen.bounds.size.width)
                    .background(Color.preferredColor(.secondaryGroupedBackground))
                }
            }
            .background(Color.preferredColor(.primaryGroupedBackground))
        }
        .background(Color.preferredColor(.primaryGroupedBackground))
        .onChange(of: self._items) { _ in
            self.checkUpdateButtonState()
        }
        .onAppear {
            self.context.handleCancel = {
                for r in 0 ..< self._items.count {
                    for c in 0 ..< self._items[r].count {
                        self._items[r][c].cancel()
                    }
                }
            }
    
            self.context.handleReset = {
                for r in 0 ..< self._items.count {
                    for c in 0 ..< self._items[r].count {
                        self._items[r][c].reset()
                    }
                }
            }
    
            self.context.handleApply = {
                for r in 0 ..< self._items.count {
                    for c in 0 ..< self._items[r].count {
                        self._items[r][c].apply()
                    }
                }
            }
            
            self.checkUpdateButtonState()
        }
    }
    
    func checkUpdateButtonState() {
        var isApplyButtonEnabled = false
        var isResetButtonEnabled = false
        
        for item in self._items.joined() {
            if !isApplyButtonEnabled, item.isChanged {
                isApplyButtonEnabled = true
                print("Enable apply button.")
            }
            if !isResetButtonEnabled, !item.isOriginal {
                isResetButtonEnabled = true
                print("Enable reset button.")
            }
        }
        self.context.isApplyButtonEnabled = isApplyButtonEnabled
        self.context.isResetButtonEnabled = isResetButtonEnabled
    }
    
    func picker(row r: Int, column c: Int) -> some View {
        VStack {
            HStack {
                Text(self._items[r][c].picker.name)
                    .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                Spacer()
            }
            switch self._items[r][c].picker.displayMode {
            case .automatic:
                if self._items[r][c].picker.valueOptions.count > 8 {
                    SearchListPickerItem(
                        value: Binding<[Int]>(get: { self._items[r][c].picker.workingValue }, set: { self._items[r][c].picker.workingValue = $0 }),
                        valueOptions: self._items[r][c].picker.valueOptions,
                        allowsMultipleSelection: self._items[r][c].picker.allowsMultipleSelection,
                        allowsEmptySelection: self._items[r][c].picker.allowsEmptySelection
                    ) { index in
                        self._items[r][c].picker.onTap(option: self._items[r][c].picker.valueOptions[index])
                    } selectAll: { isAll in
                        self._items[r][c].picker.selectAll(isAll)
                    }
                } else {
                    self.filterFormCell(row: r, column: c)
                }
            case .filterFormCell:
                self.filterFormCell(row: r, column: c)
            case .menu:
                self.filterFormCell(row: r, column: c)
            case .list:
                SearchListPickerItem(
                    value: Binding<[Int]>(get: { self._items[r][c].picker.workingValue }, set: { self._items[r][c].picker.workingValue = $0 }),
                    valueOptions: self._items[r][c].picker.valueOptions,
                    allowsMultipleSelection: self._items[r][c].picker.allowsMultipleSelection,
                    allowsEmptySelection: self._items[r][c].picker.allowsEmptySelection
                ) { index in
                    self._items[r][c].picker.onTap(option: self._items[r][c].picker.valueOptions[index])
                } selectAll: { isAll in
                    self._items[r][c].picker.selectAll(isAll)
                }
            }
        }
    }
    
    func filterfeedback(row r: Int, column c: Int) -> some View {
        VStack {
            HStack {
                Text(self._items[r][c].filterfeedback.name)
                    .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                Spacer()
            }
            OptionListPickerItem(
                value: Binding<[Int]>(get: { self._items[r][c].filterfeedback.workingValue }, set: { self._items[r][c].filterfeedback.workingValue = $0 }),
                valueOptions: self._items[r][c].filterfeedback.valueOptions,
                onTap: { index in
                    self._items[r][c].filterfeedback.onTap(option: self._items[r][c].filterfeedback.valueOptions[index])
                }
            )
        }
    }
    
    func switcher(row r: Int, column c: Int) -> some View {
        VStack {
            SwitchPickerItem(value: Binding<Bool?>(get: { self._items[r][c].switch.workingValue }, set: { self._items[r][c].switch.workingValue = $0 }), name: self._items[r][c].switch.name, hint: nil)
        }
    }
    
    func slider(row r: Int, column c: Int) -> some View {
        VStack {
            HStack {
                Text(self._items[r][c].slider.name)
                    .font(.headline)
                Spacer()
            }
            SliderPickerItem(
                value: Binding<Int?>(get: { self._items[r][c].slider.workingValue }, set: { self._items[r][c].slider.workingValue = $0 }),
                formatter: self._items[r][c].slider.formatter,
                minimumValue: self._items[r][c].slider.minimumValue,
                maximumValue: self._items[r][c].slider.maximumValue
            )
        }
    }
    
    func datetimePicker(row r: Int, column c: Int) -> some View {
        VStack {
            HStack {
                Text(self._items[r][c].datetime.name)
                    .font(.fiori(forTextStyle: .headline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                Spacer()
            }
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 * 2 : Screen.bounds.size.width - 16 * 2)

            HStack {
                Text(NSLocalizedString("Time", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                    .font(.fiori(forTextStyle: .headline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                Spacer()
                DatePicker(
                    "",
                    selection: Binding<Date>(get: { self._items[r][c].datetime.workingValue ?? Date() }, set: { self._items[r][c].datetime.workingValue = $0 }),
                    displayedComponents: [.hourAndMinute]
                )
                .labelsHidden()
            }
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 * 2 : Screen.bounds.size.width - 16 * 2)
            
            DatePicker(
                "",
                selection: Binding<Date>(get: { self._items[r][c].datetime.workingValue ?? Date() }, set: { self._items[r][c].datetime.workingValue = $0 }),
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .labelsHidden()
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 : Screen.bounds.size.width - 16)
//            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 : UIScreen.main.bounds.size.width)
            .clipped()
//            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 * 2: UIScreen.main.bounds.size.width)
        }
    }
    
    private func filterFormCell(row r: Int, column c: Int) -> some View {
        OptionListPickerItem(
            value: Binding<[Int]>(get: { self._items[r][c].picker.workingValue }, set: { self._items[r][c].picker.workingValue = $0 }),
            valueOptions: self._items[r][c].picker.valueOptions,
            itemLayout: self._items[r][c].picker.itemLayout,
            onTap: { index in
                self._items[r][c].picker.onTap(option: self._items[r][c].picker.valueOptions[index])
            }
        )
    }
    
    private func menuView(row r: Int, column c: Int) -> some View {
        HStack {
            Menu {
                ForEach(self._items[r][c].picker.valueOptions.indices, id: \.self) { idx in
                    if self._items[r][c].picker.isOptionSelected(index: idx) {
                        Button {
                            self._items[r][c].picker.onTap(option: self._items[r][c].picker.valueOptions[idx])
                            self._items[r][c].picker.apply()
                        } label: {
                            Label { Text(self._items[r][c].picker.valueOptions[idx]) } icon: { Image(fioriName: "fiori.accept") }
                        }
                    } else {
                        Button(self._items[r][c].picker.valueOptions[idx]) {
                            self._items[r][c].picker.onTap(option: self._items[r][c].picker.valueOptions[idx])
                            self._items[r][c].picker.apply()
                        }
                    }
                }
            } label: {
                FilterFeedbackBarItem(leftIcon: self.icon(name: self._items[r][c].picker.icon, isVisible: true), title: self._items[r][c].picker.label, isSelected: self._items[r][c].picker.isChecked)
            }
        }
    }
    
    private func icon(name: String?, isVisible: Bool) -> Image? {
        if isVisible {
            if let name {
                return Image(systemName: name)
            }
        }
        return nil
    }
}

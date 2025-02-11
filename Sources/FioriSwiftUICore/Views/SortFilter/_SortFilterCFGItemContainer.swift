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
    @State var height = 88.0
    /// The frame of the view toggle to show this view.
    var btnFrame: CGRect = .zero
    var showSubList: ((Bool) -> Void)?
    #if !os(visionOS)
        let popoverWidth = 393.0
    #else
        let popoverWidth = 480.0
    #endif
    @State var stepperViewHeight: CGFloat = 110
    @State var searchListHeight: CGFloat = 88.0
    @State var _keyboardHeight: CGFloat = 0.0
    @State private var onErrorMessage = ""
    @State private var sliderDescType: SliderValueChangeHandler.SliderInformationType = .fiori

    /// Create a SortFilterCFGItemContainer view.
    /// - Parameters:
    ///   - items: Option views in the list.
    ///   - btnFrame: The frame of the view toggle to show this view.
    public init(items: Binding<[[SortFilterItem]]>, btnFrame: CGRect = .zero) {
        self.__items = items
        self.btnFrame = btnFrame
    }
}

extension _SortFilterCFGItemContainer: View {
    /// :nodoc:
    public var body: some View {
        List {
            ForEach(0 ..< self._items.count, id: \.self) { r in
                Section {
                    ForEach(0 ..< self._items[r].count, id: \.self) { c in
                        if self._items[r][c].showsOnFilterFeedbackBar {
                            self.rowView(row: r, column: c)
                                .listRowSeparator(c == self._items[r].count - 1 ? .hidden : .visible, edges: .all)
                                .padding([.leading, .trailing], UIDevice.current.userInterfaceIdiom != .phone ? 13 : 16)
                                .frame(width: UIDevice.current.userInterfaceIdiom != .phone ? self.popoverWidth : nil)
                        }
                    }
                    #if !os(visionOS)
                        Rectangle().fill(Color.preferredColor(.primaryGroupedBackground))
                            .frame(height: 30)
                            .listRowInsets(EdgeInsets())
                    #endif
                }
                .listSectionSeparator(.hidden, edges: .all)
                .listRowInsets(EdgeInsets())
                #if !os(visionOS)
                    .listRowBackground(Color.preferredColor(.secondaryGroupedBackground))
                #else
                    .listRowBackground(Color.clear)
                #endif
            }
        }
        .listRowSpacing(0)
        .listStyle(.plain)
        .frame(width: UIDevice.current.userInterfaceIdiom != .phone ? self.popoverWidth : nil)
        .frame(height: UIDevice.current.userInterfaceIdiom != .phone ? self.listHeight() : nil)
        #if !os(visionOS)
            .listRowBackground(Color.preferredColor(.secondaryGroupedBackground))
        #else
            .listRowBackground(Color.clear)
        #endif
            .environment(\.defaultMinListRowHeight, 0)
            .environment(\.defaultMinListHeaderHeight, 0)
            .modifier(FioriIntrospectModifier<UIScrollView> { scrollView in
                if !self.context.isPickerListShown {
                    DispatchQueue.main.async {
                        let maxScrollHeight = self.calculateMaxScrollHeight()
                        self.height = min(scrollView.contentSize.height, maxScrollHeight)
                    }
                }
            })
            .setOnChange(of: self._items) {
                self.checkUpdateButtonState()
            }
            .onAppear {
                self.context.isPickerListShown = false
                self.context.isSearchBarHidden = true
                
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
    
    private func listHeight() -> CGFloat {
        if self.searchListHeight != 88.0 {
            if self.context.isPickerListShown {
                return self.searchListHeight
            } else {
                return self.height
            }
        } else {
            return self.height
        }
    }
    
    private func calculateMaxScrollHeight() -> CGFloat {
        let screenHeight = Screen.bounds.size.height
        let safeAreaInset = UIEdgeInsets.getSafeAreaInsets()
        if UIDevice.current.userInterfaceIdiom != .phone {
            var maxScrollViewHeight = screenHeight - self.additionalHeight()
            if self.btnFrame.arrowDirection() == .top {
                maxScrollViewHeight -= (self.btnFrame.maxY + 30)
                maxScrollViewHeight -= self._keyboardHeight
            } else if self.btnFrame.arrowDirection() == .bottom {
                maxScrollViewHeight -= (screenHeight - self.btnFrame.minY + 30) + safeAreaInset.bottom + 13
                if self._keyboardHeight > 0 {
                    let keyboardItemHeight = (self._keyboardHeight - (screenHeight - self.btnFrame.minY))
                    if keyboardItemHeight > 0 {
                        maxScrollViewHeight -= keyboardItemHeight
                    }
                }
            }
            return maxScrollViewHeight
        } else {
            var maxScrollViewHeight = screenHeight - 56
            maxScrollViewHeight -= (safeAreaInset.top + safeAreaInset.bottom + 60)
            maxScrollViewHeight -= self._keyboardHeight
            return maxScrollViewHeight
        }
    }
    
    private func additionalHeight() -> CGFloat {
        let isNotIphone = UIDevice.current.userInterfaceIdiom != .phone
        var height = 0.0
        height += UIEdgeInsets.getSafeAreaInsets().bottom + (isNotIphone ? 13 : 16)
        height += isNotIphone ? 50 : 56
        if self._keyboardHeight == 0 {
            height += 52
        }
        return height
    }
    
    /// Calculate list height when picker displayMode is `.list`.
    /// - Parameter pickerItem: PickerItem
    /// - Returns: list height
    private func calculatePickerListHeight(pickerItem: SortFilterItem.PickerItem) -> CGFloat {
        let isNotIphone = UIDevice.current.userInterfaceIdiom != .phone
        let screenHeight = Screen.bounds.size.height
        let safeAreaInset = UIEdgeInsets.getSafeAreaInsets()
        var maxScrollViewHeight = screenHeight - UIEdgeInsets.getSafeAreaInsets().bottom - (isNotIphone ? 13 : 16) - (isNotIphone ? 50 : 56)
        if !pickerItem.isSearchBarHidden {
            if self._keyboardHeight == 0 {
                maxScrollViewHeight -= 52
            }
        }
        if UIDevice.current.userInterfaceIdiom != .phone {
            if self.btnFrame.arrowDirection() == .top {
                maxScrollViewHeight -= (self.btnFrame.maxY + 30)
                maxScrollViewHeight -= self._keyboardHeight
            } else if self.btnFrame.arrowDirection() == .bottom {
                maxScrollViewHeight -= (screenHeight - self.btnFrame.minY + 30) + safeAreaInset.bottom + 13
                if self._keyboardHeight > 0 {
                    let keyboardItemHeight = (self._keyboardHeight - (screenHeight - self.btnFrame.minY))
                    if keyboardItemHeight > 0 {
                        maxScrollViewHeight -= keyboardItemHeight
                    }
                }
            }
        } else {
            maxScrollViewHeight -= (safeAreaInset.top + 30)
            maxScrollViewHeight -= self._keyboardHeight
        }
        return maxScrollViewHeight
    }
    
    @ViewBuilder
    func rowView(row r: Int, column c: Int) -> some View {
        switch self._items[r][c] {
        case .picker:
            if self._items[r][c].picker.displayMode == .list || (self._items[r][c].picker.displayMode == .automatic && self._items[r][c].picker.valueOptions.count > 8) {
                self.navigationLink(row: r, column: c)
            } else {
                self.picker(row: r, column: c)
                    .padding([.top, .bottom], 12)
            }
        case .filterfeedback:
            self.filterfeedback(row: r, column: c)
                .padding([.top, .bottom], 12)
        case .switch:
            self.switcher(row: r, column: c)
        case .slider:
            self.slider(row: r, column: c)
                .padding([.top], 12)
        case .datetime:
            self.datetimePicker(row: r, column: c)
                .padding([.top, .bottom], 12)
        case .stepper:
            self.stepper(row: r, column: c)
                .padding([.top, .bottom], 12)
        }
    }
    
    func navigationLink(row r: Int, column c: Int) -> some View {
        NavigationLink {
            SearchListPickerItem(
                value: Binding<[Int]>(get: { self._items[r][c].picker.workingValue }, set: { self._items[r][c].picker.workingValue = $0 }),
                valueOptions: self._items[r][c].picker.valueOptions,
                allowsMultipleSelection: self._items[r][c].picker.allowsMultipleSelection,
                allowsEmptySelection: self._items[r][c].picker.allowsEmptySelection,
                isSearchBarHidden: self._items[r][c].picker.isSearchBarHidden,
                disableListEntriesSection: self._items[r][c].picker.disableListEntriesSection,
                allowsDisplaySelectionCount: self._items[r][c].picker.allowsDisplaySelectionCount
            ) { index in
                self._items[r][c].picker.optionOnTap(index)
            } selectAll: { isAll in
                self._items[r][c].picker.selectAll(isAll)
            }
            .modifier(FioriIntrospectModifier<UIScrollView> { scrollView in
                DispatchQueue.main.async {
                    self.searchListHeight = min(scrollView.contentSize.height, self.calculatePickerListHeight(pickerItem: self._items[r][c].picker))
                }
            })
            .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                v.frame(height: self.searchListHeight)
                    .onAppear {
                        self.context.isPickerListShown = true
                        self.context.isSearchBarHidden = self._items[r][c].picker.isSearchBarHidden
                    }
                    .onDisappear {
                        self.searchListHeight = 88.0
                    }
            })
            .ifApply(!self._items[r][c].picker.resetButtonConfiguration.isHidden, content: { v in
                v.toolbar {
                    let item = self._items[r][c].picker
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if item.resetButtonConfiguration.isHidden {
                            EmptyView()
                        } else {
                            _Action(actionText: item.resetButtonConfiguration.title, didSelectAction: {
                                if item.resetButtonConfiguration.type == .reset {
                                    self._items[r][c].picker.reset()
                                } else {
                                    self._items[r][c].picker.clearAll()
                                }
                            })
                            .buttonStyle(ResetButtonStyle())
                            .disabled(item.resetButtonConfiguration.type == .reset ? item.isOriginal : item.workingValue.isEmpty)
                        }
                    }
                }
            })
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidShowNotification)) { notif in
                let rect = (notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) ?? .zero
                self._keyboardHeight = rect.height
                if self.searchListHeight > self._keyboardHeight {
                    self.searchListHeight -= self._keyboardHeight
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidHideNotification)) { _ in
                self.searchListHeight += self._keyboardHeight
                self._keyboardHeight = 0
            }
            Spacer()
        } label: {
            KeyValueItem(key: {
                Text(self._items[r][c].picker.name)
                    .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
            }, value: {
                let workingValue = Binding<[Int]>(get: { self._items[r][c].picker.workingValue }, set: { self._items[r][c].picker.workingValue = $0 })
                if workingValue.count == 1 {
                    switch self._items[r][c].picker.barItemDisplayMode {
                    case .name:
                        Text(self._items[r][c].picker.name)
                    case .value:
                        Text(self._items[r][c].picker.valueOptions[workingValue.wrappedValue[0]])
                    case .nameAndValue:
                        Text(self._items[r][c].picker.name + ": " + self._items[r][c].picker.valueOptions[workingValue.wrappedValue[0]])
                    }
                } else {
                    if self._items[r][c].picker.allowsMultipleSelection, workingValue.count >= 1 {
                        Text("\(self._items[r][c].picker.name) (\(workingValue.count))")
                    } else {
                        Text(self._items[r][c].picker.name)
                    }
                }
            }, axis: .horizontal)
        }
        #if !os(visionOS)
        .listRowBackground(Color.preferredColor(.secondaryGroupedBackground))
        #else
        .listRowBackground(Color.clear)
        #endif
        .frame(minHeight: 44)
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
                    self.navigationLink(row: r, column: c)
                } else {
                    self.filterFormCell(row: r, column: c)
                }
            case .filterFormCell:
                self.filterFormCell(row: r, column: c)
            case .menu:
                self.filterFormCell(row: r, column: c)
            case .list:
                self.navigationLink(row: r, column: c)
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
        SwitchView(title: AttributedString(self._items[r][c].switch.name), isOn: Binding<Bool>(get: { self._items[r][c].switch.workingValue ?? false }, set: { self._items[r][c].switch.workingValue = $0 }))
            .titleStyle(content: { config in
                config.title
                    .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
            })
            .padding([.top, .bottom], 6.5)
    }
    
    func slider(row r: Int, column c: Int) -> some View {
        VStack {
            HStack {
                Text(self._items[r][c].slider.name)
                    .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                Spacer()
            }
            
            let titleView: any View = self._items[r][c].slider.formatter != nil ? Text(self._items[r][c].slider.formatter ?? "") : EmptyView()
            if self._items[r][c].slider.sliderMode == .single {
                FioriSlider(
                    titleView: { titleView },
                    value: Binding<Double>(get: { self._items[r][c].slider.workingValue ?? self._items[r][c].slider.minimumValue }, set: { self._items[r][c].slider.workingValue = $0 }),
                    range: self._items[r][c].slider.range,
                    step: self._items[r][c].slider.step,
                    decimalPlaces: self._items[r][c].slider.decimalPlaces,
                    description: self._items[r][c].slider.hint.attributedString,
                    showsValueLabel: true
                )
            } else {
                FioriSlider(
                    titleView: { titleView },
                    lowerValue: Binding<Double>(get: { self._items[r][c].slider.workingLowerValue ?? self._items[r][c].slider.minimumValue }, set: { self._items[r][c].slider.workingLowerValue = $0 }),
                    upperValue: Binding<Double>(get: { self._items[r][c].slider.workingUpperValue ?? self._items[r][c].slider.maximumValue }, set: { self._items[r][c].slider.workingUpperValue = $0 }),
                    range: self._items[r][c].slider.range,
                    step: self._items[r][c].slider.step,
                    decimalPlaces: self._items[r][c].slider.decimalPlaces,
                    description: self.onErrorMessage == "" ? self._items[r][c].slider.hint.attributedString : self.onErrorMessage.attributedString,
                    onRangeValueChange: { isEditing, lowerValue, upperValue in
                        if !isEditing {
                            guard let onValueChange = self._items[r][c].slider.onValueChange else {
                                self.sliderDescType = .fiori
                                self.onErrorMessage = ""
                                return
                            }
                            let (type, message) = onValueChange.onValueChange(lowerValue, upperValue)
                            self.sliderDescType = type
                            self.onErrorMessage = message
                        }
                    }
                )
                .ifApply(self.sliderDescType == .error, content: { v in
                    v.leadingAccessoryStyle(textFieldStyle: FioriSliderTextFieldStyle(borderColor: self.lowerTextFieldBorderColor(item: self._items[r][c].slider), focusedBorderColor: self.lowerTextFieldBorderColor(item: self._items[r][c].slider), borderWidth: 0.5, focusedBorderWidth: 2.0))
                        .trailingAccessoryStyle(textFieldStyle: FioriSliderTextFieldStyle(borderColor: self.upperTextFieldBorderColor(item: self._items[r][c].slider), focusedBorderColor: self.upperTextFieldBorderColor(item: self._items[r][c].slider), borderWidth: 0.5, focusedBorderWidth: 2.0))
                })
                .informationViewStyle(self.getInfoStyle()).typeErased
            }
        }
        .padding([.leading, .trailing], 0)
    }
    
    func datetimePicker(row r: Int, column c: Int) -> some View {
        VStack {
            HStack {
                Text(self._items[r][c].datetime.name)
                    .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                Spacer()
            }
            .frame(width: UIDevice.current.userInterfaceIdiom != .phone ? self.popoverWidth - 13 * 2 : Screen.bounds.size.width - 16 * 2)

            HStack {
                Text(NSLocalizedString("Time", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                    .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                Spacer()
                DatePicker(
                    "",
                    selection: Binding<Date>(get: { self._items[r][c].datetime.workingValue ?? Date() }, set: { self._items[r][c].datetime.workingValue = $0 }),
                    displayedComponents: [.hourAndMinute]
                )
                .labelsHidden()
            }
            .frame(width: UIDevice.current.userInterfaceIdiom != .phone ? self.popoverWidth - 13 * 2 : Screen.bounds.size.width - 16 * 2)
            
            DatePicker(
                "",
                selection: Binding<Date>(get: { self._items[r][c].datetime.workingValue ?? Date() }, set: { self._items[r][c].datetime.workingValue = $0 }),
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .labelsHidden()
            .frame(width: UIDevice.current.userInterfaceIdiom != .phone ? self.popoverWidth - 13 : Screen.bounds.size.width - 16)
            .clipped()
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
                FilterFeedbackBarItem(icon: self.icon(name: self._items[r][c].picker.icon, isVisible: true), title: AttributedString(self._items[r][c].picker.label), isSelected: self._items[r][c].picker.isChecked)
            }
        }
    }
    
    private func stepper(row r: Int, column c: Int) -> some View {
        VStack {
            HStack {
                Text(self._items[r][c].stepper.name)
                    .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                Spacer()
            }
            .padding([.leading, .trailing], UIDevice.current.userInterfaceIdiom != .phone ? 0 : 16)
            
            StepperView(
                title: { Text(self._items[r][c].stepper.stepperTitle) },
                text: Binding<String>(get: {
                    if self._items[r][c].stepper.isDecimalSupported {
                        String(describing: self._items[r][c].stepper.workingValue)
                    } else {
                        String(describing: Int(self._items[r][c].stepper.workingValue))
                    }
                }, set: { self._items[r][c].stepper.workingValue = Double($0) ?? 0 }),
                step: self._items[r][c].stepper.step,
                stepRange: self._items[r][c].stepper.stepRange,
                isDecimalSupported: self._items[r][c].stepper.isDecimalSupported,
                icon: {
                    if let stepperIcon = self._items[r][c].stepper.stepperIcon {
                        Image(uiImage: stepperIcon)
                    } else {
                        EmptyView()
                    }
                },
                description: {
                    if let description = self._items[r][c].stepper.description {
                        Text(description)
                    } else {
                        EmptyView()
                    }
                }
            )
            .ifApply(!self._items[r][c].stepper.decrementActionActive) { v in
                v.decrementActionStyle(.deactivate)
            }
            .ifApply(!self._items[r][c].stepper.incrementActionActive) { v in
                v.incrementActionStyle(.deactivate)
            }
            .frame(minHeight: self.stepperViewHeight)
            .frame(width: UIDevice.current.userInterfaceIdiom != .phone ? self.popoverWidth : Screen.bounds.size.width)
            .padding(0)
            .sizeReader { s in
                self.stepperViewHeight = max(self.stepperViewHeight, s.height)
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
    
    private func getSafeAreaInsets() -> UIEdgeInsets {
        guard let keyWindow = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
        else {
            return .zero
        }
        return keyWindow.safeAreaInsets
    }
    
    private func lowerTextFieldBorderColor(item: SortFilterItem.SliderItem) -> Color? {
        let workingLowerValue = item.workingLowerValue ?? item.minimumValue
        let workingUpperValue = item.workingUpperValue ?? item.maximumValue
        if !(item.range ~= workingLowerValue) || workingLowerValue > workingUpperValue {
            return Color.preferredColor(.negativeLabel)
        }
        return nil
    }
    
    private func upperTextFieldBorderColor(item: SortFilterItem.SliderItem) -> Color? {
        let workingLowerValue = item.workingLowerValue ?? item.minimumValue
        let workingUpperValue = item.workingUpperValue ?? item.maximumValue
        if !(item.range ~= workingUpperValue) || workingLowerValue > workingUpperValue {
            return Color.preferredColor(.negativeLabel)
        }
        return nil
    }
    
    private func getInfoStyle() -> any InformationViewStyle {
        switch self.sliderDescType {
        case .error:
            return InformationViewErrorStyle.error
        case .fiori:
            return InformationViewFioriStyle.fiori
        case .informational:
            return InformationViewInformationalStyle.informational
        case .success:
            return InformationViewSuccessStyle.success
        case .warning:
            return InformationViewWarningStyle.warning
        }
    }
}

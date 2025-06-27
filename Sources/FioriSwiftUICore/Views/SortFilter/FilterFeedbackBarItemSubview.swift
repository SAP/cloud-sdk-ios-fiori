import SwiftUI

struct FilterFeedbackMenuItem: View {
    @Binding var item: SortFilterItem.PickerItem
    var onUpdate: () -> Void
    
    public init(item: Binding<SortFilterItem.PickerItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }

    var body: some View {
        Group {
            ForEach(self.$item.valueOptions.wrappedValue, id: \.self) { opt in
                FilterFeedbackBarItem(icon: self.item.isOptionSelected(opt) ? icon(name: self.item.icon, isVisible: true) : nil, title: AttributedString(opt), isSelected: self.item.isOptionSelected(opt))
                    .onTapGesture {
                        self.item.onTap(option: opt)
                        self.item.apply()
                        self.onUpdate()
                    }
            }
        }
    }
}

struct SliderMenuItem: View {
    @Binding var item: SortFilterItem.SliderItem

    @State var isSheetVisible = false

    @State var detentHeight: CGFloat = 0
    @State var barItemFrame: CGRect = .zero
    let popoverWidth = 393.0
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @State private var geometrySizeHeight: CGFloat = 0
    @State private var onErrorMessage = ""
    @State private var sliderDescType: SliderValueChangeHandler.SliderInformationType = .fiori
    
    var onUpdate: () -> Void

    public init(item: Binding<SortFilterItem.SliderItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.label), accessoryIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .popover(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection()) {
                CancellableResettableDialogNavigationForm {
                    SortFilterItemTitle(title: self.item.name)
                } cancelAction: {
                    _Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.cancel()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    _Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.reset()
                    })
                    .buttonStyle(ResetButtonStyle())
                    .disabled(self.item.isOriginal)
                } applyAction: {
                    _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.apply()
                        self.onUpdate()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())
                    .environment(\.isEnabled, self.onErrorMessage == "")
                } components: {
                    self.sliderView()
                        .padding([.leading, .trailing], 8)
                        .background(GeometryReader { geometry in
                            Color.clear
                                .onAppear {
                                    self.geometrySizeHeight = geometry.size.height
                                    self.calculateDetentHeight()
                                }
                                .onChange(of: geometry.size) {
                                    self.geometrySizeHeight = geometry.size.height
                                    self.calculateDetentHeight()
                                }
                        })
                        .onChange(of: self.dynamicTypeSize) {
                            self.calculateDetentHeight()
                        }
                }
                .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                    v.frame(width: self.popoverWidth)
                })
                .frame(idealHeight: self.detentHeight)
                .presentationDetents([.height(self.detentHeight)])
            }
            .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                v.background(GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.barItemFrame = geometry.frame(in: .global)
                        }
                        .setOnChange(of: geometry.frame(in: .global), action1: { newValue in
                            self.barItemFrame = newValue
                        }) { _, newValue in
                            self.barItemFrame = newValue
                        }
                })
            })
    }
    
    private func sliderView() -> some View {
        let titleView: any View = self.item.formatter != nil ? Text(self.item.formatter ?? "") : EmptyView()
        if self.item.sliderMode == .single {
            return FioriSlider(
                titleView: { titleView },
                value: Binding<Double>(get: { self.item.workingValue ?? self.item.minimumValue }, set: { self.item.workingValue = $0 }),
                range: self.item.range,
                step: self.item.step,
                decimalPlaces: self.item.decimalPlaces,
                description: self.item.hint.attributedString,
                showsValueLabel: true
            ).typeErased
        } else {
            return FioriSlider(
                titleView: { titleView },
                lowerValue: Binding<Double>(get: { self.item.workingLowerValue ?? self.item.minimumValue }, set: { self.item.workingLowerValue = $0 }),
                upperValue: Binding<Double>(get: { self.item.workingUpperValue ?? self.item.maximumValue }, set: { self.item.workingUpperValue = $0 }),
                range: self.item.range,
                step: self.item.step,
                decimalPlaces: self.item.decimalPlaces,
                description: self.onErrorMessage == "" ? self.item.hint.attributedString : self.onErrorMessage.attributedString,
                onRangeValueChange: { isEditing, lowerValue, upperValue in
                    if !isEditing {
                        guard let onValueChange = self.item.onValueChange else {
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
                v.leadingAccessoryStyle(textFieldStyle: FioriSliderTextFieldStyle(borderColor: self.lowerTextFieldBorderColor(), focusedBorderColor: self.lowerTextFieldBorderColor(), borderWidth: 0.5, focusedBorderWidth: 2.0))
                    .trailingAccessoryStyle(textFieldStyle: FioriSliderTextFieldStyle(borderColor: self.upperTextFieldBorderColor(), focusedBorderColor: self.upperTextFieldBorderColor(), borderWidth: 0.5, focusedBorderWidth: 2.0))
            })
            .informationViewStyle(self.getInfoStyle()).typeErased
        }
    }

    private func lowerTextFieldBorderColor() -> Color? {
        let workingLowerValue = self.item.workingLowerValue ?? self.item.minimumValue
        let workingUpperValue = self.item.workingUpperValue ?? self.item.maximumValue
        if !(self.item.range ~= workingLowerValue) || workingLowerValue > workingUpperValue {
            return Color.preferredColor(.negativeLabel)
        }
        return nil
    }
    
    private func upperTextFieldBorderColor() -> Color? {
        let workingLowerValue = self.item.workingLowerValue ?? self.item.minimumValue
        let workingUpperValue = self.item.workingUpperValue ?? self.item.maximumValue
        if !(self.item.range ~= workingUpperValue) || workingLowerValue > workingUpperValue {
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
    
    private func calculateDetentHeight() {
        let isNotIphone = UIDevice.current.userInterfaceIdiom != .phone
        var calculateHeight = self.geometrySizeHeight
        calculateHeight += isNotIphone ? 13 : 16
        calculateHeight += isNotIphone ? 50 : 56
        if !isNotIphone {
            calculateHeight += UIEdgeInsets.getSafeAreaInsets().bottom
        }
        #if !os(visionOS)
            calculateHeight += UIDevice.current.userInterfaceIdiom != .phone ? 45 : 0
        #else
            calculateHeight += 85
        #endif
        calculateHeight += self.dynamicTypeAddHeight()
        self.detentHeight = calculateHeight
    }
    
    private func dynamicTypeAddHeight() -> CGFloat {
        switch self.dynamicTypeSize {
        case .xLarge:
            return 15
        case .xxLarge:
            return 20
        case .xxxLarge:
            return 25
        case .accessibility1:
            return 30
        case .accessibility2:
            return 35
        case .accessibility3:
            return 40
        case .accessibility4:
            return 45
        case .accessibility5:
            return 55
        default:
            return 0
        }
    }
}

private extension Binding where Value == Set<UUID> {
    func asOptionalSelection() -> Binding<UUID?> {
        Binding<UUID?>(
            get: { self.wrappedValue.first },
            set: { newValue in
                self.wrappedValue = newValue.map { Set([$0]) } ?? []
            }
        )
    }
    
    func asRequiredSelection(defaultValue: UUID) -> Binding<UUID> {
        Binding<UUID>(
            get: { self.wrappedValue.first ?? defaultValue },
            set: { newValue in
                self.wrappedValue = Set([newValue])
            }
        )
    }
}

private extension Binding {
    func toOptionalBinding() -> Binding<Value?> {
        Binding<Value?>(
            get: { self.wrappedValue },
            set: { newValue in
                if let newValue {
                    self.wrappedValue = newValue
                }
            }
        )
    }
}

struct PickerMenuItem: View {
    @Binding var item: SortFilterItem.PickerItem
    var onUpdate: () -> Void
    
    @State var isSheetVisible = false

    @State var detentHeight: CGFloat = ((UIDevice.current.userInterfaceIdiom == .phone || UIDevice.current.userInterfaceIdiom == .pad) ? 88 : 0)
    let popoverWidth = 393.0
    @State var _keyboardHeight = 0.0
    @State var barItemFrame: CGRect = .zero
        
    public init(item: Binding<SortFilterItem.PickerItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        switch self.item.displayMode {
        case .automatic:
            if self.item.valueOptions.count > 8 {
                self.list
            } else if self.item.valueOptions.count > 4, self.item.valueOptions.count <= 8 {
                self.button
            } else {
                self.menu
            }
        case .filterFormCell:
            self.button
        case .menu:
            self.menu
        case .list:
            self.list
        }
    }
    
    private func displayModeIsList() -> Bool {
        switch self.item.displayMode {
        case .automatic:
            if self.item.valueOptions.count > 8 {
                return true
            } else {
                return false
            }
        case .list:
            return true
        default:
            return false
        }
    }

    @ViewBuilder
    var button: some View {
        FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.label), accessoryIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .popover(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection()) {
                CancellableResettableDialogNavigationForm {
                    SortFilterItemTitle(title: self.item.name)
                } cancelAction: {
                    _Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.cancel()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    if self.item.resetButtonConfiguration.isHidden {
                        EmptyView()
                    } else {
                        _Action(actionText: self.item.resetButtonConfiguration.title, didSelectAction: {
                            if self.item.resetButtonConfiguration.type == .reset {
                                self.item.reset()
                            } else {
                                self.item.clearAll()
                            }
                        })
                        .buttonStyle(ResetButtonStyle())
                        .disabled(self.resetButtonDisable())
                    }
                } applyAction: {
                    _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.apply()
                        self.onUpdate()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())
                } components: {
                    ScrollView(.vertical) {
                        FilterFormView(title: {
                            if let title = self.item.title, !title.isEmpty {
                                Text(title)
                                    .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                                    .foregroundStyle(Color.preferredColor(.primaryLabel))
                            } else {
                                EmptyView()
                            }
                        }, options: self.item.valueOptions.map { AttributedString($0) }, isEnabled: true, allowsMultipleSelection: self.item.allowsMultipleSelection, allowsEmptySelection: self.item.allowsEmptySelection, value: self.$item.workingValue, buttonSize: self.item.itemLayout == .flexible ? .flexible : .fixed, isSingleLine: false) { _ in
                        }
                        .filterFormOptionsLineSpacing(10)
                        .background(
                            GeometryReader { geometry in
                                Color.clear
                                    .onAppear {
                                        self.detentHeight = self.calculateDetentHeight(scrollViewContentHeight: geometry.size.height)
                                    }
                                    .onChange(of: geometry.frame(in: .global).height) {
                                        self.detentHeight = self.calculateDetentHeight(scrollViewContentHeight: geometry.size.height)
                                    }
                            }
                        )
                        .padding([.leading, .trailing], 16)
                        .padding(.bottom, 10)
                    }
                }
                .frame(height: self.detentHeight)
                .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                    v.frame(width: self.popoverWidth)
                })
                .presentationDetents([.height(self.detentHeight)])
            }
            .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                v.background(GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.barItemFrame = geometry.frame(in: .global)
                        }
                        .setOnChange(of: geometry.frame(in: .global), action1: { newValue in
                            self.barItemFrame = newValue
                        }) { _, newValue in
                            self.barItemFrame = newValue
                        }
                })
            })
    }
    
    @ViewBuilder
    var menu: some View {
        HStack {
            Menu {
                ForEach(self.item.valueOptions.indices, id: \.self) { idx in
                    if self.item.isOptionSelected(index: idx) {
                        Button {
                            self.item.optionOnTap(idx)
                            self.item.apply()
                            self.onUpdate()
                        } label: {
                            Label { Text(self.item.valueOptions[idx]) } icon: { Image(fioriName: "fiori.accept") }
                        }
                    } else {
                        Button(self.item.valueOptions[idx]) {
                            self.item.optionOnTap(idx)
                            self.item.apply()
                            self.onUpdate()
                        }
                    }
                }
            } label: {
                FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.label), isSelected: self.item.isChecked)
            }
        }
    }
    
    @ViewBuilder @MainActor
    var list: some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.phoneView()
        } else {
            self.padView()
        }
    }
    
    @MainActor private func phoneView() -> some View {
        FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.label), accessoryIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .popover(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection()) {
                CancellableResettableDialogNavigationForm {
                    SortFilterItemTitle(title: self.item.name)
                } cancelAction: {
                    _Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.cancel()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    if self.item.resetButtonConfiguration.isHidden {
                        EmptyView()
                    } else {
                        _Action(actionText: self.item.resetButtonConfiguration.title, didSelectAction: {
                            if self.item.resetButtonConfiguration.type == .reset {
                                self.item.reset()
                            } else {
                                self.item.clearAll()
                            }
                        })
                        .buttonStyle(ResetButtonStyle())
                        .disabled(self.resetButtonDisable())
                    }
                } applyAction: {
                    _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.apply()
                        self.onUpdate()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())
                } components: {
                    self.configListPickerDestination()
                }
                .presentationDetents([.height(self.detentHeight), .medium, .large])
            }
    }
    
    @MainActor private func padView() -> some View {
        FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.label), accessoryIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .contentShape(Rectangle())
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .modifier(PopoverSizeModifier(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection(), popoverSize: CGSize(width: self.popoverWidth, height: self.detentHeight), popoverContent: {
                CancellableResettableDialogNavigationForm {
                    SortFilterItemTitle(title: self.item.name)
                } cancelAction: {
                    _Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.cancel()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    if self.item.resetButtonConfiguration.isHidden {
                        EmptyView()
                    } else {
                        _Action(actionText: self.item.resetButtonConfiguration.title, didSelectAction: {
                            if self.item.resetButtonConfiguration.type == .reset {
                                self.item.reset()
                            } else {
                                self.item.clearAll()
                            }
                        })
                        .buttonStyle(ResetButtonStyle())
                        .disabled(self.resetButtonDisable())
                    }
                } applyAction: {
                    _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.apply()
                        self.onUpdate()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())
                } components: {
                    self.configListPickerDestination()
                }
            }))
            .background(GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        self.barItemFrame = geometry.frame(in: .global)
                    }
                    .setOnChange(of: geometry.frame(in: .global), action1: { newValue in
                        self.barItemFrame = newValue
                    }) { _, newValue in
                        self.barItemFrame = newValue
                    }
            })
    }
    
    private func resetButtonDisable() -> Bool {
        if self.item.resetButtonConfiguration.type == .reset {
            return self.item.isOriginal
        } else {
            return self.item.workingValue.isEmpty
        }
    }
    
    private func calculateDetentHeight(scrollViewContentHeight: CGFloat) -> CGFloat {
        let screenHeight = Screen.bounds.size.height
        let safeAreaInset = UIEdgeInsets.getSafeAreaInsets()
        var maxPopoverViewHeight = 0.0
        var calaulatePopoverViewHeight = scrollViewContentHeight
        if UIDevice.current.userInterfaceIdiom != .phone {
            if self.barItemFrame.arrowDirection() == .top {
                maxPopoverViewHeight = screenHeight - self.barItemFrame.maxY - safeAreaInset.bottom - 30
                maxPopoverViewHeight -= self._keyboardHeight
            } else if self.barItemFrame.arrowDirection() == .bottom {
                maxPopoverViewHeight = screenHeight - (screenHeight - self.barItemFrame.minY) + safeAreaInset.top
                if self._keyboardHeight > 0 {
                    let keyboardItemHeight = (self._keyboardHeight - (screenHeight - self.barItemFrame.minY))
                    if keyboardItemHeight > 0 {
                        maxPopoverViewHeight -= keyboardItemHeight
                    }
                }
            }
            calaulatePopoverViewHeight += 50 + (self.displayModeIsList() ? 70 : 24) + (self.item.isSearchBarHidden ? 0 : 52)
        } else {
            maxPopoverViewHeight = screenHeight - safeAreaInset.top - 30
            maxPopoverViewHeight -= self._keyboardHeight
            if self.displayModeIsList() {
                calaulatePopoverViewHeight += 56 + 20 + safeAreaInset.bottom + (self.item.isSearchBarHidden ? 0 : 52)
                if calaulatePopoverViewHeight > screenHeight - safeAreaInset.top - 60 {
                    return screenHeight / 2
                }
            } else {
                calaulatePopoverViewHeight += 56 + 20 + safeAreaInset.bottom + 20
            }
        }

        return min(maxPopoverViewHeight, calaulatePopoverViewHeight)
    }
    
    @MainActor private func configListPickerDestination() -> some View {
        let filter: ((SortFilterItem.PickerItem.ValueOptionModel, String) -> Bool) = { f, s in
            if !s.isEmpty {
                return f.value.localizedCaseInsensitiveContains(s)
            } else {
                return true
            }
        }

        let defaultSingleSelection = self.item.workingValueSet.first ?? self.item.uuidValueOptions.first?.id ?? UUID()
        var selectionBinding: Binding<UUID?> {
            self.item.allowsEmptySelection ?
                self.$item.workingValueSet.asOptionalSelection() :
                self.$item.workingValueSet.asRequiredSelection(defaultValue: defaultSingleSelection).toOptionalBinding()
        }
        
        let listPickerDestination = self.item.allowsMultipleSelection ?
            ListPickerDestination(
                self.item.uuidValueOptions,
                id: \.id,
                selections: self.$item.workingValueSet,
                allowEmpty: self.item.allowsEmptySelection,
                isTrackingLiveChanges: true,
                searchFilter: self.item.isSearchBarHidden == false ? filter : nil
            ) { e in
                Text(e.value)
                    .destinationRowBackgroundColor(.clear)
            } :
            ListPickerDestination(
                self.item.uuidValueOptions,
                id: \.id,
                selection: selectionBinding,
                isTrackingLiveChanges: true,
                searchFilter: self.item.isSearchBarHidden == false ? filter : nil
            ) { e in
                Text(e.value)
                    .destinationRowBackgroundColor(.clear)
            }
        return listPickerDestination
            .disableEntriesSection(self.item.disableListEntriesSection)
            .listStyle(.plain)
            .frame(minWidth: UIDevice.current.userInterfaceIdiom != .phone ? self.popoverWidth : nil)
            .scrollContentBackground(.hidden)
            .environment(\.defaultMinListRowHeight, 0)
            .environment(\.defaultMinListHeaderHeight, 0)
            .isFilterFeedbackBarListPickerStyle(true)
            .onChange(of: self.item.workingValueSet) {
                self.item.workingValue = self.item.workingValueSet.flatMap { selectedId in
                    self.item.uuidValueOptions.filter { $0.id == selectedId }.map(\.index)
                }
            }
            .modifier(FioriIntrospectModifier<UIScrollView> { scrollView in
                DispatchQueue.main.async {
                    let calculateHeight = max(calculateDetentHeight(scrollViewContentHeight: scrollView.contentSize.height), 88)
                    if self.detentHeight != calculateHeight {
                        self.detentHeight = calculateHeight
                    }
                }
            })
            .selectedEntriesSectionTitleStyle { _ in
                if self.item.allowsDisplaySelectionCount {
                    Text(NSLocalizedString("Selected", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "") + " " + "(\(self.item.workingValue.count))")
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                        .font(.fiori(forTextStyle: .subheadline, weight: .regular))
                } else {
                    Text(NSLocalizedString("Selected", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                        .font(.fiori(forTextStyle: .subheadline, weight: .regular))
                }
            }
            .allEntriesSectionTitleStyle { _ in
                Text(NSLocalizedString("All", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                    .foregroundStyle(Color.preferredColor(.secondaryLabel))
                    .font(.fiori(forTextStyle: .subheadline, weight: .regular))
            }
            .ifApply(!self.item.isSearchBarHidden, content: { v in
                v.onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidShowNotification)) { notif in
                    let rect = (notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) ?? .zero
                    self._keyboardHeight = rect.height
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidHideNotification)) { _ in
                    self._keyboardHeight = 0
                }
            })
    }
}

private extension View {
    func readHeight() -> some View {
        self.modifier(ReadHeightModifier())
    }
}

private struct ReadHeightModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: HeightPreferenceKey.self, value: geometry.size.height)
        }
    }

    func body(content: Content) -> some View {
        content.background(self.sizeView)
    }
}

struct DateTimeMenuItem: View {
    @Binding private var item: SortFilterItem.DateTimeItem
    
    @State private var isSheetVisible: Bool = false

    @State var detentHeight: CGFloat = 0
    @State var barItemFrame: CGRect = .zero
    
    var onUpdate: () -> Void
    
    #if !os(visionOS)
        let popoverWidth = 393.0
    #else
        let popoverWidth = 480.0
    #endif
    
    public init(item: Binding<SortFilterItem.DateTimeItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
        
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.phoneView()
        } else {
            self.padView()
        }
    }
    
    private func datePickerView() -> some View {
        VStack {
            HStack {
                Text(NSLocalizedString("Time", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                    .font(.fiori(forTextStyle: .headline, weight: .bold, isItalic: false, isCondensed: false))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                Spacer()
                DatePicker(
                    "",
                    selection: Binding<Date>(get: { self.item.workingValue ?? Date() }, set: { self.item.workingValue = $0 }),
                    displayedComponents: [.hourAndMinute]
                )
                .labelsHidden()
            }
            .padding([.leading, .trailing], 16)
            .frame(minHeight: 40)

            DatePicker(
                self.item.label,
                selection: Binding<Date>(get: { self.item.workingValue ?? Date() }, set: { self.item.workingValue = $0 }),
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .labelsHidden()
            .frame(minHeight: 320)
            .clipped()
        }
        .frame(width: UIDevice.current.userInterfaceIdiom != .phone ? self.popoverWidth : Screen.bounds.size.width)
        .frame(minHeight: 440)
        .background(GeometryReader { geometry in
            Color.clear
                .onAppear {
                    let isNotIphone = UIDevice.current.userInterfaceIdiom != .phone
                    var calculateHeight = geometry.size.height
                    calculateHeight += isNotIphone ? 13 : 16
                    calculateHeight += isNotIphone ? 50 : 56
                    if !isNotIphone {
                        calculateHeight += UIEdgeInsets.getSafeAreaInsets().bottom
                    }
                    calculateHeight += UIDevice.current.userInterfaceIdiom != .phone ? 55 : 0
                    self.detentHeight = calculateHeight
                }
        })
    }
    
    private func phoneView() -> some View {
        FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.label), accessoryIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .popover(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection()) {
                CancellableResettableDialogNavigationForm {
                    SortFilterItemTitle(title: self.item.name)
                } cancelAction: {
                    _Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.cancel()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    _Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.reset()
                    })
                    .buttonStyle(ResetButtonStyle())
                    .disabled(self.item.isOriginal)
                } applyAction: {
                    _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.apply()
                        self.onUpdate()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())
                } components: {
                    self.datePickerView()
                        .presentationDetents([.height(self.detentHeight)])
                }
                .frame(idealHeight: self.detentHeight)
            }
            .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                v.background(GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.barItemFrame = geometry.frame(in: .global)
                        }
                        .setOnChange(of: geometry.frame(in: .global), action1: { newValue in
                            self.barItemFrame = newValue
                        }) { _, newValue in
                            self.barItemFrame = newValue
                        }
                })
            })
    }
    
    private func padView() -> some View {
        FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.label), accessoryIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .modifier(PopoverSizeModifier(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection(), popoverSize: CGSize(width: self.popoverWidth, height: self.detentHeight), popoverContent: {
                CancellableResettableDialogNavigationForm {
                    SortFilterItemTitle(title: self.item.name)
                } cancelAction: {
                    _Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.cancel()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    _Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.reset()
                    })
                    .buttonStyle(ResetButtonStyle())
                    .disabled(self.item.isOriginal)
                } applyAction: {
                    _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.apply()
                        self.onUpdate()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())
                } components: {
                    self.datePickerView()
                }
                .frame(width: self.popoverWidth)
                .frame(idealHeight: self.detentHeight)
            }))
            .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                v.background(GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.barItemFrame = geometry.frame(in: .global)
                        }
                        .setOnChange(of: geometry.frame(in: .global), action1: { newValue in
                            self.barItemFrame = newValue
                        }) { _, newValue in
                            self.barItemFrame = newValue
                        }
                })
            })
    }
}

struct SwitchMenuItem: View {
    @Binding private var item: SortFilterItem.SwitchItem
    
//    @State var detentHeight: CGFloat = 0
    
//    @State private var isSheetVisible: Bool = false
    var onUpdate: () -> Void

    public init(item: Binding<SortFilterItem.SwitchItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
        
    var body: some View {
        FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.name), isSelected: self.item.isChecked)
            .onTapGesture {
                if self.item.value != nil {
                    self.item.workingValue?.toggle()
                    self.item.apply()
                    self.onUpdate()
                } else {
                    self.item.workingValue = true
                    self.item.apply()
                    self.onUpdate()
                }
            }
    }
}

struct StepperMenuItem: View {
    @Binding var item: SortFilterItem.StepperItem

    @State var isSheetVisible = false

    @State var detentHeight: CGFloat = 0
    @State var barItemFrame: CGRect = .zero

    var onUpdate: () -> Void
    
    @State var stepperViewHeight: CGFloat = 110
    let popoverWidth = 393.0
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @State private var geometrySizeHeight: CGFloat = 0
    
    public init(item: Binding<SortFilterItem.StepperItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.label), accessoryIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .popover(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection()) {
                CancellableResettableDialogNavigationForm {
                    SortFilterItemTitle(title: self.item.name)
                } cancelAction: {
                    _Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.cancel()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    _Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.reset()
                    })
                    .buttonStyle(ResetButtonStyle())
                    .disabled(self.item.isOriginal)
                } applyAction: {
                    _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.apply()
                        self.onUpdate()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())

                } components: {
                    StepperView(
                        title: { Text(self.item.stepperTitle) },
                        text: Binding<String>(get: {
                            if self.item.isDecimalSupported {
                                String(describing: self.item.workingValue)
                            } else {
                                String(describing: Int(self.item.workingValue))
                            }
                        }, set: { self.item.workingValue = Double($0) ?? 0 }),
                        step: self.item.step,
                        stepRange: self.item.stepRange,
                        isDecimalSupported: self.item.isDecimalSupported,
                        icon: {
                            if let stepperIcon = self.item.stepperIcon {
                                Image(uiImage: stepperIcon)
                            } else {
                                EmptyView()
                            }
                        },
                        description: {
                            if let description = self.item.description {
                                Text(description)
                            } else {
                                EmptyView()
                            }
                        }
                    )
                    .ifApply(!self.item.decrementActionActive) { v in
                        v.decrementActionStyle(.deactivate)
                    }
                    .ifApply(!self.item.incrementActionActive) { v in
                        v.incrementActionStyle(.deactivate)
                    }
                    .frame(minHeight: self.stepperViewHeight)
                    .background(GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                self.geometrySizeHeight = geometry.size.height
                                self.calculateDetentHeight()
                            }
                            .onChange(of: geometry.size) {
                                self.geometrySizeHeight = geometry.size.height
                                self.calculateDetentHeight()
                            }
                    })
                    .onChange(of: self.dynamicTypeSize) {
                        self.stepperViewHeight = 110 + self.dynamicTypeAddHeight()
                        self.calculateDetentHeight()
                    }
                }
                .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                    v.frame(width: self.popoverWidth)
                })
                .frame(idealHeight: self.detentHeight)
                .presentationDetents([.height(self.detentHeight)])
            }
            .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                v.background(GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.barItemFrame = geometry.frame(in: .global)
                        }
                        .setOnChange(of: geometry.frame(in: .global), action1: { newValue in
                            self.barItemFrame = newValue
                        }) { _, newValue in
                            self.barItemFrame = newValue
                        }
                })
            })
    }
    
    private func calculateDetentHeight() {
        let isNotIphone = UIDevice.current.userInterfaceIdiom != .phone
        var calculateHeight = self.geometrySizeHeight
        calculateHeight += isNotIphone ? 13 : 16
        calculateHeight += isNotIphone ? 50 : 56
        if !isNotIphone {
            calculateHeight += UIEdgeInsets.getSafeAreaInsets().bottom
        }
        #if !os(visionOS)
            calculateHeight += UIDevice.current.userInterfaceIdiom != .phone ? 45 : 0
        #else
            calculateHeight += 85
        #endif
        calculateHeight += self.dynamicTypeAddHeight()
        self.detentHeight = calculateHeight
    }
    
    private func dynamicTypeAddHeight() -> CGFloat {
        switch self.dynamicTypeSize {
        case .xLarge:
            return 15
        case .xxLarge:
            return 20
        case .xxxLarge:
            return 25
        case .accessibility1:
            return 30
        case .accessibility2:
            return 35
        case .accessibility3:
            return 40
        case .accessibility4:
            return 45
        case .accessibility5:
            return 55
        default:
            return 0
        }
    }
}

struct TitleMenuItem: View {
    @Binding var item: SortFilterItem.TitleItem

    @State var isSheetVisible = false

    @State var detentHeight: CGFloat = 0
    @State var barItemFrame: CGRect = .zero

    var onUpdate: () -> Void
    
    let popoverWidth = 393.0
    
    public init(item: Binding<SortFilterItem.TitleItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.label), accessoryIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .popover(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection()) {
                CancellableResettableDialogNavigationForm {
                    SortFilterItemTitle(title: self.item.name)
                } cancelAction: {
                    _Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.cancel()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    _Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.reset()
                    })
                    .buttonStyle(ResetButtonStyle())
                    .disabled(self.item.isOriginal)
                } applyAction: {
                    _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: { [self] in
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        self.item.apply()
                        self.onUpdate()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())
                } components: {
                    TitleFormView(text: self.$item.workingText,
                                  isSecureEnabled: self.item.isSecureEnabled,
                                  placeholder: self.item.placeholder?.attributedString,
                                  controlState: self.item.controlState,
                                  errorMessage: self.item.errorMessage?.attributedString,
                                  maxTextLength: self.item.maxTextLength,
                                  hintText: self.item.hintText?.attributedString,
                                  hidesReadOnlyHint: self.item.hidesReadOnlyHint,
                                  isCharCountEnabled: self.item.isCharCountEnabled,
                                  allowsBeyondLimit: self.item.allowsBeyondLimit,
                                  charCountReachLimitMessage: self.item.charCountReachLimitMessage,
                                  charCountBeyondLimitMsg: self.item.charCountBeyondLimitMsg)
                        .padding([.leading, .trailing], 16)
                        .padding(.bottom, 8)
                        .background(GeometryReader { geometry in
                            Color.clear
                                .onAppear {
                                    let isNotIphone = UIDevice.current.userInterfaceIdiom != .phone
                                    var calculateHeight = geometry.size.height
                                    calculateHeight += isNotIphone ? 13 : 16
                                    calculateHeight += isNotIphone ? 50 : 56
                                    if !isNotIphone {
                                        calculateHeight += UIEdgeInsets.getSafeAreaInsets().bottom
                                    }
                                    calculateHeight += UIDevice.current.userInterfaceIdiom != .phone ? 55 : 0
                                    self.detentHeight = calculateHeight
                                }
                        })
                }
                .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                    v.frame(width: self.popoverWidth)
                })
                .frame(idealHeight: self.detentHeight)
                .presentationDetents([.height(self.detentHeight)])
            }
            .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                v.background(GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.barItemFrame = geometry.frame(in: .global)
                        }
                        .setOnChange(of: geometry.frame(in: .global), action1: { newValue in
                            self.barItemFrame = newValue
                        }) { _, newValue in
                            self.barItemFrame = newValue
                        }
                })
            })
    }
}

struct NoteMenuItem: View {
    @Binding var item: SortFilterItem.NoteItem

    @State var isSheetVisible = false

    @State var noteViewHeight: CGFloat = 74.0
    @State var detentHeight: CGFloat = 0
    @State var barItemFrame: CGRect = .zero
    @State var _keyboardHeight = 0.0

    var onUpdate: () -> Void
    
    let popoverWidth = 393.0
    
    public init(item: Binding<SortFilterItem.NoteItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.label), accessoryIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                v.modifier(PopoverSizeModifier(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection(), popoverSize: CGSize(width: self.popoverWidth, height: self.detentHeight), popoverContent: {
                    self.popoverContent
                        .frame(width: self.popoverWidth)
                        .frame(idealHeight: self.detentHeight)
                        .presentationDetents([.height(self.detentHeight)])
                }))
                .background(GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.barItemFrame = geometry.frame(in: .global)
                        }
                        .setOnChange(of: geometry.frame(in: .global), action1: { newValue in
                            self.barItemFrame = newValue
                        }) { _, newValue in
                            self.barItemFrame = newValue
                        }
                })
            })
            .ifApply(UIDevice.current.userInterfaceIdiom == .phone, content: { v in
                v.popover(isPresented: self.$isSheetVisible) {
                    self.popoverContent
                        .frame(minHeight: self.detentHeight)
                        .presentationDetents([.height(self.detentHeight)])
                }
            })
    }
    
    @ViewBuilder
    var popoverContent: some View {
        CancellableResettableDialogNavigationForm {
            SortFilterItemTitle(title: self.item.name)
        } cancelAction: {
            _Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                self.item.cancel()
                self.isSheetVisible.toggle()
            })
            .buttonStyle(CancelButtonStyle())
        } resetAction: {
            _Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                self.item.reset()
            })
            .buttonStyle(ResetButtonStyle())
            .disabled(self.item.isOriginal)
        } applyAction: {
            _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: { [self] in
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                self.item.apply()
                self.onUpdate()
                self.isSheetVisible.toggle()
            })
            .buttonStyle(ApplyButtonStyle())
        } components: {
            ScrollView(.vertical) {
                NoteFormView(text: self.$item.workingText,
                             placeholder: self.item.placeholder?.attributedString,
                             controlState: self.item.controlState,
                             errorMessage: self.item.errorMessage?.attributedString,
                             minTextEditorHeight: self.item.minTextEditorHeight,
                             maxTextEditorHeight: self.item.maxTextEditorHeight,
                             maxTextLength: self.item.maxTextLength,
                             hintText: self.item.hintText?.attributedString,
                             hidesReadOnlyHint: self.item.hidesReadOnlyHint,
                             isCharCountEnabled: self.item.isCharCountEnabled,
                             allowsBeyondLimit: self.item.allowsBeyondLimit,
                             charCountReachLimitMessage: self.item.charCountReachLimitMessage,
                             charCountBeyondLimitMsg: self.item.charCountBeyondLimitMsg)
                    .background(GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                self.detentHeight = self.calculateDetentHeight(geometryHeight: geometry.size.height)
                            }
                            .onChange(of: geometry.size.height) {
                                withAnimation {
                                    self.detentHeight = self.calculateDetentHeight(geometryHeight: geometry.size.height)
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                    })
                    .padding([.leading, .trailing], 16)
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidShowNotification)) { notif in
                        let rect = (notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) ?? .zero
                        self._keyboardHeight = rect.height
                        self.detentHeight = self.calculateDetentHeight(geometryHeight: self.noteViewHeight)
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidHideNotification)) { _ in
                        self._keyboardHeight = 0
                        self.detentHeight = self.calculateDetentHeight(geometryHeight: self.noteViewHeight)
                    }
            }
        }
    }
    
    private func calculateDetentHeight(geometryHeight: CGFloat) -> CGFloat {
        self.noteViewHeight = geometryHeight
        let screenHeight = Screen.bounds.size.height
        let safeAreaInset = UIEdgeInsets.getSafeAreaInsets()
        var maxPopoverViewHeight = 0.0
        var calaulatePopoverViewHeight = geometryHeight
        if UIDevice.current.userInterfaceIdiom != .phone {
            if self.barItemFrame.arrowDirection() == .top {
                maxPopoverViewHeight = screenHeight - self.barItemFrame.maxY - safeAreaInset.bottom - 30
                maxPopoverViewHeight -= self._keyboardHeight
            } else if self.barItemFrame.arrowDirection() == .bottom {
                maxPopoverViewHeight = screenHeight - (screenHeight - self.barItemFrame.minY) + safeAreaInset.top
                if self._keyboardHeight > 0 {
                    let keyboardItemHeight = (self._keyboardHeight - (screenHeight - self.barItemFrame.minY))
                    if keyboardItemHeight > 0 {
                        maxPopoverViewHeight -= keyboardItemHeight
                    }
                }
            }
            calaulatePopoverViewHeight += 50 + 70
            return min(maxPopoverViewHeight, calaulatePopoverViewHeight)
        } else {
            maxPopoverViewHeight = screenHeight - safeAreaInset.top - 30
            maxPopoverViewHeight -= self._keyboardHeight
            if self._keyboardHeight == 0 {
                calaulatePopoverViewHeight += 56 + 20 + safeAreaInset.bottom
            } else {
                calaulatePopoverViewHeight += 56 + 20
            }
            return min(calaulatePopoverViewHeight, maxPopoverViewHeight)
        }
    }
}

struct DurationPickerMenuItem: View {
    @Binding var item: SortFilterItem.DurationPickerItem

    @State var isSheetVisible = false

    @State var detentHeight: CGFloat = 0
    @State var barItemFrame: CGRect = .zero

    var onUpdate: () -> Void
    
    let popoverWidth = 393.0
    
    public init(item: Binding<SortFilterItem.DurationPickerItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.label), accessoryIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .popover(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection()) {
                CancellableResettableDialogNavigationForm {
                    SortFilterItemTitle(title: self.item.name)
                } cancelAction: {
                    _Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.cancel()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    _Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.reset()
                    })
                    .buttonStyle(ResetButtonStyle())
                    .disabled(self.item.isOriginal)
                } applyAction: {
                    _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: { [self] in
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        self.item.apply()
                        self.onUpdate()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())
                } components: {
                    DurationPickerViewWrapper(selection: self.$item.workingValue, maximumMinutes: self.item.maximumMinutes, minimumMinutes: self.item.minimumMinutes, minuteInterval: self.item.minuteInterval, measurementFormatter: self.item.measurementFormatter)
                        .frame(height: 204)
                        .foregroundColor(Color.preferredColor(.primaryLabel))
                        .padding([.leading, .trailing], 16)
                        .padding(.bottom, 8)
                        .background(GeometryReader { geometry in
                            Color.clear
                                .onAppear {
                                    let isNotIphone = UIDevice.current.userInterfaceIdiom != .phone
                                    var calculateHeight = geometry.size.height
                                    calculateHeight += isNotIphone ? 13 : 16
                                    calculateHeight += isNotIphone ? 50 : 56
                                    if !isNotIphone {
                                        calculateHeight += UIEdgeInsets.getSafeAreaInsets().bottom
                                    }
                                    calculateHeight += UIDevice.current.userInterfaceIdiom != .phone ? 55 : 0
                                    self.detentHeight = calculateHeight
                                }
                        })
                        .onAppear {
                            self.item.workingValue = self.item.value
                        }
                }
                .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                    v.frame(width: self.popoverWidth)
                })
                .frame(idealHeight: self.detentHeight)
                .presentationDetents([.height(self.detentHeight)])
            }
            .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                v.background(GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.barItemFrame = geometry.frame(in: .global)
                        }
                        .setOnChange(of: geometry.frame(in: .global), action1: { newValue in
                            self.barItemFrame = newValue
                        }) { _, newValue in
                            self.barItemFrame = newValue
                        }
                })
            })
    }
}

struct OrderPickerMenuItem: View {
    @Binding var item: SortFilterItem.OrderPickerItem

    @State var isSheetVisible = false

    @State var detentHeight: CGFloat = 0
    @State var barItemFrame: CGRect = .zero

    var onUpdate: () -> Void
    
    let popoverWidth = 393.0
    
    public init(item: Binding<SortFilterItem.OrderPickerItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        FilterFeedbackBarItem(icon: icon(name: self.item.icon, isVisible: true), title: AttributedString(self.item.label), accessoryIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .popover(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection()) {
                CancellableResettableDialogNavigationForm {
                    SortFilterItemTitle(title: self.item.name)
                } cancelAction: {
                    _Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.cancel()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    _Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        self.item.reset()
                    })
                    .buttonStyle(ResetButtonStyle())
                    .disabled(self.item.isOriginal)
                } applyAction: {
                    _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: { [self] in
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        self.item.apply()
                        self.onUpdate()
                        self.isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())
                } components: {
                    OrderPicker(
                        optionalTitle: self.item.title,
                        data: self.$item.workingValue,
                        isAtLeastOneSelected: self.item.isAtLeastOneSelected,
                        onChangeHandler: { _, newModel in
                            self.item.workingValue = newModel
                        },
                        controlState: self.item.controlState
                    )
                    .padding(.bottom, 8)
                    .modifier(FioriIntrospectModifier<UIScrollView> { scrollView in
                        DispatchQueue.main.async {
                            let calculateHeight = self.calculateDetentHeight(scrollViewContentHeight: scrollView.contentSize.height)
                            if self.detentHeight != calculateHeight {
                                self.detentHeight = calculateHeight
                            }
                        }
                    })
                    .onAppear {
                        self.item.workingValue = self.item.value
                    }
                }
                .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                    v.frame(width: self.popoverWidth)
                })
                .frame(idealHeight: self.detentHeight)
                .presentationDetents([.height(self.detentHeight)])
            }
            .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                v.background(GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.barItemFrame = geometry.frame(in: .global)
                        }
                        .setOnChange(of: geometry.frame(in: .global), action1: { newValue in
                            self.barItemFrame = newValue
                        }) { _, newValue in
                            self.barItemFrame = newValue
                        }
                })
            })
    }
    
    private func calculateDetentHeight(scrollViewContentHeight: CGFloat) -> CGFloat {
        let screenHeight = Screen.bounds.size.height
        let safeAreaInset = UIEdgeInsets.getSafeAreaInsets()
        var maxPopoverViewHeight = 0.0
        var calaulatePopoverViewHeight = scrollViewContentHeight
        if UIDevice.current.userInterfaceIdiom != .phone {
            if self.barItemFrame.arrowDirection() == .top {
                maxPopoverViewHeight = screenHeight - self.barItemFrame.maxY - safeAreaInset.bottom - 30
            } else if self.barItemFrame.arrowDirection() == .bottom {
                maxPopoverViewHeight = screenHeight - (screenHeight - self.barItemFrame.minY) + safeAreaInset.top
            }
            calaulatePopoverViewHeight += 50 + 70
        } else {
            maxPopoverViewHeight = screenHeight - safeAreaInset.top - 30
            calaulatePopoverViewHeight += 56 + 20 + safeAreaInset.bottom
            if calaulatePopoverViewHeight > screenHeight - safeAreaInset.top - 60 {
                return screenHeight / 2
            }
        }

        return min(maxPopoverViewHeight, calaulatePopoverViewHeight)
    }
}

struct FullCFGMenuItem: View {
    @Environment(\.filterFeedbackBarFullConfigurationItem) var fullCFGButton
    
    @Binding var items: [[SortFilterItem]]

    @State var isSheetVisible = false
    @State var barItemFrame: CGRect = .zero
    @State var detentHeight: CGFloat = 0
    let popoverWidth = 393.0

    var onUpdate: () -> Void
    
    var resetButtonType = FilterFeedbackBarResetButtonType.reset

    public init(items: Binding<[[SortFilterItem]]>, onUpdate: @escaping () -> Void) {
        self._items = items
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        FilterFeedbackBarItem(icon: icon(name: self.fullCFGButton.icon, isVisible: true), title: self.fullCFGButton.name.attributedString ?? "", isSelected: true)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                v.modifier(PopoverSizeModifier(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection(), popoverSize: CGSize(width: self.popoverWidth, height: self.detentHeight), popoverContent: {
                    self.sortConfigurationView()
                }))
                .background(GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.barItemFrame = geometry.frame(in: .global)
                        }
                        .setOnChange(of: geometry.frame(in: .global), action1: { newValue in
                            self.barItemFrame = newValue
                        }) { _, newValue in
                            self.barItemFrame = newValue
                        }
                })
            })
            .ifApply(UIDevice.current.userInterfaceIdiom == .phone) { v in
                v.popover(isPresented: self.$isSheetVisible) {
                    self.sortConfigurationView()
                }
            }
    }
    
    private func sortConfigurationView() -> some View {
        SortFilterView(
            title: {
                if let title = fullCFGButton.name {
                    Text(title)
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                        .font(.fiori(forTextStyle: .subheadline, weight: .black))
                        .multilineTextAlignment(.center)
                } else {
                    EmptyView()
                }
            },
            items: self.$items,
            onUpdate: {
                for r in 0 ..< self.items.count {
                    for c in 0 ..< self.items[r].count {
                        self.items[r][c].apply()
                    }
                }
                self.onUpdate()
                self.isSheetVisible = false
            },
            onCancel: {
                self.isSheetVisible = false
            },
            onReset: {
                for r in 0 ..< self.items.count {
                    for c in 0 ..< self.items[r].count {
                        self.items[r][c].reset()
                    }
                }
            }
        )
        .environment(\.sortFilterBarItemFrame, self.barItemFrame)
        .sizeReader(size: { s in
            self.detentHeight = s.height
        })
        .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
            v.frame(width: self.popoverWidth)
                .frame(minHeight: self.detentHeight)
        })
    }
}

private extension View {
    func icon(name: String?, isVisible: Bool) -> Image? {
        if isVisible {
            if let name {
                return Image(systemName: name)
            }
        }
        return nil
    }
}

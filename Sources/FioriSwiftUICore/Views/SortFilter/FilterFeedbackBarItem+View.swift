import SwiftUI

extension Fiori {
    enum FilterFeedbackBarItem {
        typealias LeftIcon = EmptyModifier
        typealias LeftIconCumulative = EmptyModifier
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias RightIcon = EmptyModifier
        typealias RightIconCumulative = EmptyModifier

        static let leftIcon = LeftIcon()
        static let title = Title()
        static let rightIcon = RightIcon()
        static let leftIconCumulative = LeftIconCumulative()
        static let titleCumulative = TitleCumulative()
        static let rightIconCumulative = RightIconCumulative()
    }
}

extension FilterFeedbackBarItem: View {
    public var body: some View {
        filterFeedbackBarStyle.makeBody(configuration: FilterFeedbackBarStyleConfiguration(leftIcon: AnyView(_leftIcon), title: AnyView(_title), isSelected: _isSelected, rightIcon: AnyView(_rightIcon))).typeErased
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

/// Enum for FilterFeedbackBar ResetButton Type.
public enum FilterFeedbackBarResetButtonType {
    /// Reset to origin values.
    case reset
    /// Clear selected value, only effective for sinlge selection.
    case clearAll
}

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
                FilterFeedbackBarItem(leftIcon: self.item.isOptionSelected(opt) ? icon(name: self.item.icon, isVisible: true) : nil, title: opt, isSelected: self.item.isOptionSelected(opt))
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
    
    var onUpdate: () -> Void

    public init(item: Binding<SortFilterItem.SliderItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        FilterFeedbackBarItem(leftIcon: icon(name: self.item.icon, isVisible: true), title: self.item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
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
                    SliderPickerItem(value: Binding<Int?>(get: { self.item.workingValue }, set: { self.item.workingValue = $0 }), formatter: self.item.formatter, minimumValue: self.item.minimumValue, maximumValue: self.item.maximumValue)
                        .padding([.leading, .trailing], 16)
                        .background(GeometryReader { geometry in
                            Color.clear
                                .onAppear {
                                    self.geometrySizeHeight = geometry.size.height
                                    self.calculateDetentHeight()
                                }
                                .onChange(of: geometry.size) { newSize in
                                    self.geometrySizeHeight = newSize.height
                                    self.calculateDetentHeight()
                                }
                        })
                        .onChange(of: self.dynamicTypeSize) { _ in
                            self.calculateDetentHeight()
                        }
                }
                .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                    v.frame(width: self.popoverWidth)
                })
                .frame(minHeight: self.detentHeight)
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

    @ViewBuilder
    var button: some View {
        FilterFeedbackBarItem(leftIcon: icon(name: self.item.icon, isVisible: true), title: self.item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
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
                    OptionListPickerItem(value: self.$item.workingValue, valueOptions: self.item.valueOptions, hint: nil, itemLayout: self.item.itemLayout, barItemFrame: self.barItemFrame) { index in
                        self.item.onTap(option: self.item.valueOptions[index])
                    } updateSearchListPickerHeight: { height in
                        let isNotIphone = UIDevice.current.userInterfaceIdiom != .phone
                        var calculateHeight = height
                        calculateHeight += isNotIphone ? 13 : 16
                        calculateHeight += isNotIphone ? 50 : 56
                        if !isNotIphone {
                            calculateHeight += UIEdgeInsets.getSafeAreaInsets().bottom
                        }
                        #if !os(visionOS)
                            calculateHeight += UIDevice.current.userInterfaceIdiom != .phone ? 55 : 0
                        #else
                            calculateHeight += 95
                        #endif
                        self.detentHeight = calculateHeight
                    }
                    .padding([.leading, .trailing], 16)
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
                            self.item.onTap(option: self.item.valueOptions[idx])
                            self.item.apply()
                            self.onUpdate()
                        } label: {
                            Label { Text(self.item.valueOptions[idx]) } icon: { Image(fioriName: "fiori.accept") }
                        }
                    } else {
                        Button(self.item.valueOptions[idx]) {
                            self.item.onTap(option: self.item.valueOptions[idx])
                            self.item.apply()
                            self.onUpdate()
                        }
                    }
                }
            } label: {
                FilterFeedbackBarItem(leftIcon: icon(name: self.item.icon, isVisible: true), title: self.item.label, isSelected: self.item.isChecked)
            }
        }
    }
    
    @ViewBuilder
    var list: some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.phoneView()
        } else {
            self.padView()
        }
    }
    
    private func phoneView() -> some View {
        FilterFeedbackBarItem(leftIcon: icon(name: self.item.icon, isVisible: true), title: self.item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
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
                    SearchListPickerItem(value: self.$item.workingValue, valueOptions: self.item.valueOptions, hint: nil, allowsMultipleSelection: self.item.allowsMultipleSelection, allowsEmptySelection: self.item.allowsEmptySelection, isSearchBarHidden: self.item.isSearchBarHidden, disableListEntriesSection: self.item.disableListEntriesSection, allowsDisplaySelectionCount: self.item.allowsDisplaySelectionCount, barItemFrame: self.barItemFrame) { index in
                        self.item.onTap(option: self.item.valueOptions[index])
                    } selectAll: { isAll in
                        self.item.selectAll(isAll)
                    } updateSearchListPickerHeight: { height in
                        self.detentHeight = max(height, 88)
                    }
                    .animation(.spring)
                    .frame(maxHeight: UIDevice.current.userInterfaceIdiom != .phone ? self.detentHeight : nil)
                    .padding(0)
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidShowNotification)) { notif in
                        let rect = (notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) ?? .zero
                        self._keyboardHeight = rect.height
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidHideNotification)) { _ in
                        self._keyboardHeight = 0
                    }
                }
                .frame(minWidth: UIDevice.current.userInterfaceIdiom != .phone ? self.popoverWidth : nil)
                .frame(height: UIDevice.current.userInterfaceIdiom != .phone ? self.calculateDetentHeight() : nil)
                .presentationDetents([.height(self.calculateDetentHeight()), .medium, .large])
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
        FilterFeedbackBarItem(leftIcon: icon(name: self.item.icon, isVisible: true), title: self.item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .modifier(PopoverSizeModifier(isPresented: self.$isSheetVisible, arrowEdge: self.barItemFrame.arrowDirection(), popoverSize: CGSize(width: self.popoverWidth, height: self.calculateDetentHeight()), popoverContent: {
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
                    SearchListPickerItem(value: self.$item.workingValue, valueOptions: self.item.valueOptions, hint: nil, allowsMultipleSelection: self.item.allowsMultipleSelection, allowsEmptySelection: self.item.allowsEmptySelection, isSearchBarHidden: self.item.isSearchBarHidden, disableListEntriesSection: self.item.disableListEntriesSection, allowsDisplaySelectionCount: self.item.allowsDisplaySelectionCount, barItemFrame: self.barItemFrame) { index in
                        self.item.onTap(option: self.item.valueOptions[index])
                    } selectAll: { isAll in
                        self.item.selectAll(isAll)
                    } updateSearchListPickerHeight: { height in
                        self.detentHeight = max(height, 88)
                    }
                    .padding(0)
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidShowNotification)) { notif in
                        let rect = (notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) ?? .zero
                        self._keyboardHeight = rect.height
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidHideNotification)) { _ in
                        self._keyboardHeight = 0
                    }
                }
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
    
    private func calculateDetentHeight() -> CGFloat {
        let isNotIphone = UIDevice.current.userInterfaceIdiom != .phone
        var height = self.detentHeight
        height += isNotIphone ? 13 : 16
        height += isNotIphone ? 50 : 56
        if !self.item.isSearchBarHidden {
            if self._keyboardHeight == 0 {
                height += 52
            }
        }
        if !isNotIphone {
            height += UIEdgeInsets.getSafeAreaInsets().bottom
        }
        #if !os(visionOS)
            height += UIDevice.current.userInterfaceIdiom != .phone ? 55 : 0
        #else
            height += 75
        #endif
        if height > Screen.bounds.size.height - self.getSafeAreaInsets().top - 60 {
            return Screen.bounds.size.height / 2
        }
        return height
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
    
    private func resetButtonDisable() -> Bool {
        if self.item.resetButtonConfiguration.type == .reset {
            return self.item.isOriginal
        } else {
            return self.item.workingValue.isEmpty
        }
    }
}

struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat?

    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let nextValue = nextValue() else { return }
        value = nextValue
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
        FilterFeedbackBarItem(leftIcon: icon(name: self.item.icon, isVisible: true), title: self.item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
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
                .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                    v.frame(width: self.popoverWidth)
                })
                .frame(minHeight: self.detentHeight)
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
        FilterFeedbackBarItem(leftIcon: icon(name: self.item.icon, isVisible: true), title: self.item.name, isSelected: self.item.isChecked)
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
//            isSheetVisible.toggle()
            }
//        .popover(isPresented: $isSheetVisible, attachmentAnchor: .point(.bottom), arrowEdge: .bottom) {
//            CancellableResettableDialogForm {
//                Text(item.name)
//            } cancelAction: {
//                Action(actionText: "Cancel", didSelectAction: {
//                    item.cancel()
//                    isSheetVisible.toggle()
//                })
//                .buttonStyle(CancelResetButtonStyle())
//            } resetAction: {
//                Action(actionText: "Reset", didSelectAction: {
//                    item.reset()
//                })
//                .buttonStyle(CancelResetButtonStyle())
//            } applyAction: {
//                Action(actionText: "Apply", didSelectAction: {
//                    item.apply()
//                    onUpdate()
//                    isSheetVisible.toggle()
//                })
//                .buttonStyle(ApplyButtonStyle())
//            } components: {
//                SwitchPicker(value: $item.workingValue)
//            }
//        }
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
        FilterFeedbackBarItem(leftIcon: icon(name: self.item.icon, isVisible: true), title: self.item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
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
                            .onChange(of: geometry.size) { newSize in
                                self.geometrySizeHeight = newSize.height
                                self.calculateDetentHeight()
                            }
                    })
                    .onChange(of: self.dynamicTypeSize) { _ in
                        self.stepperViewHeight = 110 + self.dynamicTypeAddHeight()
                        self.calculateDetentHeight()
                    }
                }
                .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
                    v.frame(width: self.popoverWidth)
                })
                .frame(minHeight: self.detentHeight)
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

struct FullCFGMenuItem: View {
    @Environment(\.sortFilterMenuItemFullConfigurationButton) var fullCFGButton
    
    @Binding var items: [[SortFilterItem]]

    @State var isSheetVisible = false

    var onUpdate: () -> Void
    
    var resetButtonType = FilterFeedbackBarResetButtonType.reset

    public init(items: Binding<[[SortFilterItem]]>, onUpdate: @escaping () -> Void) {
        self._items = items
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        FilterFeedbackBarItem(leftIcon: icon(name: self.fullCFGButton.icon, isVisible: true), title: self.fullCFGButton.name ?? "", isSelected: true)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .popover(isPresented: self.$isSheetVisible) {
                SortFilterView(
                    title: {
                        if let title = fullCFGButton.name {
                            Text(title)
                        } else {
                            EmptyView()
                        }
                    },
                    items: {
                        _SortFilterCFGItemContainer(items: self.$items)
                    },
                    cancelAction: {
                        _Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                            self.isSheetVisible = false
                        })
                        .buttonStyle(CancelButtonStyle())
                    },
                    resetAction: {
                        _Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                            for r in 0 ..< self.items.count {
                                for c in 0 ..< self.items[r].count {
                                    self.items[r][c].reset()
                                }
                            }
                        })
                        .buttonStyle(ResetButtonStyle())
                    },
                    applyAction: {
                        _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                            for r in 0 ..< self.items.count {
                                for c in 0 ..< self.items[r].count {
                                    self.items[r][c].apply()
                                }
                            }
                            self.onUpdate()
                            self.isSheetVisible = false
                        })
                        .buttonStyle(ApplyButtonStyle())
                    },
                    onUpdate: {}
                )
            }
    }
}

extension CGRect {
    /// Popover arrowEdge depends on bar item position,
    /// only return `.top` or `.bottom` in this case
    /// - Returns: Edge
    func arrowDirection() -> Edge {
        if self.minY > Screen.bounds.size.height / 2 {
            return .bottom
        }
        return .top
    }
}

extension UIEdgeInsets {
    static func getSafeAreaInsets() -> UIEdgeInsets {
        guard let keyWindow = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
        else {
            return .zero
        }
        return keyWindow.safeAreaInsets
    }
}

#Preview {
    VStack {
        Spacer()
        
        FilterFeedbackBarItem(leftIcon: Image(systemName: "airplane"), title: "Airplane", rightIcon: Image(systemName: "chevron.down"), isSelected: true)
        FilterFeedbackBarItem(leftIcon: Image(systemName: "airplane"), title: "Airplane", rightIcon: Image(systemName: "chevron.down"), isSelected: false)
        FilterFeedbackBarItem(title: "Ship", rightIcon: Image(systemName: "chevron.down"), isSelected: true)
        FilterFeedbackBarItem(title: "Ship", rightIcon: Image(systemName: "chevron.down"), isSelected: false)
        FilterFeedbackBarItem(leftIcon: Image(systemName: "bus"), title: "Bus", isSelected: true)
        FilterFeedbackBarItem(leftIcon: Image(systemName: "bus"), title: "Bus", isSelected: false)
        
        Spacer()
        
        FilterFeedbackBarItem(leftIcon: Image(systemName: "airplane"), title: "Air Plane", rightIcon: Image(systemName: "chevron.down"), isSelected: true)
            .filterFeedbackBarStyle(font: .largeTitle, foregroundColorSelected: .red, strokeColorSelected: .red, cornerRadius: 25)
        FilterFeedbackBarItem(leftIcon: Image(systemName: "airplane"), title: "Air Plane", rightIcon: Image(systemName: "chevron.down"), isSelected: false)
            .filterFeedbackBarStyle(font: .footnote, foregroundColorUnselected: .green, strokeColorSelected: .black)
            .filterFeedbackBarStyle(cornerRadius: 16)
        FilterFeedbackBarItem(title: "Ship", rightIcon: Image(systemName: "chevron.down"), isSelected: true)
            .filterFeedbackBarStyle(fillColorSelected: .yellow)
        FilterFeedbackBarItem(title: "Ship", rightIcon: Image(systemName: "chevron.down"), isSelected: false)
            .filterFeedbackBarStyle(fillColorUnselected: .gray)
        FilterFeedbackBarItem(leftIcon: Image(systemName: "bus"), title: "Blue Bus", isSelected: true)
            .filterFeedbackBarStyle(cornerRadius: 20)
        FilterFeedbackBarItem(leftIcon: Image(systemName: "bus"), title: "Gray Bus", isSelected: false)
            .filterFeedbackBarStyle(cornerRadius: 20)

        Spacer()
    }
}

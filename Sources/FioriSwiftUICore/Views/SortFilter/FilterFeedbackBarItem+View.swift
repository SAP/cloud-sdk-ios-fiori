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
            .popover(isPresented: self.$isSheetVisible) {
                CancellableResettableDialogForm {
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
                        .padding([.leading, .trailing], UIDevice.current.userInterfaceIdiom == .pad ? 13 : 16)
                }
                .readHeight()
                .onPreferenceChange(HeightPreferenceKey.self) { height in
                    if let height {
                        self.detentHeight = height
                    }
                }
                .presentationDetents([.height(self.detentHeight)])
            }
    }
}

struct PickerMenuItem: View {
    @Binding var item: SortFilterItem.PickerItem
    var onUpdate: () -> Void
    
    @State var isSheetVisible = false

    @State var detentHeight: CGFloat = 0
    
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
            .popover(isPresented: self.$isSheetVisible) {
                CancellableResettableDialogForm {
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
                    OptionListPickerItem(value: self.$item.workingValue, valueOptions: self.item.valueOptions, hint: nil, itemLayout: self.item.itemLayout) { index in
                        self.item.onTap(option: self.item.valueOptions[index])
                    }
                    .padding([.leading, .trailing], UIDevice.current.userInterfaceIdiom == .pad ? 13 : 16)
                }
                .readHeight()
                .onPreferenceChange(HeightPreferenceKey.self) { height in
                    if let height {
                        self.detentHeight = height
                    }
                }
                .presentationDetents([.height(self.detentHeight)])
            }
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
        FilterFeedbackBarItem(leftIcon: icon(name: self.item.icon, isVisible: true), title: self.item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .popover(isPresented: self.$isSheetVisible) {
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
                    SearchListPickerItem(value: self.$item.workingValue, valueOptions: self.item.valueOptions, hint: nil, allowsMultipleSelection: self.item.allowsMultipleSelection, allowsEmptySelection: self.item.allowsEmptySelection) { index in
                        self.item.onTap(option: self.item.valueOptions[index])
                    } selectAll: { isAll in
                        self.item.selectAll(isAll)
                    } updateSearchListPickerHeight: { height in
                        self.detentHeight = height + 52 + 56 + 90
                    }
                    .padding(0)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(minWidth: UIDevice.current.userInterfaceIdiom != .phone ? 393 : nil)
                .frame(height: UIDevice.current.userInterfaceIdiom != .phone ? self.detentHeight : nil)
                .presentationDetents([.large])
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
    
    var onUpdate: () -> Void

    public init(item: Binding<SortFilterItem.DateTimeItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
        
    var body: some View {
        FilterFeedbackBarItem(leftIcon: icon(name: self.item.icon, isVisible: true), title: self.item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: self.item.isChecked)
            .onTapGesture {
                self.isSheetVisible.toggle()
            }
            .popover(isPresented: self.$isSheetVisible) {
                CancellableResettableDialogForm {
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
                        .padding([.leading, .trailing], UIDevice.current.userInterfaceIdiom == .pad ? 13 : 16)

                        DatePicker(
                            self.item.label,
                            selection: Binding<Date>(get: { self.item.workingValue ?? Date() }, set: { self.item.workingValue = $0 }),
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 : Screen.bounds.size.width - 16)
                        .clipped()
                    }
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 : Screen.bounds.size.width)
                }
                .readHeight()
                .onPreferenceChange(HeightPreferenceKey.self) { height in
                    DispatchQueue.main.async {
                        if let height {
                            self.detentHeight = height
                        }
                    }
                }
                .presentationDetents([.height(self.detentHeight)])
            }
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

struct FullCFGMenuItem: View {
    @Environment(\.sortFilterMenuItemFullConfigurationButton) var fullCFGButton
    
    @Binding var items: [[SortFilterItem]]

    @State var isSheetVisible = false

    var onUpdate: () -> Void
    
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
                            // item.apply()
                            self.onUpdate()
                            self.isSheetVisible.toggle()
                        })
                        .buttonStyle(CancelButtonStyle())
                    },
                    resetAction: {
                        _Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                            // item.cancel()
                            self.isSheetVisible.toggle()
                        })
                        .buttonStyle(ResetButtonStyle())
                    },
                    applyAction: {
                        _Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                            // item.reset()
                        })
                        .buttonStyle(ApplyButtonStyle())
                    },
                    onUpdate: {}
                )
            }
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

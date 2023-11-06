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
        sortFilterMenuItemStyle.makeBody(configuration: SortFilterMenuItemConfiguration(leftIcon: AnyView(_leftIcon), title: AnyView(_title), isSelected: _isSelected, rightIcon: AnyView(_rightIcon))).typeErased
    }
}

private extension View {
    func icon(name: String?, isVisible: Bool) -> Image? {
        if isVisible {
            if let name = name {
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
            ForEach($item.valueOptions.wrappedValue, id: \.self) { opt in
                FilterFeedbackBarItem(leftIcon: item.isOptionSelected(opt) ? icon(name: item.icon, isVisible: true) : nil, title: opt, isSelected: item.isOptionSelected(opt))
                    .onTapGesture {
                        item.onTap(option: opt)
                        item.apply()
                        onUpdate()
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
        FilterFeedbackBarItem(leftIcon: icon(name: item.icon, isVisible: true), title: item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: item.isChecked)
            .onTapGesture {
                isSheetVisible.toggle()
            }
            .popover(isPresented: $isSheetVisible, attachmentAnchor: .point(.bottom), arrowEdge: .bottom) {
                CancellableResettableDialogForm {
                    SortFilterItemTitle(title: item.name)
                } cancelAction: {
                    Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.cancel()
                        isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.reset()
                    })
                    .buttonStyle(ResetButtonStyle())
                    .disabled(self.item.isOriginal)
                } applyAction: {
                    Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.apply()
                        onUpdate()
                        isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())

                } components: {
                    SliderPicker(value: Binding<Int?>(get: { item.workingValue }, set: { item.workingValue = $0 }), formatter: item.formatter, minimumValue: item.minimumValue, maximumValue: item.maximumValue)
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
        if item.valueOptions.count > 4 {
            button
        } else {
            menu
        }
    }

    @ViewBuilder
    var button: some View {
        FilterFeedbackBarItem(leftIcon: icon(name: item.icon, isVisible: true), title: item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: item.isChecked)
            .onTapGesture {
                isSheetVisible.toggle()
            }
            .popover(isPresented: $isSheetVisible, attachmentAnchor: .point(.bottom), arrowEdge: .bottom) {
                CancellableResettableDialogForm {
                    SortFilterItemTitle(title: item.name)
                } cancelAction: {
                    Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.cancel()
                        isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.reset()
                    })
                    .buttonStyle(ResetButtonStyle())
                    .disabled(self.item.isOriginal)
                } applyAction: {
                    Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.apply()
                        onUpdate()
                        isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())
                } components: {
                    OptionListPicker(value: $item.workingValue, valueOptions: item.valueOptions, hint: nil) { index in
                        item.onTap(option: item.valueOptions[index])
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
                ForEach(item.valueOptions.indices) { idx in
                    if item.isOptionSelected(index: idx) {
                        Button {
                            item.onTap(option: item.valueOptions[idx])
                            item.apply()
                            onUpdate()
                        } label: {
                            Label { Text(item.valueOptions[idx]) } icon: { Image(fioriName: "fiori.accept") }
                        }
                    } else {
                        Button(item.valueOptions[idx]) {
                            item.onTap(option: item.valueOptions[idx])
                            item.apply()
                            onUpdate()
                        }
                    }
                }
            } label: {
                FilterFeedbackBarItem(leftIcon: icon(name: item.icon, isVisible: true), title: item.label, isSelected: item.isChecked)
            }
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
        FilterFeedbackBarItem(leftIcon: icon(name: item.icon, isVisible: true), title: item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: item.isChecked)
            .onTapGesture {
                isSheetVisible.toggle()
            }
            .popover(isPresented: $isSheetVisible, attachmentAnchor: .point(.bottom), arrowEdge: .bottom) {
                CancellableResettableDialogForm {
                    SortFilterItemTitle(title: item.name)
                } cancelAction: {
                    Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.cancel()
                        isSheetVisible.toggle()
                    })
                    .buttonStyle(CancelButtonStyle())
                } resetAction: {
                    Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.reset()
                    })
                    .buttonStyle(ResetButtonStyle())
                    .disabled(self.item.isOriginal)
                } applyAction: {
                    Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.apply()
                        onUpdate()
                        isSheetVisible.toggle()
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
                                selection: Binding<Date>(get: { item.workingValue ?? Date() }, set: { item.workingValue = $0 }),
                                displayedComponents: [.hourAndMinute]
                            )
                            .labelsHidden()
                        }
                        .padding([.leading, .trailing], UIDevice.current.userInterfaceIdiom == .pad ? 13 : 16)

                        DatePicker(
                            item.label,
                            selection: Binding<Date>(get: { item.workingValue ?? Date() }, set: { item.workingValue = $0 }),
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 - 13 : UIScreen.main.bounds.size.width - 16)
                        .clipped()
                    }
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 375 : UIScreen.main.bounds.size.width)

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
        FilterFeedbackBarItem(leftIcon: icon(name: item.icon, isVisible: true), title: item.name, isSelected: item.isChecked)
            .onTapGesture {
                if item.value != nil {
                    item.workingValue?.toggle()
                    item.apply()
                    onUpdate()
                } else {
                    item.workingValue = true
                    item.apply()
                    onUpdate()
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
        FilterFeedbackBarItem(leftIcon: icon(name: fullCFGButton.icon, isVisible: true), title: fullCFGButton.name ?? "", isSelected: true)
            .onTapGesture {
                isSheetVisible.toggle()
            }
            .popover(isPresented: $isSheetVisible, attachmentAnchor: .point(.bottom), arrowEdge: .bottom) {
                SortFilterView(
                    title: {
                        if let title = fullCFGButton.name {
                            Text(title)
                        } else {
                            EmptyView()
                        }
                    },
                    items: {
                        _SortFilterCFGItemContainer(items: $items)
                    },
                    cancelAction: {
                        Action(actionText: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                            // item.apply()
                            onUpdate()
                            isSheetVisible.toggle()
                        })
                        .buttonStyle(CancelButtonStyle())
                    },
                    resetAction: {
                        Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                            // item.cancel()
                            isSheetVisible.toggle()
                        })
                        .buttonStyle(ResetButtonStyle())
                    },
                    applyAction: {
                        Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
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

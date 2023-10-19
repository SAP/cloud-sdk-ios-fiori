import SwiftUI

extension Fiori {
    enum SortFilterMenuItem {
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

extension SortFilterMenuItem: View {
    public var body: some View {
        sortFilterMenuItemStyle.makeBody(configuration: SortFilterMenuItemConfiguration(leftIcon: AnyView(_leftIcon), title: AnyView(_title), isSelected: _isSelected, rightIcon: AnyView(_rightIcon))).typeErased
    }
}

/*
 // FIXME: - Implement SortFilterMenuItem specific LibraryContentProvider

 @available(iOS 14.0, macOS 11.0, *)
 struct SortFilterMenuItemLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(SortFilterMenuItem(model: LibraryPreviewData.Person.laurelosborn),
                     category: .control)
     }
 }
 */

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
    @Binding var item: PickerItem
    var onUpdate: () -> Void
    
    public init(item: Binding<PickerItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }

    var body: some View {
        Group {
            ForEach($item.valueOptions.wrappedValue, id: \.self) { opt in
                SortFilterMenuItem(leftIcon: item.isOptionSelected(opt) ? icon(name: item.icon, isVisible: true) : nil, title: opt, isSelected: item.isOptionSelected(opt))
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
    @Binding var item: SliderItem

    @State var isSheetVisible = false

    @State var detentHeight: CGFloat = 0

    var onUpdate: () -> Void
    
    public init(item: Binding<SliderItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        SortFilterMenuItem(leftIcon: icon(name: item.icon, isVisible: true), title: item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: item.isChecked)
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
                    .buttonStyle(CancelResetButtonStyle())
                } resetAction: {
                    Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.reset()
                    })
                    .buttonStyle(CancelResetButtonStyle())
                } applyAction: {
                    Action(actionText: NSLocalizedString("Apply", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.apply()
                        onUpdate()
                        isSheetVisible.toggle()
                    })
                    .buttonStyle(ApplyButtonStyle())

                } components: {
                    SliderPicker(value: Binding<Int?>(get: { item.workingValue }, set: { item.workingValue = $0 }), formatter: item.formatter, minimumValue: item.minimumValue, maximumValue: item.maximumValue)
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
    @Binding var item: PickerItem
    var onUpdate: () -> Void
    
    @State var isSheetVisible = false

    @State var detentHeight: CGFloat = 0
    
    public init(item: Binding<PickerItem>, onUpdate: @escaping () -> Void) {
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
        SortFilterMenuItem(leftIcon: icon(name: item.icon, isVisible: true), title: item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: item.isChecked)
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
                    .buttonStyle(CancelResetButtonStyle())
                } resetAction: {
                    Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.reset()
                    })
                    .buttonStyle(CancelResetButtonStyle())
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
                SortFilterMenuItem(leftIcon: icon(name: item.icon, isVisible: true), title: item.label, isSelected: item.isChecked)
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
    @Binding private var item: DateTimeItem
    
    @State private var isSheetVisible: Bool = false

    @State var detentHeight: CGFloat = 0
    
    var onUpdate: () -> Void

    public init(item: Binding<DateTimeItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
        
    var body: some View {
        SortFilterMenuItem(leftIcon: icon(name: item.icon, isVisible: true), title: item.label, rightIcon: Image(systemName: "chevron.down"), isSelected: item.isChecked)
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
                    .buttonStyle(CancelResetButtonStyle())
                } resetAction: {
                    Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                        item.reset()
                    })
                    .buttonStyle(CancelResetButtonStyle())
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
                                .font(.fiori(forTextStyle: .subheadline, weight: .bold, isItalic: false, isCondensed: false))
                                .foregroundColor(Color.preferredColor(.primaryLabel))
                            Spacer()
                            DatePicker(
                                "",
                                selection: Binding<Date>(get: { item.workingValue ?? Date() }, set: { item.workingValue = $0 }),
                                displayedComponents: [.hourAndMinute]
                            )
                            .labelsHidden()
                        }

                        DatePicker(
                            item.label,
                            selection: Binding<Date>(get: { item.workingValue ?? Date() }, set: { item.workingValue = $0 }),
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.graphical)
                    }
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
    @Binding private var item: SwitchItem
    
//    @State var detentHeight: CGFloat = 0
    
//    @State private var isSheetVisible: Bool = false
    var onUpdate: () -> Void

    public init(item: Binding<SwitchItem>, onUpdate: @escaping () -> Void) {
        self._item = item
        self.onUpdate = onUpdate
    }
        
    var body: some View {
        SortFilterMenuItem(leftIcon: icon(name: item.icon, isVisible: true), title: item.name, isSelected: item.isChecked)
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
        SortFilterMenuItem(leftIcon: icon(name: fullCFGButton.icon, isVisible: true), title: fullCFGButton.name ?? "", isSelected: true)
            .onTapGesture {
                isSheetVisible.toggle()
            }
            .popover(isPresented: $isSheetVisible, attachmentAnchor: .point(.bottom), arrowEdge: .bottom) {
                SortFilterFullCFG(
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
                        .buttonStyle(CancelResetButtonStyle())
                    },
                    resetAction: {
                        Action(actionText: NSLocalizedString("Reset", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), didSelectAction: {
                            // item.cancel()
                            isSheetVisible.toggle()
                        })
                        .buttonStyle(CancelResetButtonStyle())
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
        
        SortFilterMenuItem(leftIcon: Image(systemName: "airplane"), title: "Airplane", rightIcon: Image(systemName: "chevron.down"), isSelected: true)
        SortFilterMenuItem(leftIcon: Image(systemName: "airplane"), title: "Airplane", rightIcon: Image(systemName: "chevron.down"), isSelected: false)
        SortFilterMenuItem(title: "Ship", rightIcon: Image(systemName: "chevron.down"), isSelected: true)
        SortFilterMenuItem(title: "Ship", rightIcon: Image(systemName: "chevron.down"), isSelected: false)
        SortFilterMenuItem(leftIcon: Image(systemName: "bus"), title: "Bus", isSelected: true)
        SortFilterMenuItem(leftIcon: Image(systemName: "bus"), title: "Bus", isSelected: false)
        
        Spacer()
        
        SortFilterMenuItem(leftIcon: Image(systemName: "airplane"), title: "Air Plane", rightIcon: Image(systemName: "chevron.down"), isSelected: true)
            .sortFilterMenuItemStyle(font: .largeTitle, foregroundColorSelected: .red, strokeColorSelected: .red, cornerRadius: 25)
        SortFilterMenuItem(leftIcon: Image(systemName: "airplane"), title: "Air Plane", rightIcon: Image(systemName: "chevron.down"), isSelected: false)
            .sortFilterMenuItemStyle(font: .footnote, foregroundColorUnselected: .green, strokeColorSelected: .black)

            .sortFilterMenuItemStyle(cornerRadius: 16)
        SortFilterMenuItem(title: "Ship", rightIcon: Image(systemName: "chevron.down"), isSelected: true)
            .sortFilterMenuItemStyle(fillColorSelected: .yellow)
        SortFilterMenuItem(title: "Ship", rightIcon: Image(systemName: "chevron.down"), isSelected: false)
            .sortFilterMenuItemStyle(fillColorUnselected: .gray)
        SortFilterMenuItem(leftIcon: Image(systemName: "bus"), title: "Blue Bus", isSelected: true)
            .sortFilterMenuItemStyle(cornerRadius: 20)
        SortFilterMenuItem(leftIcon: Image(systemName: "bus"), title: "Gray Bus", isSelected: false)
            .sortFilterMenuItemStyle(cornerRadius: 20)

        Spacer()
    }
}

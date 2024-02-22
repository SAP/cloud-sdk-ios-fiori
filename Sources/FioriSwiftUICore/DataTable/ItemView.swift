import SwiftUI

/// Focused Inline Editing View for types .date, .time, duration & .listitem
struct FocusedEditingView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @ObservedObject var layoutManager: TableLayoutManager
    @Binding var showBanner: Bool
    @State var showPopover: Bool = false
    @State var showSheet: Bool = false
    @State var isInlineEdit: Bool = true
    @State var editingText: String = ""
    @State var editingDate = Date()
    @State var editingDuration: Int = 0
    @State var listItemSelection: Set<Int> = []
    @State var isValid: (Bool, String?) = (true, nil)
    
    let rowIndex: Int
    let columnIndex: Int
    let layoutData: LayoutData
    var dataItem: DataTableItem
    
    init(rowIndex: Int, columnIndex: Int, layoutManager: TableLayoutManager, layoutData: LayoutData, showBanner: Binding<Bool>) {
        self.layoutManager = layoutManager
        self.layoutData = layoutData
        self.rowIndex = rowIndex
        self.columnIndex = columnIndex
        self.dataItem = layoutData.allDataItems[rowIndex][columnIndex]
        self._showBanner = showBanner
        
        self._editingText = State(initialValue: self.dataItem.text ?? "")
        switch self.dataItem.type {
        case .listitem:
            if let selectedIndex = dataItem.selectedIndex {
                self._listItemSelection = State(initialValue: [selectedIndex])
                
            } else {
                let data = self.layoutManager.model.listItemDataAndTitle?(self.rowIndex, self.columnIndex) ?? ([self.editingText], "")
                if let index = data.0.firstIndex(of: self.dataItem.text ?? "") {
                    self._listItemSelection = State(initialValue: [index])
                }
            }
        case .date, .time:
            self._editingDate = State(initialValue: self.dataItem.date ?? Date())
        case .duration:
            self._editingDuration = State(initialValue: Int(self.dataItem.ti ?? 0) / 60)
        default:
            break
        }
        
        self._isValid = State(initialValue: (self.dataItem.isValid, ""))
    }
    
    var body: some View {
        let dataItem = self.layoutData.allDataItems[self.rowIndex][self.columnIndex]
        let foregroundColor: Color? = dataItem.foregroundColor
        let isHeader: Bool = self.rowIndex == 0 && self.layoutManager.model.hasHeader
        let cellWidth = self.layoutData.columnWidths[self.columnIndex] * self.layoutManager.scaleX
        let cellHeight = self.layoutData.rowHeights[self.rowIndex] * self.layoutManager.scaleY
        let contentInset = self.layoutData.cellContentInsets(for: self.rowIndex, columnIndex: self.columnIndex)
        let contentWidth = max(0, cellWidth - contentInset.horizontal * self.layoutManager.scaleX)
        let contentHeight = max(0, cellHeight - contentInset.vertical * self.layoutManager.scaleY)
        let baselineHeightOffset = (layoutData.firstBaselineHeights[self.rowIndex] - dataItem.firstBaselineHeight) * self.layoutManager.scaleY
        let imageWidth = min(min(contentWidth, contentHeight), 45 * self.layoutManager.scaleX)
        let imageHeight = min(min(contentWidth, contentHeight), 45 * self.layoutManager.scaleY)
        let uifont = dataItem.uifont ?? TableViewLayout.defaultUIFont(isHeader)
        let fontSize: CGFloat = uifont.pointSize * self.layoutManager.scaleX
        let finalFont = Font(uifont.withSize(fontSize))
        
        let tapGesture = TapGesture()
            .onEnded { _ in
                defer {
                    if let closure = layoutManager.model.cellTapped {
                        closure(rowIndex, columnIndex)
                    }
                }
                
                guard self.layoutManager.model.editMode == .inline else { return }
                
                // header is not editable
                if isHeader {
                    if self.layoutManager.currentCell != nil {
                        self.layoutManager.currentCell = nil
                    }
                    self.isInlineEdit = false
                    self.showPopover = false
                    self.showSheet = false
                    return
                }
                
                // tap again to dismiss .date, .time & .duration popover
                if let currentCell = self.layoutManager.currentCell, currentCell == (rowIndex, columnIndex), dataItem.type != .text, dataItem.type != .listitem, self.showPopover {
                    self.showPopover = false
                    self.showSheet = false
                    self.isInlineEdit = false
                    return
                }
                
                // save text changes if an other cell is tapped
                if let currentCell = self.layoutManager.currentCell, layoutData.allDataItems[currentCell.0][currentCell.1].type == .text {
                    self.layoutManager.updateText(rowIndex: currentCell.0, columnIndex: currentCell.1)
                }
                
                self.isInlineEdit = true
                
                let popoverTypes: [DataItemType] = [.date, .time, .duration]
                if popoverTypes.contains(dataItem.type) {
                    self.showPopover = true
                } else {
                    self.showPopover = false
                }
                
                if dataItem.type == .listitem {
                    let data = self.layoutManager.model.listItemDataAndTitle?(self.rowIndex, self.columnIndex) ?? ([self.editingText], "")
                    if self.listItemSelection.isEmpty, let curIndex = data.0.firstIndex(of: dataItem.text ?? "") {
                        self.listItemSelection = [curIndex]
                    }
                    
                    self.showSheet = true
                } else {
                    self.showSheet = false
                }
                self.layoutManager.currentCell = (self.rowIndex, self.columnIndex)
                self.isValid = self.layoutManager.checkIsValid(for: self.layoutData.allDataItems[self.rowIndex][self.columnIndex])
                
                self.layoutManager.isValid = self.isValid
                self.showBanner = !self.isValid.0
            }
        
        return self.theView(dataItem: dataItem, baselineHeightOffset: baselineHeightOffset, imageWidth: imageWidth, imageHeight: imageHeight, contentWidth: contentWidth, contentHeight: contentHeight, font: finalFont, foregroundColor: foregroundColor)
            .padding(contentInset)
            .frame(width: cellWidth, height: cellHeight)
            .background(self.backgroundColorForCell())
            .contentShape(Rectangle())
            .border(self.borderColorForCell(), width: 2)
            .gesture(tapGesture)
            .onAppear {
                DispatchQueue.main.async {
                    if dataItem.type == .listitem {
                        self.showSheet = true
                    } else {
                        self.showPopover = true
                    }
                }
            }
    }
    
    // swiftlint:disable function_body_length function_parameter_count
    func theView(dataItem: DataTableItem, baselineHeightOffset: CGFloat, imageWidth: CGFloat, imageHeight: CGFloat, contentWidth: CGFloat, contentHeight: CGFloat, font: Font, foregroundColor: Color?) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if let image = dataItem.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth, height: imageHeight, alignment: .center)
                    .padding(paddingForImage(textAlignment: dataItem.textAlignment, value: contentWidth - imageWidth))
                    .foregroundColor(foregroundColor)
            } else if dataItem.text != nil {
                if self.layoutManager.model.rowAlignment == .baseline {
                    Spacer().frame(height: baselineHeightOffset)
                }
                
                Group {
                    switch dataItem.type {
                    case .text:
                        Color.clear
                        
                    case .listitem:
                        HStack(alignment: .center) {
                            Text(self.editingText)
                                .font(font)
                                .foregroundColor(foregroundColor)
                                .background(Color.preferredColor(.tintColor).opacity(0.2))
                                .lineLimit(dataItem.lineLimit)
                                .multilineTextAlignment(dataItem.textAlignment)
                                .frame(width: contentWidth - 15, alignment: dataItem.textAlignment.toTextFrameAlignment())
                                .sheet(isPresented: self.$showSheet) {
                                    NavigationView {
                                        self.pickerView()
                                    }
                                }
                            
                            Spacer(minLength: 4)
                            
                            Image(systemName: "chevron.right")
                                .font(.fiori(fixedSize: 17).weight(.semibold))
                                .foregroundColor(Color.preferredColor(.separator))
                        }
                        
                    default:
                        Text(self.editingText)
                            .font(font)
                            .foregroundColor(self.isValid.0 ? foregroundColor : Color.preferredColor(.negativeLabel))
                            .background((self.checkIsValid() ? Color.preferredColor(.tintColor) : Color.preferredColor(.negativeLabel)).opacity(self.colorScheme == .light ? 0.1 : 0.2))
                            .lineLimit(dataItem.lineLimit)
                            .multilineTextAlignment(dataItem.textAlignment)
                            .frame(width: contentWidth, alignment: dataItem.textAlignment.toTextFrameAlignment())
                            .accessibility(hidden: self.editingText.isEmpty)
                    }
                }
                
                Spacer(minLength: 0)
            }
        }
        .popover(self.$showPopover) {
            switch dataItem.type {
            case .date:
                DatePicker(selection: self.$editingDate, displayedComponents: .date, label: { Text("") })
                    .datePickerStyle(.graphical)
                    .frame(width: 320)
                    .background(Color.preferredColor(.primaryBackground))
                    .cornerRadius(18)
                    .shadow(color: Color.black.opacity(0.2), radius: 5)
                    .shadow(color: Color.black.opacity(0.15), radius: 20)
                
            case .time:
                DatePicker(selection: self.$editingDate, displayedComponents: [.hourAndMinute], label: { Text("") })
                    .datePickerStyle(.wheel)
                    .frame(width: 232)
                    .background(Color.preferredColor(.primaryBackground))
                    .cornerRadius(18)
                    .shadow(color: Color.black.opacity(0.2), radius: 5)
                    .shadow(color: Color.black.opacity(0.15), radius: 20)
                
            case .duration:
                DurationPicker(selection: self.$editingDuration)
            default:
                EmptyView()
            }
        }
        .onChange(of: self.editingDate) { newValue in
            guard let layoutData = self.layoutManager.layoutData else { return }
            
            var dataItem = layoutData.allDataItems[self.rowIndex][self.columnIndex]
            dataItem.date = newValue
            self.isValid = self.layoutManager.checkIsValid(for: dataItem)
            let errorChange: Int = dataItem.isValid != self.isValid.0 ? (self.isValid.0 ? -1 : 1) : 0
            layoutData.numOfErrors += errorChange
            dataItem.isValid = self.isValid.0
            if let value = dataItem.string(for: layoutManager.model.columnAttribute(for: columnIndex)) {
                self.editingText = value
                dataItem.text = value
                dataItem.size = layoutData.calcDataItemSize(dataItem)
            }
            
            layoutData.allDataItems[self.rowIndex][self.columnIndex] = dataItem
            layoutData.updateCellLayout(for: self.rowIndex, columnIndex: self.columnIndex)
            self.layoutManager.needRefresh.toggle()
            self.layoutManager.isValid = self.isValid
            self.showBanner = !self.isValid.0
            
            self.layoutManager.model.valueDidChange?(DataTableChange(rowIndex: self.rowIndex, columnIndex: self.columnIndex, value: .date(newValue), text: self.editingText))
        }
        .onChange(of: self.editingDuration) { newValue in
            guard let layoutData = self.layoutManager.layoutData else { return }
            
            var dataItem = layoutData.allDataItems[self.rowIndex][self.columnIndex]
            dataItem.ti = TimeInterval(newValue * 60)
            self.isValid = self.layoutManager.checkIsValid(for: dataItem)
            let errorChange: Int = dataItem.isValid != self.isValid.0 ? (self.isValid.0 ? -1 : 1) : 0
            layoutData.numOfErrors += errorChange
            dataItem.isValid = self.isValid.0
            if let value = dataItem.string(for: layoutManager.model.columnAttribute(for: columnIndex)) {
                self.editingText = value
                dataItem.text = value
                dataItem.size = layoutData.calcDataItemSize(dataItem)
            }
            layoutData.allDataItems[self.rowIndex][self.columnIndex] = dataItem
            layoutData.updateCellLayout(for: self.rowIndex, columnIndex: self.columnIndex)
            self.layoutManager.needRefresh.toggle()
            self.layoutManager.isValid = self.isValid
            self.showBanner = !self.isValid.0
            
            self.layoutManager.model.valueDidChange?(DataTableChange(rowIndex: self.rowIndex, columnIndex: self.columnIndex, value: .duration(TimeInterval(newValue * 60)), text: self.editingText))
        }
    }

    func pickerView() -> some View {
        let data = self.layoutManager.model.listItemDataAndTitle?(self.rowIndex, self.columnIndex) ?? ([self.editingText], "")
        let indexData: [Int] = (0 ..< data.0.count).map { $0 }
        let cancelText = NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        let doneText = NSLocalizedString("Done", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        
        #if swift(>=5.7)
            if #available(iOS 15.0, *) {
                let filter: ((Int, String) -> Bool) = { f, s in
                    if !s.isEmpty {
                        return data.0[f].localizedCaseInsensitiveContains(s)
                    } else {
                        return true
                    }
                }
            
                return SearchableListView(data: indexData, id: \.self, children: nil,
                                          selection: $listItemSelection,
                                          allowsMultipleSelection: false,
                                          searchFilter: filter,
                                          rowContent: { index in
                                              Text(data.0[index])
                                                  .font(.fiori(forTextStyle: .body))
                                                  .foregroundColor(Color.preferredColor(.primaryLabel))
                                          },
                                          rowBackground: { _ in
                                              Color.preferredColor(.primaryBackground)
                                          },
                                          cancelAction: Action(actionText: cancelText) {},
                                          doneAction: Action(actionText: doneText) {
                                              guard let selectedIndex = listItemSelection.first else { return } // selection.wrappedValue.joined()
                
                                              guard let layoutData = self.layoutManager.layoutData else { return }
                                              var dataItem = layoutData.allDataItems[rowIndex][columnIndex]
                                              dataItem.text = data.0[selectedIndex]
                                              dataItem.selectedIndex = selectedIndex
                                              dataItem.size = layoutData.calcDataItemSize(dataItem)
                                              layoutData.allDataItems[rowIndex][columnIndex] = dataItem
                
                                              layoutData.updateCellLayout(for: rowIndex, columnIndex: columnIndex)
                                              layoutManager.needRefresh.toggle()
                                              self.showBanner = false
                                              editingText = data.0[selectedIndex]
                                              isValid = (true, nil)
                
                                              self.layoutManager.model.valueDidChange?(DataTableChange(rowIndex: rowIndex, columnIndex: columnIndex, value: .text(editingText), text: editingText, selectedIndex: selectedIndex))
                                          })
                    .listBackground(Color.preferredColor(.primaryBackground))
                    .navigationTitle(data.1)
            } else {
                return EmptyView()
            }
        #else
            return EmptyView()
        #endif
    }
    
    func backgroundColorForCell() -> Color {
        let isHeader: Bool = self.rowIndex == 0 && self.layoutManager.model.hasHeader
        let selectionIndex: Int = self.rowIndex - (self.layoutManager.model.hasHeader ? 1 : 0)
        let isSelected = self.layoutManager.model.editMode == .select && self.layoutManager.selectedIndexes.contains(selectionIndex)
        
        var isStickyCell = false
        if isHeader, self.layoutManager.model.isHeaderSticky {
            isStickyCell = true
        } else if self.layoutManager.model.isFirstColumnSticky, self.columnIndex == 0 {
            isStickyCell = true
        }
        
        if !isStickyCell {
            return .clear
        }
        
        if isSelected {
            return .clear
        } else {
            return self.layoutManager.model.backgroundColor
        }
    }
    
    func borderColorForCell() -> Color {
        if self.dataItem.type == .image {
            return .clear
        } else {
            return self.checkIsValid() ? Color.preferredColor(.tintColor) : Color.preferredColor(.negativeLabel)
        }
    }
    
    func checkIsValid() -> Bool {
        /// since .text is edited outside View so its isValid is not correct
        if self.dataItem.type == .text {
            return self.dataItem.isValid
        }
        
        return self.isValid.0
    }
}

/// DataTable Item View for all editingMode when it is not focused in inline editing mode
struct ItemView: View {
    let layoutManager: TableLayoutManager
    let layoutData: LayoutData
    let rowIndex: Int
    let columnIndex: Int
    @Binding var showBanner: Bool
    
    init(rowIndex: Int, columnIndex: Int, layoutManager: TableLayoutManager, layoutData: LayoutData, showBanner: Binding<Bool>) {
        self.layoutManager = layoutManager
        self.layoutData = layoutData
        self.rowIndex = rowIndex
        self.columnIndex = columnIndex
        self._showBanner = showBanner
    }
    
    var body: some View {
        if let currentCell = layoutManager.currentCell, currentCell.0 == rowIndex, currentCell.1 == columnIndex {
            EmptyView()
        } else {
            self.makeBody(layoutData: self.layoutData)
        }
    }
    
    func makeBody(layoutData: LayoutData) -> some View {
        let dataItem = layoutData.allDataItems[self.rowIndex][self.columnIndex]
        let foregroundColor: Color? = dataItem.foregroundColor
        let isHeader: Bool = self.rowIndex == 0 && self.layoutManager.model.hasHeader
        let cellWidth = layoutData.columnWidths[self.columnIndex] * self.layoutManager.scaleX
        let cellHeight = layoutData.rowHeights[self.rowIndex] * self.layoutManager.scaleY
        let contentInset = layoutData.cellContentInsets(for: self.rowIndex, columnIndex: self.columnIndex)
        let contentWidth = max(0, cellWidth - contentInset.horizontal * self.layoutManager.scaleX)
        let contentHeight = max(0, cellHeight - contentInset.vertical * self.layoutManager.scaleY)
        let baselineHeightOffset = (layoutData.firstBaselineHeights[self.rowIndex] - dataItem.firstBaselineHeight) * self.layoutManager.scaleY
        let imageWidth = min(min(contentWidth, contentHeight), 45 * self.layoutManager.scaleX)
        let imageHeight = min(min(contentWidth, contentHeight), 45 * self.layoutManager.scaleY)
        let uifont = dataItem.uifont ?? TableViewLayout.defaultUIFont(isHeader)
        let fontSize: CGFloat = uifont.pointSize * self.layoutManager.scaleX
        let finalFont = Font(uifont.withSize(fontSize))
        
        let tapGesture = TapGesture()
            .onEnded { _ in
                defer {
                    if let closure = layoutManager.model.cellTapped {
                        closure(rowIndex, columnIndex)
                    }
                }
                
                if self.layoutManager.model.editMode == .inline {
                    // save text changes if an other cell is tapped
                    if let currentCell = layoutManager.currentCell, layoutData.allDataItems[currentCell.0][currentCell.1].type == .text {
                        self.layoutManager.updateText(rowIndex: currentCell.0, columnIndex: currentCell.1)
                    }
                    
                    // header is not editable
                    if isHeader {
                        if self.layoutManager.currentCell != nil {
                            self.layoutManager.currentCell = nil
                        }
                        return
                    }
                    
                    self.layoutManager.currentCell = (self.rowIndex, self.columnIndex)
                    self.layoutManager.isValid = self.layoutManager.checkIsValid(for: layoutData.allDataItems[self.rowIndex][self.columnIndex])
                    self.showBanner = !self.layoutManager.isValid.0
                } else {
                    guard self.rowIndex >= 0, !isHeader else {
                        return
                    }
                    
                    let selectedIndex = self.rowIndex - (self.layoutManager.model.hasHeader ? 1 : 0)
                    
                    if self.layoutManager.model.editMode == .select {
                        if !self.layoutManager.selectedIndexes.contains(selectedIndex) {
                            self.layoutManager.selectedIndexes.append(selectedIndex)
                            self.layoutManager.model.selectedIndexes.append(selectedIndex)
                        } else {
                            self.layoutManager.selectedIndexes.removeAll { target -> Bool in
                                target == selectedIndex
                            }
                            self.layoutManager.model.selectedIndexes.removeAll { target -> Bool in
                                target == selectedIndex
                            }
                        }
                    } else {
                        if let handler = layoutManager.model.didSelectRowAt {
                            handler(selectedIndex)
                        }
                    }
                }
            }
        
        return ZStack(alignment: .bottomLeading) {
            self.theView(dataItem: dataItem, baselineHeightOffset: baselineHeightOffset, imageWidth: imageWidth, imageHeight: imageHeight, contentWidth: contentWidth, contentHeight: contentHeight, font: finalFont, foregroundColor: foregroundColor)
                .padding(contentInset)
            
            if dataItem.type != .image, !dataItem.isValid {
                Rectangle().frame(height: 2).foregroundColor(Color.preferredColor(.negativeLabel))
            }
        }
        .frame(width: cellWidth, height: cellHeight)
        .background(self.backgroundColorForSelectionState())
        .background(self.backgroundColorForCell())
        .contentShape(Rectangle())
        .gesture(tapGesture)
    }
    
    func theView(dataItem: DataTableItem, baselineHeightOffset: CGFloat, imageWidth: CGFloat, imageHeight: CGFloat, contentWidth: CGFloat, contentHeight: CGFloat, font: Font, foregroundColor: Color?) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if let image = dataItem.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth, height: imageHeight, alignment: .center)
                    .padding(paddingForImage(textAlignment: dataItem.textAlignment, value: contentWidth - imageWidth))
                    .foregroundColor(foregroundColor)
            } else if let displayText = dataItem.text {
                if self.layoutManager.model.rowAlignment == .baseline {
                    Spacer().frame(height: baselineHeightOffset)
                }
                
                if self.layoutManager.model.editMode == .inline, dataItem.type == .listitem {
                    HStack(alignment: .center) {
                        Text(displayText)
                            .font(font)
                            .foregroundColor(dataItem.isValid ? foregroundColor : Color.preferredColor(.negativeLabel))
                            .lineLimit(dataItem.lineLimit)
                            .multilineTextAlignment(dataItem.textAlignment)
                            .frame(width: contentWidth - 15, alignment: dataItem.textAlignment.toTextFrameAlignment())
                        
                        Spacer(minLength: 4)
                        
                        Image(systemName: "chevron.right")
                            .font(.fiori(fixedSize: 17).weight(.semibold))
                            .foregroundColor(Color.preferredColor(.separator))
                    }
                } else {
                    Text(displayText)
                        .font(font)
                        .foregroundColor(dataItem.isValid ? foregroundColor : Color.preferredColor(.negativeLabel))
                        .lineLimit(dataItem.lineLimit)
                        .multilineTextAlignment(dataItem.textAlignment)
                        .frame(width: contentWidth, alignment: dataItem.textAlignment.toTextFrameAlignment())
                        .accessibility(hidden: displayText.isEmpty)
                }
                
                Spacer(minLength: 0)
            }
        }
    }

    func backgroundColorForSelectionState() -> Color {
        let isHeader: Bool = self.rowIndex == 0 && self.layoutManager.model.hasHeader
        let selectionIndex: Int = self.rowIndex - (self.layoutManager.model.hasHeader ? 1 : 0)
        let isSelected = self.layoutManager.model.editMode == .select && self.layoutManager.selectedIndexes.contains(selectionIndex)
        
        var isStickyCell = false
        if isHeader, self.layoutManager.model.isHeaderSticky {
            isStickyCell = true
        } else if self.layoutManager.model.isFirstColumnSticky, self.columnIndex == 0 {
            isStickyCell = true
        }
        
        if isStickyCell, isSelected {
            return Color.preferredColor(.informationBackground)
        } else {
            return Color.clear
        }
    }

    func backgroundColorForCell() -> Color {
        let isHeader: Bool = self.rowIndex == 0 && self.layoutManager.model.hasHeader
        var isStickyCell = false
        if isHeader, self.layoutManager.model.isHeaderSticky {
            isStickyCell = true
        } else if self.layoutManager.model.isFirstColumnSticky, self.columnIndex == 0 {
            isStickyCell = true
        }
        
        return isStickyCell ? self.layoutManager.model.backgroundColor : Color.clear
    }
}

func paddingForImage(textAlignment: TextAlignment, value: CGFloat) -> SwiftUI.EdgeInsets {
    switch textAlignment {
    case .leading:
        return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: value)
    case .center:
        return EdgeInsets(top: 0, leading: value / 2, bottom: 0, trailing: value / 2)
    case .trailing:
        return EdgeInsets(top: 0, leading: value, bottom: 0, trailing: 0)
    }
}

import SwiftUI

/// DataTable Item View for specific rowIndex and columnIndex
struct ItemView: View {
    var dataItem: DataTableItem
    let rowIndex: Int
    let columnIndex: Int
    
    @Binding var showBanner: Bool
    @State var showPopover: Bool = false
    @State var showSheet: Bool = false
    @ObservedObject var layoutManager: TableLayoutManager
    @State var isInlineEdit: Bool = false
    @State var editingText: String = ""
    @State var editingDate = Date()
    @State var editingDuration: Int = 0
    
    @State var listItemSelection: Set<String> = []
    @FocusState var focusField: Bool
    @State var isValid: (Bool, String?) = (true, nil)
    
    init(_ dataItem: DataTableItem, layoutManager: TableLayoutManager, showBanner: Binding<Bool>, isInlineEdit: Bool) {
        self.dataItem = dataItem
        self.layoutManager = layoutManager
        self._showBanner = showBanner
        
        self.rowIndex = dataItem.rowIndex
        self.columnIndex = dataItem.columnIndex
        self._isInlineEdit = State(initialValue: isInlineEdit)
        
        self._editingText = State(initialValue: dataItem.text ?? "")
        
        switch dataItem.type {
        case .listitem:
            self._listItemSelection = State(initialValue: [dataItem.text ?? ""])
        case .date, .time:
            self._editingDate = State(initialValue: dataItem.date ?? Date())
        case .duration:
            self._editingDuration = State(initialValue: Int(dataItem.ti ?? 0) / 60)
        default:
            break
        }
        
        self._isValid = State(initialValue: (dataItem.isValid, ""))
    }
    
    var body: some View {
        Group {
            if self.layoutManager.layoutData != nil, self.layoutManager.layoutWorkItem == nil, rowIndex < self.layoutManager.numberOfRows(), columnIndex < self.layoutManager.numberOfColumns() {
                makeBody(layoutData: self.layoutManager.layoutData!)
            } else {
                EmptyView()
            }
        }
    }
    
    func pickerView(_ selection: Binding<Set<String>>) -> some View {
        let data = self.layoutManager.model.listItemDataAndTitle?(self.rowIndex, self.columnIndex) ?? ([self.editingText], "")
        let cancelText = NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        let doneText = NSLocalizedString("Done", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        
        if #available(iOS 15.0, *) {
            let filter: ((String, String) -> Bool) = { f, s in
                if !s.isEmpty {
                    return f.localizedCaseInsensitiveContains(s)
                } else {
                    return true
                }
            }
            
            return SearchableListView(data: data.0, id: \.self, children: nil,
                                      selection: selection,
                                      allowsMultipleSelection: false,
                                      searchFilter: filter,
                                      rowContent: { item in
                                          Text(item)
                                              .font(Font.body)
                                              .foregroundColor(Color.preferredColor(.primaryLabel))
                                      },
                                      rowBackground: { _ in
                                          Color.preferredColor(.primaryBackground)
                                      },
                                      cancelAction: Action(actionText: cancelText) {},
                                      doneAction: Action(actionText: doneText) {
                                          let theValue = selection.wrappedValue.joined()
                        
                                          guard let layoutData = self.layoutManager.layoutData else { return }
                                          var dataItem = layoutData.allDataItems[rowIndex][columnIndex]
                                          dataItem.text = theValue
                                          dataItem.size = layoutData.calcDataItemSize(dataItem)
                                          layoutData.allDataItems[rowIndex][columnIndex] = dataItem
                
                                          layoutData.updateCellLayout(for: rowIndex, columnIndex: columnIndex)
                                          self.layoutManager.layoutData = layoutData.copy()
                                          self.showBanner = false
                                          editingText = theValue
                                          isValid = (true, nil)
                                          focusField = false
                
                                          self.layoutManager.model.valueDidChange?(DataTableChange(rowIndex: rowIndex, columnIndex: columnIndex, value: .text(editingText), text: editingText))
                                      })
                .listBackground(Color.preferredColor(.primaryBackground))
                .navigationTitle(data.1)
        } else {
            return EmptyView()
        }
    }
    
    // swiftlint:disable cyclomatic_complexity function_body_length function_parameter_count
    func theView(dataItem: DataTableItem, baselineHeightOffset: CGFloat, imageWidth: CGFloat, imageHeight: CGFloat, contentWidth: CGFloat, contentHeight: CGFloat, font: Font, foregroundColor: Color?) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if let image = dataItem.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth, height: imageHeight, alignment: .center)
                    .padding(self.paddingForImage(textAlignment: dataItem.textAlignment, value: contentWidth - imageWidth))
                    .foregroundColor(foregroundColor)
            } else if let displayText = dataItem.text {
                if self.layoutManager.model.rowAlignment == .baseline {
                    Spacer().frame(height: baselineHeightOffset)
                }
                
                HStack(alignment: .top) {
                    if dataItem.textAlignment == .center || dataItem.textAlignment == .trailing {
                        Spacer(minLength: 0)
                    }
                    
                    HStack(alignment: .top) {
                        if self.layoutManager.model.editMode == .inline, isInlineEdit, isFocusedCurrentCell() {
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
                                        .sheet(isPresented: $showSheet) {
                                            NavigationView {
                                                pickerView($listItemSelection)
                                            }
                                        }
                                    
                                    Spacer(minLength: 4)
                                    
                                    Image(systemName: "chevron.right")
                                        .font(Font.fiori(fixedSize: 17).weight(.semibold))
                                        .foregroundColor(Color.preferredColor(.separator))
                                }
                                
                            default:
                                Text(editingText)
                                    .font(font)
                                    .foregroundColor(self.isValid.0 ? foregroundColor : Color.preferredColor(.negativeLabel))
                                    .background(Color.preferredColor(.tintColor).opacity(0.2))
                                    .lineLimit(dataItem.lineLimit)
                                    .multilineTextAlignment(dataItem.textAlignment)
                                    .accessibility(hidden: editingText.isEmpty)
                            }
                        } else {
                            if layoutManager.model.editMode == .inline && dataItem.type == .listitem {
                                HStack(alignment: .center) {
                                    Text(displayText)
                                        .font(font)
                                        .foregroundColor(foregroundColor)
                                        .lineLimit(dataItem.lineLimit)
//                                        .multilineTextAlignment(dataItem.textAlignment)
                                        .frame(width: contentWidth - 15, alignment: dataItem.textAlignment.toTextFrameAlignment())
                                        .frame(alignment: dataItem.textAlignment.toTextFrameAlignment())
                                        .sheet(isPresented: $showSheet) {
                                            NavigationView {
                                                pickerView($listItemSelection)
                                            }
                                        }

                                    Spacer(minLength: 4)
                                    
                                    Image(systemName: "chevron.right")
                                        .font(Font.fiori(fixedSize: 17).weight(.semibold))
                                        .foregroundColor(Color.preferredColor(.separator))
                                }
                            } else {
                                Text(displayText)
                                    .font(font)
                                    .foregroundColor(checkIsValid() ? foregroundColor : Color.preferredColor(.negativeLabel))
                                    .lineLimit(dataItem.lineLimit)
                                    .multilineTextAlignment(dataItem.textAlignment)
                                    .frame(width: contentWidth, alignment: dataItem.textAlignment.toTextFrameAlignment())
                                    .accessibility(hidden: editingText.isEmpty)
                            }
                        }
                    }
                    .popover($showPopover) {
                        switch dataItem.type {
                        case .date:
                            DatePicker(selection: $editingDate, displayedComponents: .date, label: { Text("") })
                                .datePickerStyle(.graphical)
                                .frame(width: 320)
                                .background(Color.preferredColor(.primaryBackground))
                                .cornerRadius(18)
                                .shadow(color: Color.black.opacity(0.2), radius: 5)
                                .shadow(color: Color.black.opacity(0.15), radius: 20)
                            
                        case .time:
                            DatePicker(selection: $editingDate, displayedComponents: [.hourAndMinute], label: { Text("") })
                                .datePickerStyle(.wheel)
                                .frame(width: 232)
                                .background(Color.preferredColor(.primaryBackground))
                                .cornerRadius(18)
                                .shadow(color: Color.black.opacity(0.2), radius: 5)
                                .shadow(color: Color.black.opacity(0.15), radius: 20)
                            
                        case .duration:
                            DurationPicker(selection: $editingDuration)
                        default:
                            EmptyView()
                        }
                    }
                    .onChange(of: self.editingDate) { newValue in
                        guard let layoutData = self.layoutManager.layoutData else { return }
                        
                        var dataItem = layoutData.allDataItems[self.rowIndex][self.columnIndex]
                        dataItem.date = newValue
                        isValid = layoutManager.checkIsValid(for: dataItem)
                        dataItem.isValid = isValid.0
                        if let value = dataItem.string(for: layoutManager.model.columnAttribute(for: columnIndex)) {
                            editingText = value
                            dataItem.text = value
                            dataItem.size = layoutData.calcDataItemSize(dataItem)
                        }
                        
                        layoutData.allDataItems[self.rowIndex][self.columnIndex] = dataItem
                        layoutData.updateCellLayout(for: rowIndex, columnIndex: columnIndex)
                        self.layoutManager.layoutData = layoutData.copy()
                        self.layoutManager.isValid = isValid
                        self.showBanner = !isValid.0
                        
                        self.layoutManager.model.valueDidChange?(DataTableChange(rowIndex: rowIndex, columnIndex: columnIndex, value: .date(newValue), text: editingText))
                    }
                    .onChange(of: self.editingDuration) { newValue in
                        guard let layoutData = self.layoutManager.layoutData else { return }
                        
                        var dataItem = layoutData.allDataItems[self.rowIndex][self.columnIndex]
                        dataItem.ti = TimeInterval(newValue * 60)
                        isValid = layoutManager.checkIsValid(for: dataItem)
                        dataItem.isValid = isValid.0
                        if let value = dataItem.string(for: layoutManager.model.columnAttribute(for: columnIndex)) {
                            self.editingText = value
                            dataItem.text = value
                            dataItem.size = layoutData.calcDataItemSize(dataItem)
                        }
                        layoutData.allDataItems[self.rowIndex][self.columnIndex] = dataItem
                        layoutData.updateCellLayout(for: rowIndex, columnIndex: columnIndex)
                        self.layoutManager.layoutData = layoutData.copy()
                        self.layoutManager.isValid = isValid
                        self.showBanner = !isValid.0
                        
                        self.layoutManager.model.valueDidChange?(DataTableChange(rowIndex: rowIndex, columnIndex: columnIndex, value: .duration(TimeInterval(newValue * 60)), text: editingText))
                    }
                    
                    if dataItem.textAlignment == .center || dataItem.textAlignment == .leading {
                        Spacer(minLength: 0)
                    }
                }
            }
            
            Spacer(minLength: 0)
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
                if self.layoutManager.model.editMode == .inline {
                    if let currentCell = self.layoutManager.currentCell, currentCell == (rowIndex, columnIndex), dataItem.type != .text && dataItem.type != .listitem {
                        self.layoutManager.currentCell = nil
                        isInlineEdit = false
                        focusField = false
                        showPopover = false
                        showSheet = false
                        return
                    }
                    
                    isInlineEdit = true
                    focusField = true
                    let popoverTypes: [DataItemType] = [.date, .time, .duration]
                    if popoverTypes.contains(dataItem.type) {
                        showPopover = true
                    } else {
                        showPopover = false
                    }
                    
                    if dataItem.type == .listitem {
                        showSheet = true
                    } else {
                        showSheet = false
                    }
                    self.layoutManager.cacheCurrentCell = self.layoutManager.currentCell
                    self.layoutManager.currentCell = (rowIndex, columnIndex)
                    isValid = layoutManager.checkIsValid(for: layoutData.allDataItems[rowIndex][columnIndex])
                    
                    self.layoutManager.isValid = isValid
                    self.showBanner = !isValid.0
                } else {
                    guard rowIndex >= 0, !isHeader else {
                        return
                    }
                    
                    let selectedIndex = rowIndex - (self.layoutManager.model.hasHeader ? 1 : 0)
                    
                    if self.layoutManager.model.editMode == .select {
                        if !self.layoutManager.selectedIndexes.contains(selectedIndex) {
                            self.layoutManager.selectedIndexes.append(selectedIndex)
                            self.layoutManager.model.selectedIndexes.append(selectedIndex)
                        } else {
                            self.layoutManager.selectedIndexes.removeAll { (target) -> Bool in
                                target == selectedIndex
                            }
                            self.layoutManager.model.selectedIndexes.removeAll { (target) -> Bool in
                                target == selectedIndex
                            }
                        }
                    } else {
                        if let handler = self.layoutManager.model.didSelectRowAt {
                            handler(selectedIndex)
                        }
                    }
                }
            }
        
        return ZStack(alignment: .bottomLeading) {
            theView(dataItem: dataItem, baselineHeightOffset: baselineHeightOffset, imageWidth: imageWidth, imageHeight: imageHeight, contentWidth: contentWidth, contentHeight: contentHeight, font: finalFont, foregroundColor: foregroundColor)
                .padding(contentInset)
            
            if dataItem.type != .image && !checkIsValid() && !isFocusedCurrentCell() {
                Rectangle().frame(height: 2).foregroundColor(Color.preferredColor(.negativeLabel))
            }
        }
        .frame(width: cellWidth, height: cellHeight)
        .background(self.backgroundColorForCell())
        .contentShape(Rectangle())
        .border(self.borderColorForCell(), width: 2)
        .gesture(tapGesture)
    }
    
    func backgroundColorForCell() -> Color {
        let isHeader: Bool = self.rowIndex == 0 && self.layoutManager.model.hasHeader
        let selectionIndex: Int = self.rowIndex - (self.layoutManager.model.hasHeader ? 1 : 0)
        let isSelected = self.layoutManager.model.editMode == .select && self.layoutManager.selectedIndexes.contains(selectionIndex)
        
        var isStickyCell = false
        if isHeader && self.layoutManager.model.isHeaderSticky {
            isStickyCell = true
        } else if self.layoutManager.model.isFirstColumnSticky && self.columnIndex == 0 {
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
        } else if self.isInlineEdit && self.isFocusedCurrentCell() {
            return self.checkIsValid() ? Color.preferredColor(.tintColor) : Color.preferredColor(.negativeLabel)
        } else {
            return .clear
        }
    }
    
    func checkIsValid() -> Bool {
        /// since .text is edited outside View so its isValid is not correct
        if self.dataItem.type == .text {
            return self.dataItem.isValid
        }
        
        return self.isValid.0
    }
    
    func isFocusedCurrentCell() -> Bool {
        if let current = self.layoutManager.currentCell {
            if current.0 == self.rowIndex && current.1 == self.columnIndex {
                return true
            }
        }
        
        return false
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
}

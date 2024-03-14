import SwiftUI

class InlineEditingModel: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    @Published var size = CGSize.zero
    @Published var currentCell: (Int, Int)? = nil
}

struct InlineEditingView: View {
    let layoutManager: TableLayoutManager
    let rowIndex: Int
    let columnIndex: Int
    let layoutData: LayoutData
    @ObservedObject var inlineEditingModel: InlineEditingModel
    @Binding var showBanner: Bool
    @State var editingText: String = ""
    @State var isValid: (Bool, String?) = (true, nil)
    @FocusState var focusState: Bool
    
    init(layoutManager: TableLayoutManager, layoutData: LayoutData, showBanner: Binding<Bool>) {
        self.layoutManager = layoutManager
        self.inlineEditingModel = layoutManager.inlineEditingModel
        self.layoutData = layoutData
        self._showBanner = showBanner
        self.rowIndex = (layoutManager.currentCell ?? (0, 0)).0
        self.columnIndex = (layoutManager.currentCell ?? (0, 0)).1
        let dataItem = layoutManager.layoutData?.allDataItems[self.rowIndex][self.columnIndex]
        self._editingText = State(initialValue: dataItem?.text ?? "")
        self._isValid = State(initialValue: (dataItem?.isValid ?? true, ""))
    }
    
    var toolbarItemPlacement: ToolbarItemPlacement {
        #if os(visionOS)
            return .automatic
        #else
            return .keyboard
        #endif
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
        let isValid = self.layoutManager.checkIsValid(for: self.layoutData.allDataItems[self.rowIndex][self.columnIndex])
        let uifont = dataItem.uifont ?? TableViewLayout.defaultUIFont(isHeader)
        let baselineHeightOffset = (layoutData.firstBaselineHeights[self.rowIndex] - dataItem.firstBaselineHeight) * self.layoutManager.scaleY
        let fontSize: CGFloat = uifont.pointSize * self.layoutManager.scaleX
        let finalFont = Font(uifont.withSize(fontSize))
        
        return VStack(alignment: .leading, spacing: 0) {
            if self.layoutManager.model.rowAlignment == .baseline {
                Spacer().frame(height: baselineHeightOffset)
            }
            
            HStack(alignment: .top) {
                if dataItem.textAlignment == .center || dataItem.textAlignment == .trailing {
                    Spacer(minLength: 0)
                }
                
                #if swift(>=5.7)
                    if #available(iOS 16, *) {
                        TextField("", text: $editingText, axis: Axis.vertical)
                            .font(finalFont)
                            .foregroundColor(isValid.0 ? foregroundColor : Color.preferredColor(.negativeLabel))
                            .accentColor(isValid.0 ? Color.preferredColor(.tintColor) : Color.preferredColor(.negativeLabel))
                            .lineLimit(dataItem.lineLimit)
                            .multilineTextAlignment(dataItem.textAlignment)
                            .focused($focusState)
                            .frame(width: contentWidth, height: contentHeight, alignment: dataItem.textAlignment.toTextFrameAlignment())
                            .onSubmit {
                                updateText(editingText)
                            }
                    } else {
                        TextField("", text: self.$editingText)
                            .font(finalFont)
                            .foregroundColor(isValid.0 ? foregroundColor : Color.preferredColor(.negativeLabel))
                            .accentColor(isValid.0 ? Color.preferredColor(.tintColor) : Color.preferredColor(.negativeLabel))
                            .lineLimit(dataItem.lineLimit)
                            .multilineTextAlignment(dataItem.textAlignment)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .focused(self.$focusState)
                            .frame(width: contentWidth, height: contentHeight, alignment: dataItem.textAlignment.toTextFrameAlignment())
                            .onSubmit {
                                self.updateText(self.editingText)
                            }
                    }
                #else
                    TextField("", text: self.$editingText)
                        .focused(self.$focusState)
                        .onSubmit {
                            self.updateText(self.editingText)
                        }
                        .lineLimit(dataItem.lineLimit)
                        .multilineTextAlignment(dataItem.textAlignment)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .frame(width: contentWidth, height: contentHeight, alignment: dataItem.textAlignment.toTextFrameAlignment())
                        .font(finalFont)
                        .foregroundColor(isValid.0 ? foregroundColor : Color.preferredColor(.negativeLabel))
                        .accentColor(isValid.0 ? Color.preferredColor(.tintColor) : Color.preferredColor(.negativeLabel))
                #endif
                
                if dataItem.textAlignment == .center || dataItem.textAlignment == .leading {
                    Spacer(minLength: 0)
                }
            }
            
            Spacer(minLength: 0)
        }
        .padding(contentInset)
        .frame(width: cellWidth, height: cellHeight)
        .border(isValid.0 ? Color.preferredColor(.tintColor) : Color.preferredColor(.negativeLabel), width: 2)
        .toolbar {
            ToolbarItemGroup(placement: self.toolbarItemPlacement) {
                Spacer()
                
                Button {
                    self.updateText(self.editingText)
                } label: {
                    Text("Done", tableName: "FioriSwiftUICore", bundle: Bundle.accessor)
                        .font(Font.fiori(forTextStyle: .body).bold())
                        .foregroundColor(Color.preferredColor(.tintColor))
                }
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                self.focusState = true
            }
        }
        .onChange(of: self.editingText, perform: { _ in
            self.layoutManager.cacheEditingText = self.editingText
        })
        .onChange(of: self.focusState) { newValue in
            // lost focus
            if !newValue {
                self.updateText(self.editingText)
            }
        }
    }
    
    func updateText(_ newValue: String) {
        guard let layoutData = layoutManager.layoutData else { return }
            
        var dataItem = layoutData.allDataItems[self.rowIndex][self.columnIndex]
        if dataItem.text != newValue {
            dataItem.text = newValue
            self.isValid = self.layoutManager.checkIsValid(for: dataItem)
            let errorChange: Int = dataItem.isValid != self.isValid.0 ? (self.isValid.0 ? -1 : 1) : 0
            layoutData.numOfErrors += errorChange
            dataItem.isValid = self.isValid.0
            dataItem.size = layoutData.calcDataItemSize(dataItem)
            layoutData.allDataItems[self.rowIndex][self.columnIndex] = dataItem
            layoutData.updateCellLayout(for: self.rowIndex, columnIndex: self.columnIndex)
            self.layoutManager.needRefresh.toggle()
            self.layoutManager.isValid = self.isValid
            self.showBanner = !self.isValid.0
            self.layoutManager.model.valueDidChange?(DataTableChange(rowIndex: self.rowIndex, columnIndex: self.columnIndex, value: .text(self.editingText), text: self.editingText))
        }
        
        self.layoutManager.currentCell = nil
    }
}

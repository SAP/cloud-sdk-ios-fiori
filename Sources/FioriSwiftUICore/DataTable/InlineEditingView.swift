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
    @ObservedObject var inlineEditingModel: InlineEditingModel
    @Binding var showBanner: Bool
    @State var editingText: String = ""
    @FocusState var focusState: Bool?
    @State var isValid: (Bool, String?) = (true, nil)
    
    init(layoutManager: TableLayoutManager, showBanner: Binding<Bool>) {
        self.layoutManager = layoutManager
        self.inlineEditingModel = layoutManager.inlineEditingModel
        self._showBanner = showBanner
        self.rowIndex = (layoutManager.currentCell ?? (0, 0)).0
        self.columnIndex = (layoutManager.currentCell ?? (0, 0)).1
        let dataItem = layoutManager.layoutData?.allDataItems[self.rowIndex][self.columnIndex]
        self._editingText = State(initialValue: dataItem?.text ?? "")
        self.focusState = true
        self._isValid = State(initialValue: (dataItem?.isValid ?? true, ""))
    }

    var body: some View {
        if let layoutData = layoutManager.layoutData {
            makeBody(layoutData)
        } else {
            EmptyView()
        }
    }
    
    func makeBody(_ layoutData: LayoutData) -> some View {
        let dataItem = layoutData.allDataItems[self.rowIndex][self.columnIndex]
        let foregroundColor: Color? = dataItem.foregroundColor
        let isHeader: Bool = self.rowIndex == 0 && self.layoutManager.model.hasHeader
        let cellWidth = layoutData.columnWidths[self.columnIndex] * self.layoutManager.scaleX
        let cellHeight = layoutData.rowHeights[self.rowIndex] * self.layoutManager.scaleY
        let contentInset = layoutData.cellContentInsets(for: self.rowIndex, columnIndex: self.columnIndex)
        let contentWidth = max(0, cellWidth - contentInset.horizontal * self.layoutManager.scaleX)
        let contentHeight = max(0, cellHeight - contentInset.vertical * self.layoutManager.scaleY)
        let isValid = self.layoutManager.checkIsValid(for: layoutData.allDataItems[self.rowIndex][self.columnIndex])
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
                
                if #available(iOS 16, *) {
                    TextField("", text: $editingText, axis: .vertical)
                        .focused($focusState, equals: true)
                        .onSubmit {
                            updateText(editingText)
                        }
                        .lineLimit(dataItem.lineLimit)
                        .multilineTextAlignment(dataItem.textAlignment)
                        .frame(width: contentWidth, height: contentHeight, alignment: dataItem.textAlignment.toTextFrameAlignment())
                        .font(finalFont)
                        .foregroundColor(isValid.0 ? foregroundColor : Color.preferredColor(.negativeLabel))
                        .accentColor(isValid.0 ? Color.preferredColor(.tintColor) : Color.preferredColor(.negativeLabel))
                } else {
                    TextField("", text: $editingText)
                        .focused($focusState, equals: true)
                        .onSubmit {
                            updateText(editingText)
                        }
                        .lineLimit(dataItem.lineLimit)
                        .multilineTextAlignment(dataItem.textAlignment)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .frame(width: contentWidth, height: contentHeight, alignment: dataItem.textAlignment.toTextFrameAlignment())
                        .font(finalFont)
                        .foregroundColor(isValid.0 ? foregroundColor : Color.preferredColor(.negativeLabel))
                        .accentColor(isValid.0 ? Color.preferredColor(.tintColor) : Color.preferredColor(.negativeLabel))
                }
                
                if dataItem.textAlignment == .center || dataItem.textAlignment == .leading {
                    Spacer(minLength: 0)
                }
            }
            
            Spacer(minLength: 0)
        }
        .padding(contentInset)
        .frame(width: cellWidth, height: cellHeight)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button {
                    updateText(editingText)
                } label: {
                    Text("Done", tableName: "FioriSwiftUICore", bundle: Bundle.accessor)
                        .font(Font.fiori(forTextStyle: .body).bold())
                        .foregroundColor(Color.preferredColor(.tintColor))
                }
            }
        }
        .onAppear {
            focusState = true
        }
    }
    
    func updateText(_ newValue: String) {
        guard let layoutData = self.layoutManager.layoutData else { return }
            
        var dataItem = layoutData.allDataItems[self.rowIndex][self.columnIndex]
        if dataItem.text != newValue {
            dataItem.text = newValue
            self.isValid = self.layoutManager.checkIsValid(for: dataItem)
            dataItem.isValid = self.isValid.0
            dataItem.size = layoutData.calcDataItemSize(dataItem)
            layoutData.allDataItems[self.rowIndex][self.columnIndex] = dataItem
            layoutData.updateCellLayout(for: self.rowIndex, columnIndex: self.columnIndex)
            self.layoutManager.layoutData = layoutData.copy()
            self.layoutManager.isValid = self.isValid
            self.showBanner = !self.isValid.0
            self.layoutManager.model.valueDidChange?(DataTableChange(rowIndex: self.rowIndex, columnIndex: self.columnIndex, value: .text(self.editingText), text: self.editingText))
        }
        
        self.focusState = nil
        self.layoutManager.currentCell = nil
    }
}

import SwiftUI

struct ItemView: View {
    let dataItem: DataTableItem
    
    var dropVerticalShadow: Bool = false
    
    var foregroundColor: Color?
    
    var font: Font?
    
    @EnvironmentObject var layoutManager: TableLayoutManager
    @EnvironmentObject var dataManager: TableDataManager
    @Environment(\.backgroundColor) var backgroundColor
    
    @GestureState var isDetectingLongPress = false
    @State private var itemText: String = ""
    @State private var inlineEditing: Bool = false
    @State private var selection: [Int] = [0, 0, 0]
    @State private var isShowingPicker = false
    
    let isHeader: Bool
    let index: (Int, Int)
    
    init(_ dataItem: DataTableItem, _ index: (Int, Int), _ isHeader: Bool = false, foregroundColor: Color? = nil, font: Font? = nil, dropShadow: Bool) {
        self.dataItem = dataItem
        self.index = index
        self.isHeader = isHeader
        self.foregroundColor = foregroundColor
        self.font = font
        self.dropVerticalShadow = dropShadow
    }
    
    var body: some View {
        makeBody()
    }
    
    func makeBody() -> some View {
        let contentInset = TableViewLayout.contentInset(sizeClass: self.layoutManager.sizeClass)
        DispatchQueue.main.async {
            if let index = layoutManager.model.inlineEditingCell {
                self.inlineEditing = index == self.index
            } else {
                self.inlineEditing = false
            }
        }
        var longPress: some Gesture {
            LongPressGesture(minimumDuration: 2)
                .updating($isDetectingLongPress) { currentState, gestureState,
                    transaction in
                    guard self.layoutManager.model.inlineEditingEable else {
                        return
                    }
                    gestureState = currentState
                    transaction.animation = Animation.easeIn(duration: 2.0)
                }
                .onEnded { finished in
                    self.inlineEditing = finished
                    layoutManager.model.inlineEditingCell = self.index
                    if case .picker(let currentPicker) = self.dataItem.value {
                        setPickerOffsetIfNeeded()
                        self.layoutManager.model.currentPicker = currentPicker
                        withAnimation {
                            self.layoutManager.model.isShowingPicker.toggle()
                        }
                    } else {
                        if finished {
                            setKeyboardNotifications()
                        }
                    }
                }
        }
        let tapGesture = TapGesture()
            .onEnded { _ in
                guard self.dataItem.rowIndex >= 0, !self.isHeader else {
                    return
                }
                let rowIndex = self.dataItem.rowIndex - 1
                if self.layoutManager.isEditing {
                    if !self.dataManager.selectedIndexes.contains(rowIndex) {
                        self.dataManager.selectedIndexes.append(rowIndex)
                        self.layoutManager.model.selectedIndexes.append(rowIndex)
                    } else {
                        self.dataManager.selectedIndexes.removeAll { (target) -> Bool in
                            target == rowIndex
                        }
                        self.layoutManager.model.selectedIndexes.removeAll { (target) -> Bool in
                            target == rowIndex
                        }
                    }
                } else {
                    print("Tapped on row: \(rowIndex)")
                    if let handler = self.layoutManager.model.didSelectRowAt {
                        handler(rowIndex)
                    }
                }
            }
        
        return
            ZStack {
                Group {
                    switch dataItem.value {
                    case .image(let image):
                        createImageView(image: image)
                    case .text(let value):
                        createTextView(text: value)
                    case .picker(let picker):
                        if let textItem = picker._displayingItem as? DataTextItem {
                            createTextView(text: textItem.text)
                        }
                        if let imageItem = picker._displayingItem as? DataImageItem {
                            createImageView(image: imageItem.image)
                        }
                    }
                }
                
                if index == (0, 0) && self.layoutManager.model.isFirstColumnSticky {
                    let offsetX: CGFloat = self.dataItem.size.width / 2 + contentInset
                    verticalDivider(offsetX: offsetX)
                }
            }
            .background(self.backgroundColor.frame(width: (((self.dataItem.isLast && self.isHeader) ? self.layoutManager.tableTrailingLayoutMargin : 0) + self.dataItem.size.width + contentInset * 2) * self.layoutManager.scaleX, height: self.dataItem.rowHeight * self.layoutManager.scaleY))
            .offset(x: (self.dataItem.isLast && self.isHeader) ? self.layoutManager.tableTrailingLayoutMargin / 2 : 0, y: 0)
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.blue.opacity(self.isDetectingLongPress ? 1 : (self.inlineEditing ? 1 : 0)), lineWidth: 2)
                    .frame(width: self.dataItem.size.width + contentInset * 2)
            )
            .gesture(tapGesture)
            .gesture(longPress)
    }
    
    func verticalDivider(offsetX: CGFloat) -> some View {
        HStack {
            Divider()
                .frame(height: self.layoutManager.actualTableViewSize.height * self.layoutManager.scaleY)
                .offset(x: offsetX * self.layoutManager.scaleX, y: (self.layoutManager.actualTableViewSize.height - self.dataItem.rowHeight) / 2 * self.layoutManager.scaleY)
                .dropShadow(isVertical: true, show: self.dropVerticalShadow)
        }
    }
    
    func createImageView(image: Image) -> some View {
        image
            .frame(width: 45 * self.layoutManager.scaleX, height: 45 * self.layoutManager.scaleY)
            .foregroundColor(self.foregroundColor)
    }
    
    func createTextView(text: String) -> some View {
        let font = self.font ?? TableViewLayout.defaultFont(self.isHeader)
        let fontSize: CGFloat = UIFont.preferredFont(from: font).pointSize * self.layoutManager.scaleX
        let finalFont = Font(UIFont.preferredFont(from: font).withSize(fontSize))
        return
            self.switchView(text)
                .font(finalFont)
                .foregroundColor(self.foregroundColor)
                .lineLimit(self.dataItem.lineLimit)
                .multilineTextAlignment(self.dataItem.textAlignment)
                .frame(width: self.dataItem.size.width * self.layoutManager.scaleX, height: self.dataItem.rowHeight * self.layoutManager.scaleY, alignment: self.dataItem.textAlignment.toTextFrameAlignment())
                .padding(.trailing, (self.dataItem.isLast && self.isHeader) ? self.layoutManager.tableTrailingLayoutMargin : 0)
    }
    
    func switchView(_ text: String?) -> some View {
        DispatchQueue.main.async {
            self.itemText = text ?? ""
        }
        return
            Group {
                if self.inlineEditing, case .text = self.dataItem.value {
                    TextField("", text: $itemText) { _ in
                        
                    } onCommit: {
                        inlineEditing.toggle()
                        let row = self.layoutManager.model.isHeaderSticky ? index.0 - 1 : index.0
                        let col = index.1
                        if let item = layoutManager.model.rowData[row].data[col] as? DataTextItem {
                            item.text = self.itemText
                        }
                        layoutManager.model.inlineEditingCell = (-1, -1)
                    }
                    .onAppear {
                        setKeyboardNotifications()
                    }
                } else {
                    Text(text ?? "")
                }
            }
    }
    
    func setKeyboardNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                return
            }
            let itemY = self.dataItem.pos.y
            let itemHeight = dataItem.rowHeight * self.layoutManager.scaleY
            
            let keyboardHeight = keyboardFrame.height
            let rectBottom = self.layoutManager.rect.maxY
            
            let ItemDisToBottom = rectBottom - (itemY + itemHeight / 4)
            
            let gap = ItemDisToBottom - keyboardHeight
            
            guard gap < 0 else {
                self.layoutManager.model.shouldMoveupTable = false
                self.layoutManager.model.offsetForTable = 0
                return
            }
            self.layoutManager.model.shouldMoveupTable = true
            withAnimation(.easeInOut) {
                self.layoutManager.model.offsetForTable = gap
            }
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
            if !self.layoutManager.model.shouldMoveupTable {
                return
            }
            self.layoutManager.model.shouldMoveupTable = false
            withAnimation(.easeInOut) {
                self.layoutManager.model.offsetForTable = 0
            }
        }
    }
    
    func setPickerOffsetIfNeeded() {
        let itemY = self.dataItem.pos.y
        let itemHeight = self.dataItem.rowHeight * self.layoutManager.scaleY
        
        let pickerHeight = TableViewLayout.pickerHeight
        let rectBottom = self.layoutManager.rect.maxY
        
        let ItemDisToBottom = rectBottom - (itemY + itemHeight * 1.5)

        let gap = ItemDisToBottom - pickerHeight
        print(gap)
        guard gap < 0 else {
            self.layoutManager.model.shouldMoveupTable = false
            self.layoutManager.model.offsetForTable = 0
            return
        }
        self.layoutManager.model.shouldMoveupTable = true
        withAnimation(.easeInOut) {
            self.layoutManager.model.offsetForTable = gap
        }
    }
}

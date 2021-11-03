import SwiftUI

struct ItemView: View {
    let rowIndex: Int
    let columnIndex: Int
    
    @EnvironmentObject var layoutManager: TableLayoutManager
    @Environment(\.backgroundColor) var backgroundColor
    
    init(rowIndex: Int, columnIndex: Int) {
        self.rowIndex = rowIndex
        self.columnIndex = columnIndex
    }
    
    var body: some View {
        Group {
            if self.layoutManager.layoutData != nil, rowIndex < self.layoutManager.numberOfRows(), columnIndex < self.layoutManager.numberOfColumns() {
                makeBody(layoutData: self.layoutManager.layoutData!)
            } else {
                EmptyView()
            }
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
        
        let imageWidth = min(min(contentWidth, contentHeight), 45 * self.layoutManager.scaleX)
        let imageHeight = min(min(contentWidth, contentHeight), 45 * self.layoutManager.scaleY)
        
        let tapGesture = TapGesture()
            .onEnded { _ in
                guard rowIndex >= 0, !isHeader else {
                    return
                }
                
                let selectedIndex = rowIndex - (self.layoutManager.model.hasHeader ? 1 : 0)
                if self.layoutManager.isEditing {
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
        
        return VStack(alignment: .leading, spacing: 0) {
            Group {
                switch dataItem.value {
                case .image(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: imageWidth, height: imageHeight, alignment: .center)
                        .padding(self.paddingForImage(textAlignment: dataItem.textAlignment, value: contentWidth - imageWidth))
                        .foregroundColor(foregroundColor)
                case .text(let value):
                    let font = dataItem.font ?? TableViewLayout.defaultFont(isHeader)
                    let fontSize: CGFloat = UIFont.preferredFont(from: font).pointSize * self.layoutManager.scaleX
                    let finalFont = Font(UIFont.preferredFont(from: font).withSize(fontSize))
                    Text(value)
                        .font(finalFont)
                        .foregroundColor(foregroundColor)
                        .lineLimit(dataItem.lineLimit)
                        .multilineTextAlignment(dataItem.textAlignment)
                        .frame(width: contentWidth, alignment: dataItem.textAlignment.toTextFrameAlignment())
                }
            }
            
            Spacer(minLength: 0)
        }
        .padding(contentInset)
        .frame(width: cellWidth, height: cellHeight)
        .background(self.backgroundColor)
        .gesture(tapGesture)
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

import SwiftUI

struct ItemView: View {
    let dataItem: DataTableItem
    
    var dropVerticalShadow: Bool = false
    
    @EnvironmentObject var layoutManager: TableLayoutManager
    @EnvironmentObject var dataManager: TableDataManager
    @Environment(\.backgroundColor) var backgroundColor

    let isHeader: Bool
    let index: (Int, Int)
    
    init(_ dataItem: DataTableItem, _ index: (Int, Int), _ isHeader: Bool = false, dropShadow: Bool) {
        self.dataItem = dataItem
        self.index = index
        self.isHeader = isHeader
        self.dropVerticalShadow = dropShadow
    }
    
    var body: some View {
        makeBody()
    }
    
    func makeBody() -> some View {
        let contentInset = TableViewLayout.contentInset(sizeClass: self.layoutManager.sizeClass)
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
                        image
                            .frame(width: 45 * self.layoutManager.scaleX, height: 45 * self.layoutManager.scaleY)
                    case .text(let value):
                        let fontSize: CGFloat = self.isHeader ? UIFont.preferredFont(from: .subheadline).pointSize : UIFont.preferredFont(from: .body).pointSize
                        let font: Font = isHeader ? .subheadline : .body
                        let textColor: Color = self.isHeader ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.primaryLabel)
                        Text(value)
                            .font(.system(size: fontSize * self.layoutManager.scaleX))
                            .foregroundColor(textColor)
                            .lineLimit(self.dataItem.lineLimit)
                            .multilineTextAlignment(dataItem.textAlignment)
                            .frame(width: dataItem.size.width * self.layoutManager.scaleX, height: dataItem.rowHeight * self.layoutManager.scaleY, alignment: dataItem.textAlignment.toTextFrameAlignment())
                    }
                }
                
                if index == (0, 0) && self.layoutManager.model.isFirstColumnSticky {
                    let offsetX: CGFloat = self.dataItem.size.width / 2 + contentInset
                    verticalDivider(offsetX: offsetX)
                }
            }
            .background(self.backgroundColor.frame(width: (self.dataItem.size.width + contentInset * 2) * self.layoutManager.scaleX, height: self.dataItem.rowHeight * self.layoutManager.scaleY))
            .gesture(tapGesture)
    }
    
    func verticalDivider(offsetX: CGFloat) -> some View {
        HStack {
            Divider()
                .frame(height: self.layoutManager.actualTableViewSize.height * self.layoutManager.scaleY)
                .offset(x: offsetX * self.layoutManager.scaleX, y: (self.layoutManager.actualTableViewSize.height - self.dataItem.rowHeight) / 2 * self.layoutManager.scaleY)
                .dropShadow(isVertical: true, show: self.dropVerticalShadow)
        }
    }
}

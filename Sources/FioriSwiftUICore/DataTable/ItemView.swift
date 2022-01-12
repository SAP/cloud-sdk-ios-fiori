import SwiftUI

/// DataTable Item View for specific rowIndex and columnIndex
struct ItemView: View {
    let rowIndex: Int
    let columnIndex: Int
    
    @EnvironmentObject var layoutManager: TableLayoutManager
    
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
    
    func topAlignmentView(dataItem: DataTableItem, imageWidth: CGFloat, imageHeight: CGFloat, contentWidth: CGFloat, font: Font, foregroundColor: Color?) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            switch dataItem.value {
            case .image(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth, height: imageHeight, alignment: .center)
                    .padding(self.paddingForImage(textAlignment: dataItem.textAlignment, value: contentWidth - imageWidth))
                    .foregroundColor(foregroundColor)
            case .text(let value):
                Text(value)
                    .font(font)
                    .foregroundColor(foregroundColor)
                    .lineLimit(dataItem.lineLimit)
                    .multilineTextAlignment(dataItem.textAlignment)
                    .frame(width: contentWidth, alignment: dataItem.textAlignment.toTextFrameAlignment())
            }
            
            Spacer(minLength: 0)
        }
    }
    
    func baselineAlignmentView(dataItem: DataTableItem, baselineHeightOffset: CGFloat, imageWidth: CGFloat, imageHeight: CGFloat, contentWidth: CGFloat, font: Font, foregroundColor: Color?) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            switch dataItem.value {
            case .image(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth, height: imageHeight, alignment: .center)
                    .padding(self.paddingForImage(textAlignment: dataItem.textAlignment, value: contentWidth - imageWidth))
                    .foregroundColor(foregroundColor)
                
            case .text(let value):
                Spacer().frame(height: baselineHeightOffset)
                
                Text(value)
                    .font(font)
                    .foregroundColor(foregroundColor)
                    .lineLimit(dataItem.lineLimit)
                    .multilineTextAlignment(dataItem.textAlignment)
                    .frame(width: contentWidth, alignment: dataItem.textAlignment.toTextFrameAlignment())
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
        let rowAlignment = self.layoutManager.model.rowAlignment
        let imageWidth = min(min(contentWidth, contentHeight), 45 * self.layoutManager.scaleX)
        let imageHeight = min(min(contentWidth, contentHeight), 45 * self.layoutManager.scaleY)
        
        var uifont: UIFont
        if let tmpUIFont = dataItem.uifont {
            uifont = tmpUIFont
        } else if let _font = dataItem.font {
            uifont = UIFont.preferredFont(from: _font)
        } else {
            uifont = TableViewLayout.defaultUIFont(isHeader)
        }
        let fontSize: CGFloat = uifont.pointSize * self.layoutManager.scaleX
        let finalFont = Font(uifont.withSize(fontSize))
        
        let tapGesture = TapGesture()
            .onEnded { _ in
                guard rowIndex >= 0, !isHeader else {
                    return
                }
                
                let selectedIndex = rowIndex - (self.layoutManager.model.hasHeader ? 1 : 0)
                if self.layoutManager.model.isEditing {
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
        
        return Group {
            if rowAlignment == .top {
                topAlignmentView(dataItem: dataItem, imageWidth: imageWidth, imageHeight: imageHeight, contentWidth: contentWidth, font: finalFont, foregroundColor: foregroundColor)
            } else {
                baselineAlignmentView(dataItem: dataItem, baselineHeightOffset: baselineHeightOffset, imageWidth: imageWidth, imageHeight: imageHeight, contentWidth: contentWidth, font: finalFont, foregroundColor: foregroundColor)
            }
        }
        .padding(contentInset)
        .frame(width: cellWidth, height: cellHeight)
        .background(self.layoutManager.model.backgroundColor)
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

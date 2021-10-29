import Foundation
import SwiftUI

struct GridTableView: View {
    @Environment(\.layoutDirection) var layoutDirection
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.sizeCategory) var sizeCategory
    
    @ObservedObject var layoutManager: TableLayoutManager
    @Environment(\.backgroundColor) var backgroundColor
    
    @State var lastScaleX: CGFloat = 1.0
    @State var lastScaleY: CGFloat = 1.0
    @State var lastCenterPosition: CGPoint? = nil
    @State var dropVerticalShadow: Bool = false
    @State var dropHorizontalShadow: Bool = false
    
    init(layoutManager: TableLayoutManager) {
        self.layoutManager = layoutManager
        if let centerPos = self.layoutManager.centerPosition {
            self.lastCenterPosition = centerPos
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let bundle = Bundle.module
        let tableName = "FioriSwiftUICore"
        
        if self.horizontalSizeClass != self.layoutManager.sizeClass {
            self.layoutManager.sizeClass = self.horizontalSizeClass ?? .compact
        }
        
        // trigger the layout if it has been changed
        if self.sizeCategory != self.sizeCategory {
            self.layoutManager.sizeCategory = self.sizeCategory
        }
        
        // it only layouts when necessary
        if self.layoutManager.layout(size: rect.size) {
            if self.lastScaleX.distance(to: 1.0) > 0.001 || self.lastScaleY.distance(to: 1.0) > 0.001 || self.lastCenterPosition != nil || self.dropVerticalShadow != false || self.dropHorizontalShadow != false {
                DispatchQueue.main.async {
                    lastScaleX = 1.0
                    lastScaleY = 1.0
                    lastCenterPosition = nil
                    dropVerticalShadow = false
                    dropHorizontalShadow = false
                }
            }
        }
        
        return Group {
            if layoutManager.layoutData == nil {
                if #available(iOS 14.0, *) {
                    ProgressView().progressViewStyle(CircularProgressViewStyle())
                } else {
                    // Fallback on earlier versions
                    Text("Loading...", tableName: tableName, bundle: bundle)
                }
            } else if self.layoutManager.layoutData != nil, self.layoutManager.numberOfRows() > 0, self.layoutManager.numberOfColumns() > 0, rect.size.width > 1, rect.size.height > 1 {
                makeGridBody(layoutData: self.layoutManager.layoutData!, rect: rect)
            } else {
                EmptyView()
            }
        }
        .frame(width: rect.size.width, height: rect.size.height)
        .background(self.backgroundColor)
    }
    
    func makeGridBody(layoutData: LayoutData, rect: CGRect) -> some View {
        let size = rect.size
        
        let drag = DragGesture()
            .onChanged { value in
                var tmpLastCenterPosition: CGPoint
                if let tmpPosition = self.lastCenterPosition {
                    tmpLastCenterPosition = tmpPosition
                } else {
                    tmpLastCenterPosition = self.layoutManager.centerPosition(size: size)
                    self.lastCenterPosition = tmpLastCenterPosition
                }
                
                let wUnit = self.layoutManager.widthPointInUnit(size: size)
                let tmpX = self.layoutDirection == .leftToRight ? (tmpLastCenterPosition.x - wUnit * value.translation.width) : (tmpLastCenterPosition.x + wUnit * value.translation.width)
                let tmpY = tmpLastCenterPosition.y - self.layoutManager.heightPointInUnit(size: size) * value.translation.height
                let tmpXY = self.layoutManager.validCenterPosition(pt: CGPoint(x: tmpX, y: tmpY), size: size)
                self.layoutManager.centerPosition = tmpXY
                
                self.dropVerticalShadow = self.layoutManager.startPosition(size: size).x != 0
                self.dropHorizontalShadow = self.layoutManager.startPosition(size: size).y != 0
            }
            .onEnded { _ in
                self.lastCenterPosition = self.layoutManager.centerPosition(size: size)
                self.layoutManager.model.centerPosition = self.lastCenterPosition
            }
        
        // zoom in & out
        let mag = MagnificationGesture()
            .onChanged { value in
                guard self.layoutManager.isPinchZoomEnable else {
                    return
                }
                
                let columnWidth = layoutData.columnWidths.reduce(0, +)
                let totalWidth = layoutData.leadingAccessoryViewWidth + layoutData.trailingAccessoryViewWidth + columnWidth
                let minScale = min(1, self.layoutManager.size.width / totalWidth)
                self.layoutManager.scaleX = max(minScale, self.lastScaleX * value.magnitude)
                self.layoutManager.scaleY = max(minScale, self.lastScaleY * value.magnitude)
                self.layoutManager.centerPosition = self.layoutManager.centerPosition(size: size)
                
                self.dropVerticalShadow = self.layoutManager.startPosition(size: size).x != 0
                self.dropHorizontalShadow = self.layoutManager.startPosition(size: size).y != 0
            }
            .onEnded { _ in
                self.lastScaleX = self.layoutManager.scaleX
                self.lastScaleY = self.layoutManager.scaleY
            }
        
        let allItems = layoutData.allDataItems
        let (indexOfRows, indexOfColumns) = self.layoutManager.visibleRowAndColumnIndexes()
        let numbOfColumns = self.layoutManager.numberOfColumns()
        
        let tmpScaleX = self.layoutManager.scaleX(size: size)
        let tmpScaleY = self.layoutManager.scaleY(size: size)
        let tmpStartPosition = self.layoutManager.startPosition(size: size)
        let wUnit = self.layoutManager.widthPointInUnit(size: size)
        let hUnit = self.layoutManager.heightPointInUnit(size: size)
        
        let startPosX = tmpStartPosition.x / wUnit
        let startPosY = tmpStartPosition.y / hUnit
        let leadingAccessoryViewWidth = layoutData.leadingAccessoryViewWidth
        
        return ZStack {
            // all visible rows
            ForEach(0 ..< indexOfRows.count, id: \.self) { i in
                let rowIndex = indexOfRows[i]
                let y: CGFloat = allItems[rowIndex][0].pos.y * tmpScaleY - (self.layoutManager.model.isHeaderSticky && rowIndex == 0 ? 0 : startPosY)
                
                // all visible columns
                ForEach(0 ..< indexOfColumns.count, id: \.self) { j in
                    let columnIndex = indexOfColumns[j]
                    let currentItem = allItems[rowIndex][columnIndex]
                    let x = (leadingAccessoryViewWidth + currentItem.pos.x) * tmpScaleX - (self.layoutManager.model.isFirstColumnSticky && columnIndex == 0 ? 0 : startPosX)
                    let zIndex = Double(rowIndex == 0 ? (columnIndex == 0 ? 550 : 500) : (columnIndex == 0 ? 200 : 100))
                    
                    // cell
                    ItemView(rowIndex: rowIndex, columnIndex: columnIndex)
                        .position(x: x, y: y)
                        .zIndex(zIndex)
                }
               
                // row leading accessory view
                LeadingAccessoryView(rowIndex: rowIndex)
                    .position(x: leadingAccessoryViewWidth * tmpScaleX / 2, y: y)
                    .zIndex(rowIndex == 0 ? 550 : 300)
                
                // row trailing accesory view
                TrailingAccessoryView(rowIndex: rowIndex)
                    .position(x: rect.maxX - layoutData.trailingAccessoryViewWidth * tmpScaleX / 2, y: y)
                    .zIndex(rowIndex == 0 ? 560 : 300)
                
                // row separators
                Rectangle()
                    .fill(Color.preferredColor(.separator))
                    .frame(width: rect.size.width, height: 1)
                    .position(x: rect.size.width / 2,
                              y: y + layoutData.rowHeights[rowIndex] * tmpScaleY / 2)
                    .dropShadow(isVertical: false, show: rowIndex == 0 && self.dropHorizontalShadow)
                    .zIndex(rowIndex == 0 ? 750 : 450)
            }
            
            // first column separator
            if numbOfColumns > 1 {
                let x = (leadingAccessoryViewWidth + allItems[0][0].pos.x + layoutData.columnWidths[0] / 2) * tmpScaleX - (self.layoutManager.model.isFirstColumnSticky ? 0 : startPosX)
                let height = ((allItems.last?.first?.pos.y ?? 0) + (layoutData.rowHeights.last ?? 0) / 2) * tmpScaleY - startPosY
                
                Rectangle()
                    .fill(Color.preferredColor(.separator))
                    .frame(width: 1, height: height)
                    .position(x: x, y: height / 2)
                    .dropShadow(isVertical: true, show: self.dropVerticalShadow)
                    .zIndex(700)
            }
        }
        .frame(width: size.width, height: size.height)
        .background(self.backgroundColor)
        .gesture(drag)
        .gesture(mag)
    }
}

import Foundation
import SwiftUI

struct GridTableView: View {
    @Environment(\.layoutDirection) var layoutDirection
    
    @EnvironmentObject var layoutManager: TableLayoutManager
    
    @State var lastScaleX: CGFloat = 1.0
    @State var lastScaleY: CGFloat = 1.0
    @State var lastCenterPosition: CGPoint? = nil
        
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let items: [[TableDataItem]] = self.layoutManager.dataItemsForTable(rect: rect)
        
        let drag = DragGesture()
            .onChanged { value in
                let scaleX = self.layoutManager.scaleX(rect: rect)
                let scaleY = self.layoutManager.scaleY(rect: rect)
                
                var tmpLastCenterPosition: CGPoint
                if let tmpPosition = self.lastCenterPosition {
                    tmpLastCenterPosition = tmpPosition
                } else {
                    tmpLastCenterPosition = self.layoutManager.centerPosition(rect: rect)
                    self.lastCenterPosition = tmpLastCenterPosition
                }
                
                let tmpX = self.layoutDirection == .leftToRight ? (tmpLastCenterPosition.x * scaleX * rect.size.width - value.translation.width) / (scaleX * rect.size.width) : (tmpLastCenterPosition.x * scaleX * rect.size.width + value.translation.width) / (scaleX * rect.size.width)
                let x = max(0.5 / scaleX, min(1 - 0.5 / scaleX, tmpX))
                
                let tmpY = (tmpLastCenterPosition.y * scaleY * rect.size.height - value.translation.height) / (scaleY * rect.size.height)
                let y = max(0.5 / scaleY, min(1 - 0.5 / scaleY, tmpY))
                
                self.layoutManager.centerPosition = CGPoint(x: x, y: y)
            }
            .onEnded { _ in
                self.lastCenterPosition = self.layoutManager.centerPosition(rect: rect)
            }
        
        // zoom in & out
        let mag = MagnificationGesture()
            .onChanged { value in
                self.layoutManager.scaleX = max(0.5, self.lastScaleX * value.magnitude)
                self.layoutManager.scaleY = max(0.5, self.lastScaleY * value.magnitude)

                self.layoutManager.centerPosition = self.layoutManager.centerPosition(rect: rect)
            }
            .onEnded { _ in
                self.lastScaleX = self.layoutManager.scaleX
                self.lastScaleY = self.layoutManager.scaleY
            }

        return
            ZStack {
//                BackgroundForRow(model: self.model, rowHeight: items.first?.first?.rowHeight ?? 0, index: 0)
//                    .zIndex(500)
                if let firstItem = items.first?.first {
                    let lineHeight = UIScreen.main.bounds.height
                    HStack {
                        Divider()
                            .frame(height: lineHeight)
                            .offset(y: lineHeight / 2)
                            .position(x: firstItem.pos.x + firstItem.size.width)
                    }
                }
                
                ForEach(0 ..< items.count, id: \.self) { i in
                    
                    let isHeader: Bool = i == 0
                    
                    ForEach(0 ..< items[i].count, id: \.self) { j in
                        let currentItem = items[i][j]
                        let view = ItemView(currentItem, self.layoutManager.scaleX, (i, j), isHeader)
                        view
                            .position(x: currentItem.pos.x, y: currentItem.pos.y)
                            .offset(x: currentItem.offset.x, y: currentItem.offset.y)
                            .zIndex(i == 0 ? Double(600 - j) : Double(500 - i - i * j))
                    }
                    
                    if let firstItem = items[i].first, let currentIndex = firstItem.index, currentIndex >= 0 {
                        Divider()
                            //                            .background(Color.red)
                            .frame(width: UIScreen.main.bounds.width)
                            .position(x: UIScreen.main.bounds.width / 2, y: firstItem.pos.y)
                            .offset(y: (firstItem.rowHeight / 2) * self.layoutManager.scaleY)
                        
                        let pos = CGPoint(x: rect.maxX, y: firstItem.pos.y)
                        
                        if let trailingItem = self.layoutManager.model.rowData[currentIndex].trailingAccessory {
                            TrailingAccessoryView(item: trailingItem)
                                .position(x: pos.x, y: pos.y)
                                .zIndex(499)
                        }

                        let leftPos = CGPoint(x: rect.minX, y: firstItem.pos.y)
                        
//                        let selected = self.layoutManager.model.selectedIndex.contains(currentIndex)

                        LeadingAccessoryView(items: self.layoutManager.model.rowData[currentIndex].leadingAccessories, index: currentIndex)
                            .position(x: leftPos.x, y: leftPos.y)
                            .zIndex(499)
                    }
                }
            }
            .gesture(drag)
            .gesture(mag)
    }
}

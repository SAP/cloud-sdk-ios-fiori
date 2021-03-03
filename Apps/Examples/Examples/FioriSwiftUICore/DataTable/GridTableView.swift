import Foundation
import SwiftUI

struct GridTableView: View {
    @EnvironmentObject var model: TableModel
    @Environment(\.tableContext) var tableContext
    
    @Environment(\.layoutDirection) var layoutDirection
    
    @State var lastScaleX: CGFloat = 1.0
    @State var lastScaleY: CGFloat = 1.0
    @State var lastCenterPosition: CGPoint? = nil
    
    //    @ObservedObject var itemControl: ItemStateControl = ItemStateControl()
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let items: [[TableDataItem]] = self.tableContext.dataItemsForTable(self.model, rect: rect)
        //        let linesPos: [(CGPoint, CGPoint)] = self.tableContext.getPosForSeperationLines(self.model, rect: rect)
        
        let drag = DragGesture()
            .onChanged { value in
                let scaleX = self.tableContext.scaleX(self.model, rect: rect)
                let scaleY = self.tableContext.scaleY(self.model, rect: rect)
                
                var tmpLastCenterPosition: CGPoint
                if let tmpPosition = self.lastCenterPosition {
                    tmpLastCenterPosition = tmpPosition
                } else {
                    tmpLastCenterPosition = self.tableContext.centerPosition(self.model, rect: rect)
                    self.lastCenterPosition = tmpLastCenterPosition
                }
                
                let tmpX = self.layoutDirection == .leftToRight ? (tmpLastCenterPosition.x * scaleX * rect.size.width - value.translation.width) / (scaleX * rect.size.width) : (tmpLastCenterPosition.x * scaleX * rect.size.width + value.translation.width) / (scaleX * rect.size.width)
                let x = max(0.5 / scaleX, min(1 - 0.5 / scaleX, tmpX))
                
                let tmpY = (tmpLastCenterPosition.y * scaleY * rect.size.height - value.translation.height) / (scaleY * rect.size.height)
                let y = max(0.5 / scaleY, min(1 - 0.5 / scaleY, tmpY))
                
                self.model.centerPosition = CGPoint(x: x, y: y)
            }
            .onEnded { _ in
                self.lastCenterPosition = self.tableContext.centerPosition(self.model, rect: rect)
            }
        
        // zoom in & out
//        let mag = MagnificationGesture()
//            .onChanged { value in
//                self.model.scaleX = max(1, self.lastScaleX * value.magnitude)
//                self.model.scaleY = max(1, self.lastScaleY * value.magnitude)
//
//                self.model.centerPosition = self.tableContext.centerPosition(self.model, rect: rect)
//            }
//            .onEnded { _ in
//                self.lastScaleX = self.model.scaleX
//                self.lastScaleY = self.model.scaleY
//            }
        
        return
            ZStack {
                BackgroundForRow(model: self.model, rowHeight: items.first?.first?.rowHeight ?? 0, index: 0)
                    .zIndex(500)
                ForEach(0 ..< items.count, id: \.self) { i in
                    let isHeader: Bool = i == 0
                    ForEach(0 ..< items[i].count, id: \.self) { j in
                        let currentItem = items[i][j]
                        let view = ItemView(currentItem, self.model.scaleX, self.model, (i, j), isHeader)
                        view
                            .position(x: currentItem.pos.x, y: currentItem.pos.y)
                            .offset(x: currentItem.offset.x, y: currentItem.offset.y)
                            .zIndex(i == 0 ? Double(600 - j) : Double(500 - i - i * j))
                    }
                    
                    if let firstItem = items[i].first {
                        Divider()
                            //                            .background(Color.red)
                            .frame(width: UIScreen.main.bounds.width)
                            .position(x: UIScreen.main.bounds.width / 2, y: firstItem.pos.y)
                            .offset(y: (firstItem.rowHeight / 2) * self.model.scaleY)
                        
                        let pos = CGPoint(x: rect.maxX, y: firstItem.pos.y)
                        let action = {
                            print("\(i)")
                        }
                        RightAccessoryView(pos: pos, action: action)
                            .zIndex(499)
                        
//                        let leftPos: CGPoint = CGPoint(x: rect.minX, y: firstItem.pos.y)
//                        LeftAccessoryView(leftPos)
//                            .zIndex(499)
                    }
                }
            }
            .gesture(drag)
//            .gesture(mag)
    }
    
    //    func linePosForHeader(rect: CGRect) -> (CGPoint, CGPoint) {
    //        let rowHeight = self.tableContext.heightForRowAt(self.model, 0)
    //        return (CGPoint(x: 0, y: rowHeight / 2), CGPoint(x: rect.maxX, y: rowHeight / 2))
    //    }
    //
    //    func adjustStartPosition(in rect: CGRect) {
    //        let tmpStartPosition = self.tableContext.startPosition(self.model, rect: rect)
    //        let tmpCenterPosition = self.tableContext.centerPosition(self.model, rect: rect)
    //
    //        let tmpY = self.tableContext.snapTableToPoint(self.model, at: tmpStartPosition.y)
    //        let tmpScaleY = self.tableContext.scaleY(self.model, rect: rect)
    //        let y = max(0.5 / tmpScaleY, min(1 - 0.5 / tmpScaleY, tmpY + 0.5 / tmpScaleY))
    //
    //        self.model.centerPosition = CGPoint(x: tmpCenterPosition.x, y: y)
    //        let tmpX = self.tableContext.snapTableToPoint(self.model, at: tmpStartPosition.x)
    //        let tmpScaleX = self.tableContext.scaleX(self.model, rect: rect)
    //        let x = max(0.5 / tmpScaleX, min(1 - 0.5 / tmpScaleX, tmpX + 0.5 / tmpScaleX))
    //
    //        self.model.centerPosition = CGPoint(x: x, y: tmpCenterPosition.y)
    //    }
}

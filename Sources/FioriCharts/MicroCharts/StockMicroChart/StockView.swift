//
//  StockView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/18/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}

struct StockView: View {
    @EnvironmentObject var model: ChartModel
    
    let textColor = Color(#colorLiteral(red: 0.4376021028, green: 0.4471841455, blue: 0.4600644708, alpha: 1))
    
    //
    @State var closestPoint:CGPoint = .zero
    @State var closestDataIndex:Int = 0
    @State var showIndicator = false
    @State var draggingStockView = false
    @State var position = CGPoint.zero
    
    @GestureState var dragState = DragState.inactive
    //@GestureState var position = CGPoint.zero
    
    var body: some View {
        GeometryReader { geometry in
            self.chartView(in: geometry.frame(in: .local))
        }
    }
    
    func chartView(in rect: CGRect) -> some View {
        let xAxisHeight:CGFloat = 24
        let yAxisWidth:CGFloat = 40
        
        let width = rect.size.width - yAxisWidth
        let height = rect.size.height - xAxisHeight
        let linesRect = CGRect(x: yAxisWidth, y: 0, width: width, height: height)
        
        let pan = LongPressGesture(minimumDuration: 0.5)
            .sequenced(before: DragGesture())
//            .updating($dragState, body: { (value, state, transaction) in
//                switch value {
//                case .first(true):
//                    state = .pressing
//                    DispatchQueue.global().async {
//                        self.showIndicator = true
//                        self.closestPoint = self.calClosestDataPoint(toPoint: value.location, rect: linesRect)
//                    }
//                default:
//                    break
//                }
//
//            })
            .onChanged({ value in
                switch value {
                case .second(true, let drag):
                    if let value = drag {
                        self.showIndicator = true
                        //print("indicator pos: \(value.location)")
                        self.closestPoint = self.calClosestDataPoint(toPoint: value.location, rect: linesRect)
                    }
                default:
                    break
                }
            })
            .onEnded({ _ in
                self.showIndicator = false
            })
        
        let drag = DragGesture()
            .onChanged({ value in
                let total = StockUtility.numOfDataItmes(self.model)
                let count = self.model.lastDisplayEndIndex - self.model.lastDisplayStartIndex + 1
                
                if total == count {
                    self.showIndicator = true
                    self.closestPoint = self.calClosestDataPoint(toPoint: value.location, rect: linesRect)
                    return
                }
                
                if self.position == .zero {
                    self.position = value.location
                }
                
                self.draggingStockView = true
                
                //var delta = Int((self.position.x - value.location.x) * CGFloat(count) / rect.size.width)
                var delta = -Int(value.translation.width * CGFloat(count) / rect.size.width)
                if delta > 0 && delta + self.model.lastDisplayEndIndex >= total {
                    delta = total - self.model.lastDisplayEndIndex - 1
                }
                else if delta < 0 && delta + self.model.lastDisplayStartIndex < 0 {
                    delta = -self.model.lastDisplayStartIndex
                }
                
                self.model.displayStartIndex = self.model.lastDisplayStartIndex + delta
                self.model.displayEndIndex = self.model.lastDisplayEndIndex + delta

            })
            .onEnded({ value in
                self.showIndicator = false
                self.position = .zero
                self.draggingStockView = false
                
                // update them
                self.model.lastDisplayEndIndex = self.model.displayEndIndex
                self.model.lastDisplayStartIndex = self.model.displayStartIndex
            })
        //.exclusively(before: pan)
        
        let mag = MagnificationGesture()
            .onChanged({ value in
                self.showIndicator = false
                
                // clamp the ratio of zoom in & zoom out
                if value.magnitude > 0 {
                    let mid = (self.model.lastDisplayStartIndex + self.model.lastDisplayEndIndex) / 2
                    let count = StockUtility.numOfDataItmes(self.model)
                    let range = self.model.lastDisplayEndIndex - self.model.lastDisplayStartIndex + 1
                    var scaledRange = Int(CGFloat(range) / (value.magnitude * 2))
                    if scaledRange < 2 {
                        scaledRange = 2
                    }
                    
                    if mid - scaledRange < 0 {
                        let leftDelta = mid
                        self.model.displayStartIndex = 0
                        let rightDelta = scaledRange * 2 - leftDelta
                        self.model.displayEndIndex = min(self.model.lastDisplayEndIndex + rightDelta, count - 1)
                    }
                    else if mid + scaledRange >= count {
                        self.model.displayEndIndex = count - 1
                        let leftDelta = scaledRange * 2 - (count - mid - 1)
                        self.model.displayStartIndex = max(0, mid - leftDelta)
                    }
                    else {
                        self.model.displayStartIndex = mid - scaledRange
                        self.model.displayEndIndex = mid + scaledRange
                    }
                }
            })
            .onEnded({ value in
                self.model.lastDisplayEndIndex = self.model.displayEndIndex
                self.model.lastDisplayStartIndex = self.model.displayStartIndex
            })
            .exclusively(before: drag)
        //.exclusively(before: pan)
        
        return ZStack {
            if model.userInteractionEnabled {
                StockLinesView(rect: linesRect)
                    .offset(x: linesRect.origin.x/2, y: -xAxisHeight/2)
                    .opacity(draggingStockView ? 0.4 : 1.0)
                    .gesture(pan)
                    .gesture(drag)
                    .gesture(mag)
            }
            else {
                StockLinesView(rect: linesRect)
                    .offset(x: linesRect.origin.x/2, y: -xAxisHeight/2)
            }
            
            XAxisView(rect: CGRect(x: yAxisWidth, y: rect.size.height - xAxisHeight, width: width, height: xAxisHeight))
            
            YAxisView(rect: CGRect(x:0, y: 0, width: yAxisWidth, height: height), chartWidth: linesRect.size.width)
            
            if self.showIndicator && closestDataIndex >= 0 {
                StockIndicatorView(rect: linesRect, closestPoint: $closestPoint, closestDataIndex: $closestDataIndex)
            }
        }
    }
    
    func calClosestDataPoint(toPoint: CGPoint, rect: CGRect) -> CGPoint {
        let count = model.displayEndIndex - model.displayStartIndex + 1
        let minVal = CGFloat(model.ranges?[model.currentSeriesIndex].lowerBound ?? 0)
        let maxVal = CGFloat(model.ranges?[model.currentSeriesIndex].upperBound ?? 0)
        let stepWidth = rect.size.width / CGFloat(count - 1)
        
        var index = Int(0.5 + floor(toPoint.x - rect.origin.x) / stepWidth) + model.displayStartIndex
        //print("before index = \(index), startIndex = \(model.displayStartIndex), endIndex = \(model.displayEndIndex)")
        if model.displayStartIndex > StockUtility.lastValidDimIndex(model) {
            self.closestDataIndex = -1
            return .zero
        }
        
        if index < model.displayStartIndex {
            index = model.displayStartIndex
        }
        else if index >= StockUtility.lastValidDimIndex(model) {
            index = StockUtility.lastValidDimIndex(model)
        }
        self.closestDataIndex = index
        //print("after: index = \(index)")
        
        let currentData = StockUtility.dimensionValue(model, categoryIndex: index)
        let x = CGFloat(index - model.displayStartIndex) * stepWidth + rect.origin.x
        let y = rect.size.height - (CGFloat(currentData ?? 0) - minVal) * rect.size.height / (maxVal - minVal) + rect.origin.y
        
        return CGPoint(x: x, y: y)
    }
}


struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Tests.stockModels) {
            StockView().environmentObject(StockUtility.preprocessModel($0))
        }
        .frame(width:300, height: 200, alignment: .topLeading)
        .previewLayout(.sizeThatFits)
    }
}

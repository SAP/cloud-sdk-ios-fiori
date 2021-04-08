import SwiftUI

struct DonutChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.size)
        }
    }
    
    func makeBody(in size: CGSize) -> some View {
        let diameter = max(min(size.width, size.height), 1)
        // 1pt gap -> degree of gap between segments
        let GAP: CGFloat = 360.0 / (diameter * CGFloat.pi)
        
        // depth
        let depth: CGFloat = diameter * 63.0 / 336.0
        
        var segments: [ChartPlotRectData] = []
        let seriesCount = self.model.numOfSeries()
        
        var values: [CGFloat] = Array(repeating: 0, count: seriesCount)
        let totalDegree: CGFloat = seriesCount > 1 ? 360 - CGFloat(seriesCount) * GAP : 360
        var totalValue: CGFloat = 0
        var startAngle: CGFloat = 0
        var endAngle: CGFloat = 0
        
        if seriesCount > 0 {
            for seriesIndex in 0 ..< seriesCount {
                let tmpValue = CGFloat(model.plotItemValue(at: seriesIndex, category: 0, dimension: 0) ?? 0)
                values[seriesIndex] = tmpValue < 0 ? 0 : tmpValue
                totalValue += values[seriesIndex]
            }
            
            for seriesIndex in 0 ..< seriesCount {
                endAngle = totalValue == 0 ? 0 : startAngle + values[seriesIndex] * totalDegree / totalValue

                segments.append(ChartPlotRectData(seriesIndex: seriesIndex,
                                                  categoryIndex: 0,
                                                  value: CGFloat(values[seriesIndex]),
                                                  x: 0,
                                                  y: 0,
                                                  width: startAngle,
                                                  height: endAngle))
                startAngle = totalValue == 0 ? 0 : endAngle + GAP
            }
        }
        
        return HStack(alignment: .center) {
            Spacer(minLength: 0)
            
            ZStack {
                ForEach(0 ..< segments.count, id: \.self) { index in
                    ArcShape(startAngle: Angle(degrees: Double(segments[index].rect.size.width)),
                             endAngle: Angle(degrees: Double(segments[index].rect.size.height)),
                             insetAmount: depth / 2)
                        .stroke(lineWidth: depth)
                        .fill(self.model.colorAt(seriesIndex: segments[index].seriesIndex, categoryIndex: 0))
                        .contentShape(ArcShape(startAngle: Angle(degrees: Double(segments[index].rect.size.width)),
                                               endAngle: Angle(degrees: Double(segments[index].rect.size.height)),
                                               insetAmount: depth / 2)
                                .stroke(lineWidth: depth))
                        .frame(width: diameter, height: diameter)
                        .opacity(self.displayState(for: segments[index].seriesIndex) ? 1 : 0.25)
                        .ifApply(self.model.userInteractionEnabled) {
                            $0.onTapGesture {
                                self.updateSelectedState(for: segments[index].seriesIndex)
                            }
                        }
                }
            }.contentShape(Rectangle())
            
            Spacer(minLength: 0)
        }.frame(width: size.width, height: size.height)
    }
    
    func displayState(for seriesIndex: Int) -> Bool {
        if let selections = model.selections {
            if selections[seriesIndex] != nil {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
    
    func updateSelectedState(for seriesIndex: Int) {
        switch self.model.selectionMode {
        case .single:
            if self.model.selections?[seriesIndex] != nil {
                self.model.selections = nil
            } else {
                self.model.selections = [seriesIndex: [0]]
            }
        case .all:
            if self.model.selections != nil {
                self.model.selections = nil
            } else {
                let seriesCount = self.model.numOfSeries()
                var tmpSelections = [Int: [Int]]()
                for i in 0 ..< seriesCount {
                    tmpSelections[i] = [0]
                }
                
                self.model.selections = tmpSelections
            }
        case .multiple:
            if let selections = model.selections {
                var tmpSelections = selections
                // selected
                if selections[seriesIndex] != nil {
                    tmpSelections[seriesIndex] = nil
                } else {
                    tmpSelections[seriesIndex] = [0]
                }
                
                if tmpSelections.isEmpty {
                    self.model.selections = nil
                } else {
                    self.model.selections = tmpSelections
                }
            } else {
                self.model.selections = [seriesIndex: [0]]
            }
        }
    }
}

struct DonutChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.donutModels) {
                DonutChart(model: $0)
                    .frame(width: 200, height: 200)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}

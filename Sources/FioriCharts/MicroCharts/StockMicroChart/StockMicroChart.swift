//
//  StockMicroChart.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/18/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

public struct StockMicroChart: View {
    @ObservedObject var model: StockMicroChartModel
    
    public init(_ model: StockMicroChartModel) {
        self.model = model
        self.model.displayEndIndex = StockUtility.calNumOfDataItmesInDayMode(model) - 1
        self.model.lastDisplayEndIndex = self.model.displayEndIndex
    }
    
    public var body: some View {
        return GeometryReader { geometry in
            if self.model.data.count > 0 && self.model.data.first!.count > 0 {
                VStack(alignment: .leading, spacing: 1){
                    HStack{
                        Text(self.model.name)
                            .font(.headline)
                        Spacer()
                        Text(String(format: "%.2f", self.model.data[0].last!.close))
                            .font(.headline)
                        
                        self.sharePriceChange()
                    }
                    
                    Text(self.model.priceUnit)
                        .font(.subheadline)
                        .foregroundColor(Color(#colorLiteral(red: 0.4376021028, green: 0.4471841455, blue: 0.4600644708, alpha: 1)))
                    
                    self.stockModes(in: geometry.size)
                        .padding(8)
                    
                    StockView().environmentObject(self.model)
                }
                .background(Color(#colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)))
            }
            else {
                Text("No Data")
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .border(Color.primary, width: 1)
            }
        }.padding(8)
    }
    
    func stockModes(in size: CGSize) -> some View {
        HStack(alignment: .center, spacing: 1) {
            ForEach(self.model.modes, id: \.self) { (mode) -> AnyView in
                let text = Text(mode)
                    .font(.footnote)
                    .foregroundColor(Color(#colorLiteral(red: 0.4376021028, green: 0.4471841455, blue: 0.4600644708, alpha: 1)))
                    .frame(width: (size.width / CGFloat(self.model.modes.count)) - 4)
                    .padding(.vertical, 4)
                    .onTapGesture {
                        self.model.curMode = self.model.modes.firstIndex(of: mode)!
                        self.model.displayStartIndex = 0
                        self.model.lastDisplayStartIndex = 0
                        self.model.displayEndIndex = StockUtility.calNumOfDataItmesInDayMode(self.model) - 1
                        self.model.lastDisplayEndIndex = self.model.displayEndIndex
                }
                
                if self.model.modes[self.model.curMode] == mode {
                    return AnyView(text
                        .border(Color.blue, width: 2)
                        .cornerRadius(4))
                }
                else {
                    return AnyView(text)
                }
            }
        }
    }
    
    
    func sharePriceChange() -> some View {
        let val = (self.model.data[0].last!.close - self.model.data[0].first!.close) * 100 / self.model.data[0].first!.close
        let color = val >= 0 ? Color.green : Color.red
        
        return Text(String(format: "%.1f%%", val))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color)
            .cornerRadius(4)
            .foregroundColor(Color.white)
    }
}

struct StockMicroChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(StockMicroChartModel.allCases) { data in
                StockMicroChart(data)
                    .frame(width:300, height: 260)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
    

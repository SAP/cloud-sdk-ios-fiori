//
//  StockMicroChart.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/18/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

public struct StockMicroChart: View {
    @ObservedObject var model: ChartModel
    
    public init(_ model: ChartModel) {
        self.model = model
    }
    
    public var body: some View {
        return GeometryReader { geometry in
            if self.model.data.count > 0 && self.model.data.first!.count > 0 {
                VStack{
                    StockView().environmentObject(self.model)
                }
                .padding(.top, 8)
                .padding(.trailing, 8)
                .background(Color(#colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)))
            }
            else {
                Text("No Data")
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .border(Color.primary, width: 1)
            }
        }
    }
}

struct StockMicroChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.stockModels) { data in
                StockMicroChart(data)
                    .frame(height: 260)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
    

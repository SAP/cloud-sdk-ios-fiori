//
//  DetailView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct DetailView: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        GeometryReader { geometry in
            if geometry.size.width <= geometry.size.height {
                VStack(alignment: .leading, spacing: 0) {
                    ChartView(self.model).padding()
                        .frame(height: geometry.size.width * 2 / 3)
                    
                    Divider().edgesIgnoringSafeArea(.all)
                    
                    Settings(model: self.model)
                }
            }
            else {
                HStack(spacing: 0) {
                    ChartView(self.model).padding()
                        .frame(width: geometry.size.width / 2)
                    
                    Divider().edgesIgnoringSafeArea(.all)

                    Settings(model: self.model)
                    
                }
            }
        }
        .navigationBarTitle("Detail", displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(model: Tests.stockModels[0])
    }
}

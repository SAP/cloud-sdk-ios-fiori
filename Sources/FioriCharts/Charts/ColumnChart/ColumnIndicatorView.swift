//
//  ColumnIndicatorView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/3/20.
//

import SwiftUI

struct ColumnIndicatorView: View {
    @ObservedObject var model: ChartModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutDirection) var layoutDirection
    
    init(_ model: ChartModel) {
        self.model = model
    }
    
    var body: some View {
        Text(" ")
    }
}

// swiftlint:disable force_cast
struct ColumnSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        let models: [ChartModel] = Tests.lineModels.map {
           let model = $0.copy() as! ChartModel
           model.chartType = .column
           return model
        }
        
        return Group {
            ForEach(models) {
                ColumnIndicatorView($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}

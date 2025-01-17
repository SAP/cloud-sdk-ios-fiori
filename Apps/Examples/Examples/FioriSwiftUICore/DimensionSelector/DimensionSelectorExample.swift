//
//  DimensionSelectorExample.swift
//  Examples
//
//  Created by Yang, Angie on 12/17/24.
//  Copyright © 2024 SAP. All rights reserved.
//
//
import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct DimensionSelectorExample: View {
    let segmentTitles = ["1min", "One day", "1year: 1day", "Three years: one week"]
    @State var selectedIndex: Int? = 0
    @ObservedObject var stockModel = Tests.stockModels[0]
    @State var customStyle: Bool = false
    
    var attributes: [ControlState: SegmentAttributes] = [
        .normal: SegmentAttributes(textColor: .teal, font: .subheadline, borderWidth: 0.33, borderColor: .teal, backgroundColor: .white),
        .selected: SegmentAttributes(textColor: .indigo, font: .body, borderWidth: 1.0, borderColor: .indigo, backgroundColor: .green),
        .disabled: SegmentAttributes(textColor: .gray, font: .subheadline, borderWidth: 0.33, borderColor: .gray, backgroundColor: Color.preferredColor(.tertiaryFill))
    ]

    var body: some View {
        VStack(alignment: .center) {
            SwitchView(title: "Custom Styling", isOn: self.$customStyle).padding()
            if self.customStyle {
                self.getDimensionSelector(attributes: self.attributes)
            } else {
                self.getDimensionSelector()
            }
            self.chartView
        }
    }
    
    func getDimensionSelector(attributes: [ControlState: SegmentAttributes]? = nil) -> some View {
        DimensionSelector(titles: self.segmentTitles, selectedIndex: self.$selectedIndex, segmentAttributes: attributes)
            .onChange(of: self.selectedIndex) {
                self.stockModel.indexOfStockSeries = self.selectedIndex ?? -1
            }
    }
    
    var chartView: some View {
        if self.selectedIndex != nil {
            return AnyView(ChartView(self.stockModel))
        } else {
            return AnyView(NoDataView())
        }
    }
}

private struct NoDataView: View {
    var body: some View {
        Text("No Data")
        Spacer()
    }
}

struct DimensionSelector_Test_Previews: PreviewProvider {
    static var previews: some View {
        DimensionSelectorExample()
    }
}

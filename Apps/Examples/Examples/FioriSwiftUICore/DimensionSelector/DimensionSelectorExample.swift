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

    var body: some View {
        VStack(alignment: .center) {
            SwitchView(title: "Custom Styling", isOn: self.$customStyle).padding()
            if self.customStyle {
                DimensionSelector(titles: self.segmentTitles, selectedIndex: self.$selectedIndex, segmentWidthMode: .equal, segment: { title in
                    let selectedTitle = self.selectedIndex != nil ? self.segmentTitles[self.selectedIndex!] : ""
                    DimensionSegment(title: AttributedString(title), isSelected: title == selectedTitle)
                        .dimensionSegmentStyle(CustomSegmentStyle())
                        
                })
                .onChange(of: self.selectedIndex) {
                    self.stockModel.indexOfStockSeries = self.selectedIndex ?? -1
                }
            } else {
                DimensionSelector(titles: self.segmentTitles, selectedIndex: self.$selectedIndex)
                    .onChange(of: self.selectedIndex) {
                        self.stockModel.indexOfStockSeries = self.selectedIndex ?? -1
                    }
            }
            self.chartView
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

struct CustomSegmentStyle: DimensionSegmentStyle {
    func makeBody(_ configuration: DimensionSegmentConfiguration) -> some View {
        DimensionSegment(configuration)
            .titleStyle(CustomTitleStyle(dimensionSegmentConfiguration: configuration))
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .inset(by: 1)
                    .stroke(configuration.isSelected ? Color.teal : Color.preferredColor(.tertiaryLabel), lineWidth: 2)
            )
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(configuration.isSelected ? Color.preferredColor(.accentBackground1) : Color.preferredColor(.secondaryGroupedBackground)))
    }
}

struct CustomTitleStyle: TitleStyle {
    let dimensionSegmentConfiguration: DimensionSegmentConfiguration
    func makeBody(_ configuration: TitleConfiguration) -> some View {
        Title(configuration)
            .font(.body)
            .foregroundStyle(self.dimensionSegmentConfiguration.isSelected ? Color.teal : Color.preferredColor(.tertiaryLabel))
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

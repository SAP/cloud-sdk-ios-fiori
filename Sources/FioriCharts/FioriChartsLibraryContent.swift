//
//  FioriChartsLibraryContent.swift
//  
//
//  Created by Eidinger, Marco on 6/25/20.
//

import Foundation
import SwiftUI

#if swift(>=5.3)
@available(iOS 14.0, *)
struct LibraryContent : LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(
            ChartView(ChartModel(chartType: .stock, data: [[16.52, 15.50, 18.67, 16.70, 16.90]], titlesForCategory: [["2020-01-06 10:00:00", "2020-01-06 10:30:00", "2020-01-06 11:00:00", "2020-01-06 11:30:00", "2020-01-06 12:00:00"]])),
            title: "Stock Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .line, data: [[200, 170, 165, 143, 166, 112, 110], [150, 120, 130, 135, 120, 138, 137]], titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]])),
            title: "Line Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .area, data: [[200, 170, 165, 143, 166, 112, 110], [150, 120, 130, 135, 120, 138, 137]], titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]], numericAxis: ChartNumericAxisAttributes(baseline: ChartBaselineAttributes(width: 1, dashPatternLength: 1, dashPatternGap: 0, isHidden: true, value: nil, position: nil), formatter: NumberFormatter(style: .currency), abbreviatedFormatter: NumberFormatter(style: .currency)), secondaryNumericAxis: ChartNumericAxisAttributes(baseline: ChartBaselineAttributes(width: 1, dashPatternLength: 1, dashPatternGap: 0, isHidden: true, value: nil, position: nil), formatter: NumberFormatter(style: .percent), abbreviatedFormatter: NumberFormatter(style: .percent)), indexesOfSecondaryValueAxis: [1])),
            title: "Area Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .column, data: [[200, 170, 165, 143, 166, 112, 110], [150, 120, 130, 135, 120, 138, 137]], titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]], numericAxis: ChartNumericAxisAttributes(baseline: ChartBaselineAttributes(width: 1, dashPatternLength: 1, dashPatternGap: 0, isHidden: true, value: nil, position: nil), formatter: NumberFormatter(style: .currency), abbreviatedFormatter: NumberFormatter(style: .currency)), secondaryNumericAxis: ChartNumericAxisAttributes(baseline: ChartBaselineAttributes(width: 1, dashPatternLength: 1, dashPatternGap: 0, isHidden: true, value: nil, position: nil), formatter: NumberFormatter(style: .percent), abbreviatedFormatter: NumberFormatter(style: .percent)), indexesOfSecondaryValueAxis: [1])),
            title: "Column Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .stackedColumn, data: [[200, 170, 165, 143, 166, 112, 110], [150, 120, 130, 135, 120, 138, 137]], titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]], numericAxis: ChartNumericAxisAttributes(baseline: ChartBaselineAttributes(width: 1, dashPatternLength: 1, dashPatternGap: 0, isHidden: true, value: nil, position: nil), formatter: NumberFormatter(style: .currency), abbreviatedFormatter: NumberFormatter(style: .currency)), secondaryNumericAxis: ChartNumericAxisAttributes(baseline: ChartBaselineAttributes(width: 1, dashPatternLength: 1, dashPatternGap: 0, isHidden: true, value: nil, position: nil), formatter: NumberFormatter(style: .percent), abbreviatedFormatter: NumberFormatter(style: .percent)), indexesOfSecondaryValueAxis: [1])),
            title: "Stacked Column Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .donut, data: [[142.50, 332.05, 247.18, 228.82, 83.45]], titlesForCategory: [["Trucks", "Vans", "Leasing", "Service", "Rentals"]], colorsForCategory: [0: [0: .preferredColor(.chart1), 1: .preferredColor(.chart2), 2: .preferredColor(.chart3), 3: .preferredColor(.chart4), 4: .preferredColor(.chart5)]])),
            title: "Donut Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .micro_column, data: [[200, 170, 165, 143, 166, 112, 110]], titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]], labelsForDimension: [["$200K", "avg", "$165K", "$143K", "$166K", "$112K", "$110K"]])),
            title: "Micro Column Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .micro_radial, data: [[100, 45]], colorsForCategory: [0: [0: .preferredColor(.primary3), 1: .preferredColor(.negative)]])),
            title: "Micro Radial Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .micro_harvey_ball, data: [[360, 8]], titlesForCategory: [["360 Mrd", "8 Mrd"]], colorsForCategory: [0: [0: .preferredColor(.primary3), 1: .preferredColor(.negative)]])),
            title: "Micro Harvey Ball Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .micro_bullet, data: [[35, 50, 70], [0, 20, 50, 100]], colorsForCategory: [0: [0: .preferredColor(.chart1), 1: .preferredColor(.chart2), 2: .preferredColor(.chart2), 3: .preferredColor(.chart3)]])),
            title: "Micro Bullet Chart"
        )
        LibraryItem(
            ChartModel(chartType: .waterfall,
                       data: [[27, 3, 29, -2, -5, 52]],
                       titlesForCategory: [["17 Q1", "New hires", "Transfer-in", "Transfer-out", "Termination", "18 Q1"]],
                       colorsForCategory: [0: [0: .preferredColor(.positive),
                                               1: .preferredColor(.positive),
                                               2: .preferredColor(.positive),
                                               3: .preferredColor(.chart2),
                                               4: .preferredColor(.chart2),
                                               5: .preferredColor(.chart1)]],
                       indexesOfTotalsCategories: [5]),
            title: "Waterfall Chart"
        )
    }
}
#endif

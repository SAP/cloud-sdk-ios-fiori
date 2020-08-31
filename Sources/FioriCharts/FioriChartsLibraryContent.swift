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
struct LibraryContent: LibraryContentProvider {
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
            ChartView(ChartModel(chartType: .area, data: [[200, 170, 165, 143, 166, 112, 110], [150, 120, 130, 135, 120, 138, 137]], titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]])),
            title: "Area Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .column, data: [[200, 170, 165, 143, 166, 112, 110], [150, 120, 130, 135, 120, 138, 137]], titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]])),
            title: "Column Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .stackedColumn, data: [[200, 170, 165, 143, 166, 112, 110], [150, 120, 130, 135, 120, 138, 137]], titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]])),
            title: "Stacked Column Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .donut, data: [[10], [20], [30], [40]])),
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
            ChartView(ChartModel(chartType: .waterfall, data: [[27, 3, 29, -2, -5, 52]], titlesForCategory: [["17 Q1", "New hires", "Transfer-in", "Transfer-out", "Termination", "18 Q1"]], colorsForCategory: [0: [0: .preferredColor(.positive), 1: .preferredColor(.positive), 2: .preferredColor(.positive), 3: .preferredColor(.chart2), 4: .preferredColor(.chart2), 5: .preferredColor(.chart1)]], indexesOfTotalsCategories: [5])),
            title: "Waterfall Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .combo, data: [[200, 170, 165, 143, 166, 112, 110], [150, 120, 130, 135, 120, 138, 137]], titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]], indexesOfSecondaryValueAxis: [1], indexesOfColumnSeries: [0])),
            title: "Combo Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .bubble, data3d: [[[1954.0, 97.4, 42000.0]], [[2002.0, 74.3, 77500], [1992.0, 58.3, 129600.0]], [[1924.0, 278, 25600.0], [1913.0, 177.3, 37125.0]]])),
            title: "Bubble Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .bubble, data3d: [[[1954.0, 97.4]], [[2002.0, 74.3], [1992.0, 58.3]], [[1924.0, 278], [1913.0, 177.3]]])),
            title: "Scatter Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .bar, data: [[200, 170, 165, 143, 166, 112, 110], [150, 120, 130, 135, 120, 138, 137]], titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]])),
            title: "Bar Chart"
        )
        LibraryItem(
            ChartView(ChartModel(chartType: .stackedBar, data: [[200, 170, 165, 143, 166, 112, 110], [150, 120, 130, 135, 120, 138, 137]], titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]])),
            title: "Stacked Bar Chart"
        )
    }
}
#endif

//
//  Tests.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/11/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//
import Foundation
import SwiftUI
import FioriSwiftUICore

/// test data for internal usage
public struct Tests {
    /// line and area models for test
    public static let lineModels = [
        ChartModel(chartType: .line,
                    data: [[200, 170, 165, 143, 166, 82, 110]],
                    titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]]),
        
        ChartModel(chartType: .line,
                   data: [[200, 170, 165, 143, 166, 112, 110],
                          [150, 120, 130, 135, 120, 138, 137]],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]],
                   numericAxis: ChartNumericAxisAttributes(baseline: ChartBaselineAttributes(width: 1, dashPatternLength: 1, dashPatternGap: 0, isHidden: true, value: nil, position: nil), formatter: NumberFormatter(style: .currency), abbreviatedFormatter: NumberFormatter(style: .currency)),
                   secondaryNumericAxis: ChartNumericAxisAttributes(baseline: ChartBaselineAttributes(width: 1, dashPatternLength: 1, dashPatternGap: 0, isHidden: true, value: nil, position: nil), formatter: NumberFormatter(style: .percent), abbreviatedFormatter: NumberFormatter(style: .percent)),
                   indexesOfSecondaryValueAxis: [1]),
        
        ChartModel(chartType: .line,
                   data: [[2.50, 2.20, 1.60, 2.80, 1.70, 0.90, 0.80, 1.95, 1.75, 1.33, 2.44, 1.40, 1.25, 1.80].map { $0 * 100 },
                          [1.95, 1.75, 1.33, 2.44, 1.40, 1.25, 1.90, 1.65, 1.85, 1.43, 1.64, 1.74, 1.55, 1.68].map { $0 * 100 },
                          [2.62, 2.25, 1.90, 2.48, 1.87, 0.92, 1.28, 1.35, 1.45, 1.53, 2.04, 1.94, 1.85, 1.65].map { $0 * 100 },
                          [1.65, 1.95, 1.63, 2.04, 1.74, 1.65, 1.38, 1.75, 1.70, 1.63, 2.14, 1.64, 1.45, 1.50].map { $0 * 100 },
                          [2.25, 2.02, 1.86, 2.28, 1.37, 1.29, 0.88, 1.05, 1.15, 1.30, 1.54, 1.84, 1.45, 1.60].map { $0 * 100 },
                          [1.15, 1.35, 1.73, 2.24, 1.84, 1.55, 1.98, 2.15, 2.35, 2.45, 2.40, 2.00, 1.55, 1.20].map { $0 * 100 }],
                   titlesForCategory: [["Adam Humprey", "Jimmy Patrick", "Franck Syren", "Alex Kilgo", "Kim Kilgo", "Sean Long", "Flash Ek-Ularnpun", "Lili Lin", "Luka Ning", "Rodhan Hickey", "Natasha Girotra", "Megan Zurcher", "Joan Wood", "Stanley Thomas Stadelman Jr."]]),
        
        ChartModel(chartType: .line,
                   data: [[-1.8, -2.2, -1.1, -0.7, -1.2, -2.3, -2.95, -1.4, -3.5, -4.4, -4.2, -3.1].map { $0 * 100000 }, [-3.3, -3.7, -3.55, -3.7, -3.3, -3.5, -3.5, -3.1, -3.4, -3.5, -3.0, -3.6].map { $0 * 100000 }],
                   titlesForCategory: [["Jan", nil, "Mar", nil, "May", nil, "Jul", nil, "Sep", "Oct", nil, "Dec"]],
                   selections: [0: [2]],
                   indexesOfSecondaryValueAxis: [1]),
        
        ChartModel(chartType: .line,
                   data: [[1.8, 2.2, 1.1, 0.7, -1.2, -2.3, -2.95, 1.4, 3.5, 4.4, 4.2, 3.1].map { $0 * 100000 },
                          [3.3, 3.7, 3.55, 3.7, 3.3, 3.5, 3.5, 3.1, 3.4, 3.5, 3.0, 3.6].map { $0 * 100000 }],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]],
                   colorsForCategory: [0: [4: .preferredColor(.negative), 5: .preferredColor(.negative), 6: .preferredColor(.negative)]],
                   selections: [0: [4, 5, 6, 7, 8]],
                   indexesOfSecondaryValueAxis: [0, 1]),
        
        ChartModel(chartType: .line,
                   data: [[1.8, 2.2, 1.1, 0.7, -0.2, -0.8, -0.6, 1.4, 3.5, 4.4, 4.2, 3.1].map { $0 * 100000 }, [3.3, 3.7, 3.55, 3.7, 3.3, 3.5, 3.5, 3.1, 3.4, 3.5, 3.0, 3.6].map { $0 * 100000 }],
                   titlesForCategory: [["Ja", "Fe", "Ma", "Ap", "Ma", "Ju", "Ju", "Au", "Se", "Oc", "No", "De"]],
                   seriesAttributes: [
                        ChartSeriesAttributes(palette:
                            ChartSeriesPalette(colors: [.preferredColor(.chart4)],
                                               fillColor: .preferredColor(.chart5)),
                                              lineWidth: 2,
                                              point: nil,
                                              firstLineCapDiameter: 0,
                                              lastLineCapDiameter: 0),
                        ChartSeriesAttributes(palette:
                            ChartSeriesPalette(colors: [.preferredColor(.chart8)],
                                               fillColor: .preferredColor(.chart9)),
                                          lineWidth: 3,
                                          point: ChartPointAttributes(isHidden: false, diameter: 20, strokeColor: .preferredColor(.chart1), gap: 2),
                                          firstLineCapDiameter: 0,
                                          lastLineCapDiameter: 0)
                    ],
                   indexesOfSecondaryValueAxis: [1]),
        
        ChartModel(chartType: .line,
                   data: [[-1.8, -2.2, -1.1, -0.7, -1.2, -2.3, -2.95, -1.4, -3.5, -4.4, -4.2, -3.1].map { $0 * 100000 }, [-3.3, -3.7, -3.55, -3.7, -3.3, -3.5, -3.5, -3.1, -3.4, -3.5, -3.0, -3.6].map { $0 * 100000 }],
                   titlesForCategory: [["Janreallyloooooooooooooooooooooooooooooooooooooooooooooooooooooooglabel", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Decreallyloooooooooooooooooooooooooooooooooooooooooooooooooooooooglabel"]],
                   selections: [3: [7]],
                   categoryAxis: ChartCategoryAxisAttributes(labelLayoutStyle: .range)),
        
        ChartModel(chartType: .line,
                   data: [[200, 170, 165, 183, nil, nil, nil],
                          [nil, nil, nil, 183, 196, 190, 180]],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]]
        ),
        ChartModel(chartType: .line,
                   data: [[nil, 220, nil, 250, 200, nil, 230],
                          [160, nil, 130, 170, nil, 190, 180]],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]]
        ),
        ChartModel(chartType: .line,
                   data: [[1.8, 2.2, 1.1, 0.7, -1.2, -2.3, -2.95, 1.4, 3.5, 4.4, 4.2, 3.1].map { $0 * 100000 },
                          [3.3, 3.7, 3.55, 3.7, 3.3, 3.5, 3.5, 3.1, 3.4, 3.5, 3.0, 3.6].map { $0 * 100000 }],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]],
                   colorsForCategory: [0: [4: .preferredColor(.negative), 5: .preferredColor(.negative), 6: .preferredColor(.negative)]],
                   selections: [0: [0, 1, 2, 7, 8], 1: [3, 5, 7]]),
        ChartModel(chartType: .line, data: [[nil]]),
        ChartModel(chartType: .line, data: [[]])
    ]
    
    /// descriptions for line models
    public static let lineModelsDesc = ["positive values, single series", "positive values, secondary y axis", "6 series, long category labels", "negative values, some x axis labels are nil, preselected single selection", "mixed values, preselected range selection", "mixed values 2, custom series attributes", "long x axis labels, label layout style is \"range\", preselected invalid selection", "nil values", "nil values 2", "Multiple selections", "data = [[nil]]", "data = [[]]"]
    
    /// waterfall models for test
    public static let waterfallModels = [
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
        
        ChartModel(chartType: .waterfall,
                   data: [[27, 8, 24, -2, -5, 52]],
                   titlesForCategory: [["17 Q1", "New hires", "Transfer-in", "Transfer-out", "Termination", "18 Q1"]],
                   colorsForCategory: [0: [0: .preferredColor(.positive),
                                           1: .preferredColor(.positive),
                                           2: .preferredColor(.positive),
                                           3: .preferredColor(.chart2),
                                           4: .preferredColor(.chart2),
                                           5: .preferredColor(.chart1)]],
                   indexesOfTotalsCategories: [2, 5]),
        
        ChartModel(chartType: .waterfall,
                   data: [[27, 8, 24, -2, -5, 52]],
                   titlesForCategory: [["17 Q1", "New hires", "Transfer-in", "Transfer-out", "Termination", "18 Q1"]],
                   colorsForCategory: [0: [0: .preferredColor(.positive),
                                           1: .preferredColor(.positive),
                                           2: .preferredColor(.positive),
                                           3: .preferredColor(.chart2),
                                           4: .preferredColor(.chart2),
                                           5: .preferredColor(.chart1)]],
                   numericAxis: ChartNumericAxisAttributes(axisId: nil, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil, isZeroBased: true, allowLooseLabels: true, fudgeAxisRange: false, adjustToNiceValues: true, abbreviatesLabels: true, isMagnitudedDisplayed: false, explicitMin: 10, explicitMax: 100, formatter: nil, abbreviatedFormatter: nil),
                   indexesOfTotalsCategories: [2, 5]),
        
        ChartModel(chartType: .waterfall,
                   data: [[-27, -8, -6, 2, 5, -52]],
                   titlesForCategory: [["17 Q1", "New hires", "Transfer-in", "Transfer-out", "Termination", "18 Q1"]],
                   colorsForCategory: [0: [0: .preferredColor(.positive),
                                           1: .preferredColor(.positive),
                                           2: .preferredColor(.positive),
                                           3: .preferredColor(.chart2),
                                           4: .preferredColor(.chart2),
                                           5: .preferredColor(.chart1)]],
                   indexesOfTotalsCategories: [5]),
        
        ChartModel(chartType: .waterfall,
                   data: [[250, -100, 150, -20, -20, -20, -15, 75, -15, 60, -10, -5, 45]],
                   titlesForCategory: [["Sales", nil, "Gross Margin", nil, nil, nil, nil, "EBITDA", nil, "EBIT", nil, nil, "Net Income"]],
                   colorsForCategory: [0: [1: .preferredColor(.chart2),
                                           3: .preferredColor(.chart2),
                                           4: .preferredColor(.chart2),
                                           5: .preferredColor(.chart2),
                                           6: .preferredColor(.chart2),
                                           8: .preferredColor(.chart2),
                                           10: .preferredColor(.chart2),
                                           11: .preferredColor(.chart2)]],
                   indexesOfTotalsCategories: [0, 2, 7, 9, 12]),
        
        ChartModel(chartType: .waterfall,
                   data: [[250, -300, 150, -50, nil, -100, -15, -75, -15, 60, -10, -5, 45]],
                   titlesForCategory: [["Sales", nil, "Gross Margin", nil, nil, nil, nil, "EBITDA", nil, "EBIT", nil, nil, "Net Income"]],
                   colorsForCategory: [0: [1: .preferredColor(.chart2),
                                           2: .preferredColor(.chart2),
                                           3: .preferredColor(.chart2),
                                           4: .preferredColor(.chart2),
                                           5: .preferredColor(.chart2),
                                           6: .preferredColor(.chart2),
                                           8: .preferredColor(.chart2),
                                           10: .preferredColor(.chart2),
                                           11: .preferredColor(.chart2)]],
                   indexesOfTotalsCategories: [0, 7, 9, 12]),
        
        ChartModel(chartType: .waterfall, data: [[nil]]),
        
        ChartModel(chartType: .waterfall, data: [[]])
    ]
    
    /// descriptions for column models
    public static let waterfallModelsDesc = ["Headcount Movement Last 12 Months, 5 is the total index",
                                             "Headcount Movement Last 12 Months, 2 and 5 are total indexes",
                                             "Headcount Movement Last 12 Months, explicitMax = 100",
                                             "Headcount Movement Last 12 Months, negative value",
                                             "Net Income Construction EBITDA",
                                             "Net Income Construction EBITDA, nil value, negative total values",
                                             "data = [[nil]]", "data = [[]]"]
    
    //swiftlint:disable force_unwrapping
    /// bubble models
    public static let bubbleModels = [
         ChartModel(chartType: .bubble,
                   data3d: Array(SFBuildingFacilityTypes[0 ... 3]).map { type in
                        SFBuildingFacilities[type]!.map { building in
                            [building.yearRennovated, building.eui, building.sqFt]
                        }
                   },
                   numericAxisLabelFormatHandler: { val, axisId in
                       if axisId == .y || axisId == .category {
                           let intVal = Int(val)
                           return "\(intVal)"
                       } else {
                           return nil
                       }
                   }),
        
        ChartModel(chartType: .bubble,
                   data3d: Array(SFBuildingFacilityTypes[4 ... 7]).map { type in
                        SFBuildingFacilities[type]!.map { building in
                            [building.yearRennovated, building.eui, building.sqFt]
                        }
                   },
                   selections: [0: [0]],
                   numericAxisLabelFormatHandler: { val, axisId in
                       if axisId == .y || axisId == .category {
                           let intVal = Int(val)
                           return "\(intVal)"
                       } else {
                           return nil
                       }
                   }),
        
        ChartModel(chartType: .bubble,
                   data3d: Array(SFBuildingFacilityTypes[8 ... 13]).map { type in
                        SFBuildingFacilities[type]!.map { building in
                            [building.yearRennovated, building.eui, building.sqFt]
                        }
                   },
                   selections: [1: Array(0 ... SFBuildingFacilities[SFBuildingFacilityTypes[9]]!.count - 1)],
                   numericAxisLabelFormatHandler: { val, axisId in
                       if axisId == .y || axisId == .category {
                           let intVal = Int(val)
                           return "\(intVal)"
                       } else {
                           return nil
                       }
                   }),
        
        ChartModel(chartType: .bubble,
                   data3d: Array(SFBuildingFacilityTypes[0 ... 13]).map { type in
                        SFBuildingFacilities[type]!.map { building in
                            [building.yearRennovated, building.eui, building.sqFt]
                        }
                   },
                   numericAxisLabelFormatHandler: { val, axisId in
                       if axisId == .y || axisId == .category {
                           let intVal = Int(val)
                           return "\(intVal)"
                       } else {
                           return nil
                       }
                   }),
        
        ChartModel(chartType: .bubble,
                   data3d: Array(SFBuildingFacilityTypes[0 ... 3]).map { type in
                        SFBuildingFacilities[type]!.map { building in
                            [building.eui, building.yearRennovated, building.sqFt]
                        }
                   },
                   numericAxisLabelFormatHandler: { val, axisId in
                       if axisId == .y || axisId == .category {
                           let intVal = Int(val)
                           return "\(intVal)"
                       } else {
                           return nil
                       }
                   }),
        
        ChartModel(chartType: .bubble,
                   data3d: Array(SFBuildingFacilityTypes[0 ... 3]).map { type in
                        SFBuildingFacilities[type]!.map { building in
                            [building.yearRennovated, building.sqFt, building.eui]
                        }
                   },
                   numericAxisLabelFormatHandler: { val, axisId in
                       if axisId == .y || axisId == .category {
                           let intVal = Int(val)
                           return "\(intVal)"
                       } else {
                           return nil
                       }
                   }),
        
        ChartModel(chartType: .bubble,
                   data3d: [[[1954.0, 97.4, 42000.0]], [[2002.0, 74.3, 77500], [1992.0, 58.3, 129600.0]], [[1924.0, 278, 25600.0], [1913.0, 177.3, 37125.0]]])
    ]
    
    /// descriptions for column models
    public static let bubbleModelsDesc = ["X Axis: year built or last renovated, \nY Axis: kBtu/sq.ft, \nZ Axis: sqft, \nSeries: Airport, Convention Centers, Education, Health & Human Services",
                                          "Series: Hospitals, Libraries, Museums and Art, Offices, preselected a single category",
                                          "Series: last 6 categories, preselected a series",
                                          "Series: all 14 categories",
                                          "X Axis: kBtu/sq.ft, \nY Axis: year built or last renovated, \nZ Axis: sqft",
                                          "X Axis: year built or last renovated, \nY Axis: sqft, \nZ Axis: kBtu/sq.ft",
                                          "Simple example"]
    
    //swiftlint:disable force_unwrapping
    /// scatter models
    public static let scatterModels = [
         ChartModel(chartType: .scatter,
                   data3d: Array(SFBuildingFacilityTypes[2 ... 3]).map { type in
                        SFBuildingFacilities[type]!.map { building in
                            [building.yearRennovated, building.eui]
                        }
                   },
                   numericAxisLabelFormatHandler: { val, axisId in
                       if axisId == .y || axisId == .category {
                           let intVal = Int(val)
                           return "\(intVal)"
                       } else {
                           return nil
                       }
                   }),
        
        ChartModel(chartType: .scatter,
                   data3d: Array(SFBuildingFacilityTypes[4 ... 7]).map { type in
                        SFBuildingFacilities[type]!.map { building in
                            [building.yearRennovated, building.eui]
                        }
                   },
                   selections: [0: [0]],
                   numericAxisLabelFormatHandler: { val, axisId in
                       if axisId == .y || axisId == .category {
                           let intVal = Int(val)
                           return "\(intVal)"
                       } else {
                           return nil
                       }
                   }),
        
        ChartModel(chartType: .scatter,
                   data3d: Array(SFBuildingFacilityTypes[8 ... 13]).map { type in
                        SFBuildingFacilities[type]!.map { building in
                            [building.yearRennovated, building.eui]
                        }
                   },
                   selections: [1: Array(0 ... SFBuildingFacilities[SFBuildingFacilityTypes[9]]!.count - 1)],
                   numericAxisLabelFormatHandler: { val, axisId in
                       if axisId == .y || axisId == .category {
                           let intVal = Int(val)
                           return "\(intVal)"
                       } else {
                           return nil
                       }
                   }),
        
        ChartModel(chartType: .scatter,
                   data3d: Array(SFBuildingFacilityTypes[0 ... 13]).map { type in
                        SFBuildingFacilities[type]!.map { building in
                            [building.yearRennovated, building.eui]
                        }
                   },
                   numericAxisLabelFormatHandler: { val, axisId in
                       if axisId == .y || axisId == .category {
                           let intVal = Int(val)
                           return "\(intVal)"
                       } else {
                           return nil
                       }
                   }),
        
        ChartModel(chartType: .scatter,
                   data3d: Array(SFBuildingFacilityTypes[0 ... 3]).map { type in
                        SFBuildingFacilities[type]!.map { building in
                            [building.eui, building.yearRennovated]
                        }
                   },
                   numericAxisLabelFormatHandler: { val, axisId in
                       if axisId == .y || axisId == .category {
                           let intVal = Int(val)
                           return "\(intVal)"
                       } else {
                           return nil
                       }
                   }),
        
        ChartModel(chartType: .scatter,
                   data3d: Array(SFBuildingFacilityTypes[0 ... 3]).map { type in
                        SFBuildingFacilities[type]!.map { building in
                            [building.yearRennovated, building.sqFt]
                        }
                   },
                   numericAxisLabelFormatHandler: { val, axisId in
                       if axisId == .y || axisId == .category {
                           let intVal = Int(val)
                           return "\(intVal)"
                       } else {
                           return nil
                       }
                   }),
        
        ChartModel(chartType: .scatter,
                   data3d: [[[1954.0, 97.4]], [[2002.0, 74.3], [1992.0, 58.3]], [[1924.0, 278], [1913.0, 177.3]]])
    ]
    
    /// descriptions for column models
    public static let scatterModelsDesc = ["X Axis: year built or last renovated, \nY Axis: kBtu/sq.ft, \nSeries: Education, Health & Human Services",
                                           "Series: Hospitals, Libraries, Museums and Art, Offices, preselected a single category",
                                           "Series: last 6 categories, preselected a series",
                                           "Series: all 14 categories",
                                           "X Axis: kBtu/sq.ft, \nY Axis: year built or last renovated",
                                           "X Axis: year built or last renovated, \nY Axis: sqft",
                                           "Simple example"]
    
    /// line and area models for test
    public static let comboModels = [
        ChartModel(chartType: .combo,
                   data: [[200, 170, 165, 143, 166, 112, 110],
                          [150, 120, 130, 135, 120, 138, 137]],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]],
                   indexesOfSecondaryValueAxis: [1],
                   indexesOfColumnSeries: [0]),
        
        ChartModel(chartType: .combo,
                   data: [[2.50, 2.20, 1.60, 2.80, 1.70, 0.90, 0.80, 1.95, 1.75, 1.33, 2.44, 1.40, 1.25, 1.80].map { $0 * 100 },
                          [1.95, 1.75, 1.33, 2.44, 1.40, 1.25, 1.90, 1.65, 1.85, 1.43, 1.64, 1.74, 1.55, 1.68].map { $0 * 100 },
                          [2.62, 2.25, 1.90, 2.48, 1.87, 0.92, 1.28, 1.35, 1.45, 1.53, 2.04, 1.94, 1.85, 1.65].map { $0 * 100 },
                          [1.65, 1.95, 1.63, 2.04, 1.74, 1.65, 1.38, 1.75, 1.70, 1.63, 2.14, 1.64, 1.45, 1.50].map { $0 * 100 },
                          [2.25, 2.02, 1.86, 2.28, 1.37, 1.29, 0.88, 1.05, 1.15, 1.30, 1.54, 1.84, 1.45, 1.60].map { $0 * 100 },
                          [1.15, 1.35, 1.73, 2.24, 1.84, 1.55, 1.98, 2.15, 2.35, 2.45, 2.40, 2.00, 1.55, 1.20].map { $0 * 100 }],
                   titlesForCategory: [["Adam Humprey", "Jimmy Patrick", "Franck Syren", "Alex Kilgo", "Kim Kilgo", "Sean Long", "Flash Ek-Ularnpun", "Lili Lin", "Luka Ning", "Rodhan Hickey", "Natasha Girotra", "Megan Zurcher", "Joan Wood", "Stanley Thomas Stadelman Jr."]],
                   indexesOfSecondaryValueAxis: [3, 4, 5],
                   indexesOfColumnSeries: [0, 1, 2]),
        
        ChartModel(chartType: .combo,
                   data: [[-1.8, -2.2, -1.1, -0.7, -1.2, -2.3, -2.95, -1.4, -3.5, -4.4, -4.2, -3.1].map { $0 * 100000 }, [-3.3, -3.7, -3.55, -3.7, -3.3, -3.5, -3.5, -3.1, -3.4, -3.5, -3.0, -3.6].map { $0 * 100000 }],
                   titlesForCategory: [["Jan", nil, "Mar", nil, "May", nil, "Jul", nil, "Sep", "Oct", nil, "Dec"]],
                   selections: [0: [2]],
                   indexesOfSecondaryValueAxis: [1],
                   indexesOfColumnSeries: [0]),
        
        ChartModel(chartType: .combo,
                   data: [[1.8, 2.2, 1.1, 0.7, -1.2, -2.3, -2.95, 1.4, 3.5, 4.4, 4.2, 3.1].map { $0 * 100000 },
                          [3.3, 3.7, 3.55, 3.7, 3.3, 3.5, 3.5, 3.1, 3.4, 3.5, 3.0, 3.6].map { $0 * 100000 }],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]],
                   colorsForCategory: [0: [4: .preferredColor(.negative), 5: .preferredColor(.negative), 6: .preferredColor(.negative)]],
                   selections: [0: [4, 5, 6, 7, 8]],
                   indexesOfSecondaryValueAxis: [0, 1],
                   indexesOfColumnSeries: [1]),
        
        ChartModel(chartType: .micro_bullet, data: [[nil]])
    ]
    
    /// descriptions for combo models
    public static let comboModelsDesc = ["positive values, secondary y axis",
                                         "6 series, long category labels",
                                         "negative values, some x axis labels are nil, preselected single selection",
                                         "mixed values, preselected range selection",
                                         "data = [[nil]]", "data = [[]]"]
    
    /// bullet models for test
    public static let bulletModles = [
        ChartModel(chartType: .micro_bullet,
                   data: [[120, 100, 110], [0, 50, 150, 200]]),
        
        ChartModel(chartType: .micro_bullet,
                   data: [[35, 50, 70], [0, 20, 50, 100]],
                   colorsForCategory: [0: [0: .preferredColor(.chart1), 1: .preferredColor(.chart2), 2: .preferredColor(.chart2), 3: .preferredColor(.chart3)]]),
        
        ChartModel(chartType: .micro_bullet, data: [[nil]]),
        
        ChartModel(chartType: .micro_bullet, data: [[]])
    ]
    
    /// descriptions for bullet models
    public static let bulletModlesDesc = ["typical one", "customized colors for category", "data = [[nil]]", "data = [[]]"]
    
    /// column models for test
    public static let columnModels = [
        ChartModel(chartType: .micro_column,
                   data: [[200, 170, 165, 143, 166, 112, 110]],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]],
                   labelsForDimension: [["$200K", "avg", "$165K", "$143K", "$166K", "$112K", "$110K"]]),
        
        ChartModel(chartType: .micro_column,
                   data: [[200, 170, -165, 143, 166, 112, 110]],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]],
                   colorsForCategory: [0: [2: .preferredColor(.negative)]],
                   labelsForDimension: [["$200K", "avg", "-165K", nil, "$166K", "$112K", "$110K"]]),
        
        ChartModel(chartType: .micro_column,
                   data: [[60, 80, 100, 60, 55, 15]],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun"]]),
        
        ChartModel(chartType: .micro_column, data: [[nil]])
    ]
    
    /// descriptions for column models
    public static let columnModelsDesc = ["positive values, labels for dimensions", "mixed values, labels for dimensions", "positive values, no labels for dimensions", "data = [[nil]]"]
    
    /// harvey ball models for test
    public static let harveyBallModels = [
        ChartModel(chartType: .micro_harvey_ball,
                   data: [[360, 8]],
                   titlesForCategory: [["360 Mrd", "8 Mrd"]],
                   colorsForCategory: [0: [0: .preferredColor(.primary3), 1: .preferredColor(.negative)]]),
        
        ChartModel(chartType: .micro_harvey_ball,
                   data: [[360, 352]],
                   titlesForCategory: [["360 Mrd", "352 Mrd"]],
                   colorsForCategory: [0: [0: .preferredColor(.primary3), 1: .preferredColor(.positive)]]),
        
        ChartModel(chartType: .micro_harvey_ball,
                   data: [[360, 400]],
                   titlesForCategory: [["360 Mrd", "400 Mrd"]],
                   colorsForCategory: [0: [0: .preferredColor(.primary4), 1: .preferredColor(.positive)]]),
        
        ChartModel(chartType: .micro_harvey_ball,
                   data: [[100, 8]],
                   titlesForCategory: [["100 Mrd", ""]],
                   colorsForCategory: [0: [0: .preferredColor(.primary4), 1: .preferredColor(.critical)]]),
        
        ChartModel(chartType: .micro_harvey_ball, data: [[nil]])
    ]
    
    /// descriptions for column models
    public static let harveyBallModelsDesc = ["typical one", "close", "more than 100%", "one title is empty", "data = [[nil]]"]
    
    /// donut models for test
    public static let donutModels = [
        ChartModel(chartType: .donut,
                   data: [[142.50], [332.05], [247.18], [228.82], [83.45]]),

        ChartModel(chartType: .donut,
                   data: [[142.50], [332.05], [247.18], [228.82], [83.45]],
                   colorsForCategory: [0: [0: Color.red], 1: [0: Color.green], 2: [0: Color.blue]],
                   selections: [1: [0], 3: [0]]),

        ChartModel(chartType: .donut, data: [[-10], [20], [30], [40]]),
        
        ChartModel(chartType: .donut, data: [[1]]),

        ChartModel(chartType: .donut, data: [[1], [1]]),
        
        ChartModel(chartType: .donut, data: [[0], [0], [0], [0]]),
        
        ChartModel(chartType: .donut, data: [[nil]])
    ]
    
    /// descriptions for column models
    public static let donutModelsDesc = ["A typical donut", "A donut with preselection and customized colors", "Data is -10, 20, 30, 40", "Data is 1", "Data is 1, 1", "Data is 0, 0, 0, 0", "Data = [[nil]]"]
    
    /// radial models for test
    public static let radialModels = [
        ChartModel(chartType: .micro_radial, data: [[100, 45]], colorsForCategory: [0: [0: .preferredColor(.primary3), 1: .preferredColor(.negative)]]),
        
        ChartModel(chartType: .micro_radial, data: [[100, 99]], colorsForCategory: [0: [0: .preferredColor(.primary3), 1: .preferredColor(.positive)]]),
        
        ChartModel(chartType: .micro_radial, data: [[100, 10]], colorsForCategory: [0: [0: .preferredColor(.primary4), 1: .preferredColor(.critical)]]),
        
        ChartModel(chartType: .micro_radial, data: [[100, 0]], colorsForCategory: [0: [0: .preferredColor(.primary4), 1: .preferredColor(.critical)]]),
        
        ChartModel(chartType: .micro_radial, data: [[nil]])
    ]
    
    /// descriptions for column models
    public static let radialModelsDesc = ["typical one", "99%", "10%", "0%", "data = [[nil]]"]
    
    /// stock models for test
    public static let stockModels = [
        // multiple series: intraday: 1min, one day: 1min, 1year:1day, 3years:1week
        ChartModel(chartType: .stock,
                   data: [
                    [747, 768, 753, 771, 738, 745, 674, 740, 671, 730, 756, 712, 763, 717, 672, 709, 641, 720, 733, 650, 666, 778, 718, 661, 754, 665, 706, 752, 727, 685, 744, 649, 649, 646, 693, 685, 683, 689, 695, 648, 747, 774, 645, 672, 724, 652, 777, 690, 721, 755, 738, 647, 705, 743, 671, 696, 679, 641, 655, 651, 733, 659, 654, 719, 657, 652, 682, 758, 689, 677, 667, 666, 760, 745, 699, 655, 662, 775, 671, 715, 722],
                    [642, 650, 647, 659, 655, 615, 647, 635, 683, 625, 663, 632, 686, 638, 666, 617, 658, 673, 647, 670, 619, 661, 667, 687, 654, 619, 671, 673, 645, 648, 651, 647, 645, 628, 633, 638, 620, 645, 616, 663, 673, 635, 680, 686, 637, 635, 676, 671, 662, 657, 687, 639, 661, 674, 669, 633, 661, 622, 674, 642, 618, 655, 637, 687, 638, 664, 636, 641, 684, 659, 662, 635, 639, 689, 659, 659, 644, 647, 654, 650, 667, 632, 616, 616, 638, 646, 639, 644, 629, 659, 664, 625, 630, 636, 665, 663, 662, 626, 626, 619, 664, 622, 645, 680, 670, 620, 653, 627, 664, 634, 618, 643, 624, 616, 684, 683, 653, 630, 619, 611, 653, 637, 635, 623, 684, 662, 676, 674, 662, 675, 630, 676, 656, 657, 653, 620, 617, 679, 662, 625, 624, 632, 621, 639, 636, 677, 660, 619, 646, 639, 678, 690, 690, 686, 688, 650, 638, 639, 688, 655, 656, 662, 668, 643, 636, 681, 626, 636, 649, 655, 650, 632, 685, 668, 664, 633, 623, 676, 625, 613, 631, 664, 655, 626, 623, 614, 668, 622, 613, 623, 615, 632, 672, 666, 652, 648, 686, 669, 688, 684, 643, 667, 624, 643, 679, 626, 628, 689, 669, 652, 665, 679, 615, 654, 646, 670, 625, 662, 666, 664, 667, 674, 650, 662, 648, 616, 636, 645, 642, 623, 670, 646, 674, 659, 619, 623, 654, 679, 661, 680, 683, 681, 665, 679, 638, 660, 635, 628, 667, 661, 656, 638, 657, 674, 636, 630, 668, 661, 681, 640, 644, 681, 623, 613, 635, 658, 685, 636, 670, 662, 677, 628, 689, 686, 655, 643, 631, 652, 647, 635, 679, 682, 677, 666, 649, 631, 645, 655, 641, 671, 626, 639, 664, 611, 645, 672, 685, 667, 645, 665, 674, 628, 619, 612, 622, 630, 678, 686, 655, 617, 643, 649, 668, 614, 648, 686, 648, 625, 625, 620, 674, 612, 633, 651, 620, 665, 619, 650, 658, 673, 685, 644, 635, 690, 620, 658, 618, 635, 651, 687, 646, 668, 689, 662, 617, 682, 665, 619, 683, 650, 616, 649, 652, 637, 672, 622, 681, 637, 668, 630, 652, 676, 626, 617, 688, 647, 611, 673, 658, 649, 611, 678, 649, 641, 615, 623, 666, 687, 615, 686, 669, 683, 641, 648, 652, 626, 626, 676, 666, 629],
                    [886, 751, 570, 525, 491, 758, 733, 926, 435, 716, 817, 477, 781, 961, 850, 654, 556, 858, 614, 958, 510, 850, 954, 748, 644, 911, 746, 486, 966, 528, 634, 805, 447, 606, 641, 510, 697, 917, 823, 609, 739, 662, 562, 840, 900, 535, 768, 903, 610, 795, 750, 819, 863, 909, 819, 605, 431, 488, 826, 949, 894, 826, 756, 917, 896, 620, 804, 854, 506, 695, 578, 755, 656, 537, 437, 857, 859, 472, 722, 735, 874, 467, 678, 911, 561, 626, 657, 900, 644, 677, 732, 843, 738, 461, 553, 829, 738, 707, 709, 551, 460, 609, 727, 800, 604, 749, 926, 432, 503, 784, 718, 587, 825, 698, 840, 861, 925, 889, 715, 926, 538, 642, 936, 431, 697, 588, 900, 556, 503, 482, 656, 455, 506, 966, 898, 891, 791, 859, 499, 573, 778, 808, 656, 857, 843, 951, 926, 479, 508, 917, 464, 679, 530, 559, 965, 438, 870, 933, 946, 812, 839, 944, 848, 500, 805, 575, 710, 787, 478, 823, 787, 775, 931, 958, 692, 613, 900, 931, 924, 801, 911, 951, 667, 465, 510, 723, 479, 529, 582, 450, 467, 695, 931, 508, 802, 530, 490, 607, 596, 705, 966, 777, 512, 598, 461, 773, 462, 709, 851, 581, 833, 480, 472, 949, 632, 945, 776, 857, 773, 694, 643, 851, 624, 711, 656, 619, 795, 955, 544, 738, 892, 900, 724, 518, 470, 638, 649, 623, 610, 922, 684, 430, 705, 688, 936, 859, 453, 893, 494, 863, 848, 498, 455, 619, 525, 638, 557, 780, 459, 544, 811, 769, 594, 653, 639, 448, 537, 521, 563],
                    [582, 470, 541, 821, 882, 325, 353, 361, 560, 669, 366, 431, 466, 908, 877, 545, 704, 351, 966, 881, 630, 291, 625, 233, 479, 950, 762, 239, 886, 519, 808, 627, 851, 836, 452, 668, 287, 926, 634, 492, 695, 614, 623, 722, 693, 338, 854, 907, 600, 381, 799, 515, 525, 426, 443, 426, 295, 618, 337, 776, 456, 305, 396, 623, 864, 366, 528, 720, 578, 937, 378, 947, 758, 631, 510, 354, 726, 918, 725, 927, 775, 455, 634, 449, 703, 238, 890, 802, 868, 376, 706, 560, 882, 609, 423, 448, 764, 590, 646, 589, 694, 216, 947, 418, 450, 941, 840, 548, 879, 258, 893, 364, 779, 617, 562, 416, 860, 397, 382, 682, 552, 460, 562, 909, 711, 961, 467, 413, 817, 774, 439, 960, 320, 385, 785, 772, 472, 568, 459, 563, 772, 967, 762, 797, 257, 378, 822, 677, 956, 538, 676, 658, 881, 767, 353, 468, 825, 554, 795]
            ],
                   titlesForCategory: [
                    ["2020-01-07 09:30:00", "2020-01-07 09:31:00", "2020-01-07 09:32:00", "2020-01-07 09:33:00", "2020-01-07 09:34:00", "2020-01-07 09:35:00", "2020-01-07 09:36:00", "2020-01-07 09:37:00", "2020-01-07 09:38:00", "2020-01-07 09:39:00", "2020-01-07 09:40:00", "2020-01-07 09:41:00", "2020-01-07 09:42:00", "2020-01-07 09:43:00", "2020-01-07 09:44:00", "2020-01-07 09:45:00", "2020-01-07 09:46:00", "2020-01-07 09:47:00", "2020-01-07 09:48:00", "2020-01-07 09:49:00", "2020-01-07 09:50:00", "2020-01-07 09:51:00", "2020-01-07 09:52:00", "2020-01-07 09:53:00", "2020-01-07 09:54:00", "2020-01-07 09:55:00", "2020-01-07 09:56:00", "2020-01-07 09:57:00", "2020-01-07 09:58:00", "2020-01-07 09:59:00", "2020-01-07 10:00:00", "2020-01-07 10:01:00", "2020-01-07 10:02:00", "2020-01-07 10:03:00", "2020-01-07 10:04:00", "2020-01-07 10:05:00", "2020-01-07 10:06:00", "2020-01-07 10:07:00", "2020-01-07 10:08:00", "2020-01-07 10:09:00", "2020-01-07 10:10:00", "2020-01-07 10:11:00", "2020-01-07 10:12:00", "2020-01-07 10:13:00", "2020-01-07 10:14:00", "2020-01-07 10:15:00", "2020-01-07 10:16:00", "2020-01-07 10:17:00", "2020-01-07 10:18:00", "2020-01-07 10:19:00", "2020-01-07 10:20:00", "2020-01-07 10:21:00", "2020-01-07 10:22:00", "2020-01-07 10:23:00", "2020-01-07 10:24:00", "2020-01-07 10:25:00", "2020-01-07 10:26:00", "2020-01-07 10:27:00", "2020-01-07 10:28:00", "2020-01-07 10:29:00", "2020-01-07 10:30:00", "2020-01-07 10:31:00", "2020-01-07 10:32:00", "2020-01-07 10:33:00", "2020-01-07 10:34:00", "2020-01-07 10:35:00", "2020-01-07 10:36:00", "2020-01-07 10:37:00", "2020-01-07 10:38:00", "2020-01-07 10:39:00", "2020-01-07 10:40:00", "2020-01-07 10:41:00", "2020-01-07 10:42:00", "2020-01-07 10:43:00", "2020-01-07 10:44:00", "2020-01-07 10:45:00", "2020-01-07 10:46:00", "2020-01-07 10:47:00", "2020-01-07 10:48:00", "2020-01-07 10:49:00", "2020-01-07 15:59:00"],
                    ["2020-01-06 09:30:00", "2020-01-06 09:31:00", "2020-01-06 09:32:00", "2020-01-06 09:33:00", "2020-01-06 09:34:00", "2020-01-06 09:35:00", "2020-01-06 09:36:00", "2020-01-06 09:37:00", "2020-01-06 09:38:00", "2020-01-06 09:39:00", "2020-01-06 09:40:00", "2020-01-06 09:41:00", "2020-01-06 09:42:00", "2020-01-06 09:43:00", "2020-01-06 09:44:00", "2020-01-06 09:45:00", "2020-01-06 09:46:00", "2020-01-06 09:47:00", "2020-01-06 09:48:00", "2020-01-06 09:49:00", "2020-01-06 09:50:00", "2020-01-06 09:51:00", "2020-01-06 09:52:00", "2020-01-06 09:53:00", "2020-01-06 09:54:00", "2020-01-06 09:55:00", "2020-01-06 09:56:00", "2020-01-06 09:57:00", "2020-01-06 09:58:00", "2020-01-06 09:59:00", "2020-01-06 10:00:00", "2020-01-06 10:01:00", "2020-01-06 10:02:00", "2020-01-06 10:03:00", "2020-01-06 10:04:00", "2020-01-06 10:05:00", "2020-01-06 10:06:00", "2020-01-06 10:07:00", "2020-01-06 10:08:00", "2020-01-06 10:09:00", "2020-01-06 10:10:00", "2020-01-06 10:11:00", "2020-01-06 10:12:00", "2020-01-06 10:13:00", "2020-01-06 10:14:00", "2020-01-06 10:15:00", "2020-01-06 10:16:00", "2020-01-06 10:17:00", "2020-01-06 10:18:00", "2020-01-06 10:19:00", "2020-01-06 10:20:00", "2020-01-06 10:21:00", "2020-01-06 10:22:00", "2020-01-06 10:23:00", "2020-01-06 10:24:00", "2020-01-06 10:25:00", "2020-01-06 10:26:00", "2020-01-06 10:27:00", "2020-01-06 10:28:00", "2020-01-06 10:29:00", "2020-01-06 10:30:00", "2020-01-06 10:31:00", "2020-01-06 10:32:00", "2020-01-06 10:33:00", "2020-01-06 10:34:00", "2020-01-06 10:35:00", "2020-01-06 10:36:00", "2020-01-06 10:37:00", "2020-01-06 10:38:00", "2020-01-06 10:39:00", "2020-01-06 10:40:00", "2020-01-06 10:41:00", "2020-01-06 10:42:00", "2020-01-06 10:43:00", "2020-01-06 10:44:00", "2020-01-06 10:45:00", "2020-01-06 10:46:00", "2020-01-06 10:47:00", "2020-01-06 10:48:00", "2020-01-06 10:49:00", "2020-01-06 10:50:00", "2020-01-06 10:51:00", "2020-01-06 10:52:00", "2020-01-06 10:53:00", "2020-01-06 10:54:00", "2020-01-06 10:55:00", "2020-01-06 10:56:00", "2020-01-06 10:57:00", "2020-01-06 10:58:00", "2020-01-06 10:59:00", "2020-01-06 11:00:00", "2020-01-06 11:01:00", "2020-01-06 11:02:00", "2020-01-06 11:03:00", "2020-01-06 11:04:00", "2020-01-06 11:05:00", "2020-01-06 11:06:00", "2020-01-06 11:07:00", "2020-01-06 11:08:00", "2020-01-06 11:09:00", "2020-01-06 11:10:00", "2020-01-06 11:11:00", "2020-01-06 11:12:00", "2020-01-06 11:13:00", "2020-01-06 11:14:00", "2020-01-06 11:15:00", "2020-01-06 11:16:00", "2020-01-06 11:17:00", "2020-01-06 11:18:00", "2020-01-06 11:19:00", "2020-01-06 11:20:00", "2020-01-06 11:21:00", "2020-01-06 11:22:00", "2020-01-06 11:23:00", "2020-01-06 11:24:00", "2020-01-06 11:25:00", "2020-01-06 11:26:00", "2020-01-06 11:27:00", "2020-01-06 11:28:00", "2020-01-06 11:29:00", "2020-01-06 11:30:00", "2020-01-06 11:31:00", "2020-01-06 11:32:00", "2020-01-06 11:33:00", "2020-01-06 11:34:00", "2020-01-06 11:35:00", "2020-01-06 11:36:00", "2020-01-06 11:37:00", "2020-01-06 11:38:00", "2020-01-06 11:39:00", "2020-01-06 11:40:00", "2020-01-06 11:41:00", "2020-01-06 11:42:00", "2020-01-06 11:43:00", "2020-01-06 11:44:00", "2020-01-06 11:45:00", "2020-01-06 11:46:00", "2020-01-06 11:47:00", "2020-01-06 11:48:00", "2020-01-06 11:49:00", "2020-01-06 11:50:00", "2020-01-06 11:51:00", "2020-01-06 11:52:00", "2020-01-06 11:53:00", "2020-01-06 11:54:00", "2020-01-06 11:55:00", "2020-01-06 11:56:00", "2020-01-06 11:57:00", "2020-01-06 11:58:00", "2020-01-06 11:59:00", "2020-01-06 12:00:00", "2020-01-06 12:01:00", "2020-01-06 12:02:00", "2020-01-06 12:03:00", "2020-01-06 12:04:00", "2020-01-06 12:05:00", "2020-01-06 12:06:00", "2020-01-06 12:07:00", "2020-01-06 12:08:00", "2020-01-06 12:09:00", "2020-01-06 12:10:00", "2020-01-06 12:11:00", "2020-01-06 12:12:00", "2020-01-06 12:13:00", "2020-01-06 12:14:00", "2020-01-06 12:15:00", "2020-01-06 12:16:00", "2020-01-06 12:17:00", "2020-01-06 12:18:00", "2020-01-06 12:19:00", "2020-01-06 12:20:00", "2020-01-06 12:21:00", "2020-01-06 12:22:00", "2020-01-06 12:23:00", "2020-01-06 12:24:00", "2020-01-06 12:25:00", "2020-01-06 12:26:00", "2020-01-06 12:27:00", "2020-01-06 12:28:00", "2020-01-06 12:29:00", "2020-01-06 12:30:00", "2020-01-06 12:31:00", "2020-01-06 12:32:00", "2020-01-06 12:33:00", "2020-01-06 12:34:00", "2020-01-06 12:35:00", "2020-01-06 12:36:00", "2020-01-06 12:37:00", "2020-01-06 12:38:00", "2020-01-06 12:39:00", "2020-01-06 12:40:00", "2020-01-06 12:41:00", "2020-01-06 12:42:00", "2020-01-06 12:43:00", "2020-01-06 12:44:00", "2020-01-06 12:45:00", "2020-01-06 12:46:00", "2020-01-06 12:47:00", "2020-01-06 12:48:00", "2020-01-06 12:49:00", "2020-01-06 12:50:00", "2020-01-06 12:51:00", "2020-01-06 12:52:00", "2020-01-06 12:53:00", "2020-01-06 12:54:00", "2020-01-06 12:55:00", "2020-01-06 12:56:00", "2020-01-06 12:57:00", "2020-01-06 12:58:00", "2020-01-06 12:59:00", "2020-01-06 13:00:00", "2020-01-06 13:01:00", "2020-01-06 13:02:00", "2020-01-06 13:03:00", "2020-01-06 13:04:00", "2020-01-06 13:05:00", "2020-01-06 13:06:00", "2020-01-06 13:07:00", "2020-01-06 13:08:00", "2020-01-06 13:09:00", "2020-01-06 13:10:00", "2020-01-06 13:11:00", "2020-01-06 13:12:00", "2020-01-06 13:13:00", "2020-01-06 13:14:00", "2020-01-06 13:15:00", "2020-01-06 13:16:00", "2020-01-06 13:17:00", "2020-01-06 13:18:00", "2020-01-06 13:19:00", "2020-01-06 13:20:00", "2020-01-06 13:21:00", "2020-01-06 13:22:00", "2020-01-06 13:23:00", "2020-01-06 13:24:00", "2020-01-06 13:25:00", "2020-01-06 13:26:00", "2020-01-06 13:27:00", "2020-01-06 13:28:00", "2020-01-06 13:29:00", "2020-01-06 13:30:00", "2020-01-06 13:31:00", "2020-01-06 13:32:00", "2020-01-06 13:33:00", "2020-01-06 13:34:00", "2020-01-06 13:35:00", "2020-01-06 13:36:00", "2020-01-06 13:37:00", "2020-01-06 13:38:00", "2020-01-06 13:39:00", "2020-01-06 13:40:00", "2020-01-06 13:41:00", "2020-01-06 13:42:00", "2020-01-06 13:43:00", "2020-01-06 13:44:00", "2020-01-06 13:45:00", "2020-01-06 13:46:00", "2020-01-06 13:47:00", "2020-01-06 13:48:00", "2020-01-06 13:49:00", "2020-01-06 13:50:00", "2020-01-06 13:51:00", "2020-01-06 13:52:00", "2020-01-06 13:53:00", "2020-01-06 13:54:00", "2020-01-06 13:55:00", "2020-01-06 13:56:00", "2020-01-06 13:57:00", "2020-01-06 13:58:00", "2020-01-06 13:59:00", "2020-01-06 14:00:00", "2020-01-06 14:01:00", "2020-01-06 14:02:00", "2020-01-06 14:03:00", "2020-01-06 14:04:00", "2020-01-06 14:05:00", "2020-01-06 14:06:00", "2020-01-06 14:07:00", "2020-01-06 14:08:00", "2020-01-06 14:09:00", "2020-01-06 14:10:00", "2020-01-06 14:11:00", "2020-01-06 14:12:00", "2020-01-06 14:13:00", "2020-01-06 14:14:00", "2020-01-06 14:15:00", "2020-01-06 14:16:00", "2020-01-06 14:17:00", "2020-01-06 14:18:00", "2020-01-06 14:19:00", "2020-01-06 14:20:00", "2020-01-06 14:21:00", "2020-01-06 14:22:00", "2020-01-06 14:23:00", "2020-01-06 14:24:00", "2020-01-06 14:25:00", "2020-01-06 14:26:00", "2020-01-06 14:27:00", "2020-01-06 14:28:00", "2020-01-06 14:29:00", "2020-01-06 14:30:00", "2020-01-06 14:31:00", "2020-01-06 14:32:00", "2020-01-06 14:33:00", "2020-01-06 14:34:00", "2020-01-06 14:35:00", "2020-01-06 14:36:00", "2020-01-06 14:37:00", "2020-01-06 14:38:00", "2020-01-06 14:39:00", "2020-01-06 14:40:00", "2020-01-06 14:41:00", "2020-01-06 14:42:00", "2020-01-06 14:43:00", "2020-01-06 14:44:00", "2020-01-06 14:45:00", "2020-01-06 14:46:00", "2020-01-06 14:47:00", "2020-01-06 14:48:00", "2020-01-06 14:49:00", "2020-01-06 14:50:00", "2020-01-06 14:51:00", "2020-01-06 14:52:00", "2020-01-06 14:53:00", "2020-01-06 14:54:00", "2020-01-06 14:55:00", "2020-01-06 14:56:00", "2020-01-06 14:57:00", "2020-01-06 14:58:00", "2020-01-06 14:59:00", "2020-01-06 15:00:00", "2020-01-06 15:01:00", "2020-01-06 15:02:00", "2020-01-06 15:03:00", "2020-01-06 15:04:00", "2020-01-06 15:05:00", "2020-01-06 15:06:00", "2020-01-06 15:07:00", "2020-01-06 15:08:00", "2020-01-06 15:09:00", "2020-01-06 15:10:00", "2020-01-06 15:11:00", "2020-01-06 15:12:00", "2020-01-06 15:13:00", "2020-01-06 15:14:00", "2020-01-06 15:15:00", "2020-01-06 15:16:00", "2020-01-06 15:17:00", "2020-01-06 15:18:00", "2020-01-06 15:19:00", "2020-01-06 15:20:00", "2020-01-06 15:21:00", "2020-01-06 15:22:00", "2020-01-06 15:23:00", "2020-01-06 15:24:00", "2020-01-06 15:25:00", "2020-01-06 15:26:00", "2020-01-06 15:27:00", "2020-01-06 15:28:00", "2020-01-06 15:29:00", "2020-01-06 15:30:00", "2020-01-06 15:31:00", "2020-01-06 15:32:00", "2020-01-06 15:33:00", "2020-01-06 15:34:00", "2020-01-06 15:35:00", "2020-01-06 15:36:00", "2020-01-06 15:37:00", "2020-01-06 15:38:00", "2020-01-06 15:39:00", "2020-01-06 15:40:00", "2020-01-06 15:41:00", "2020-01-06 15:42:00", "2020-01-06 15:43:00", "2020-01-06 15:44:00", "2020-01-06 15:45:00", "2020-01-06 15:46:00", "2020-01-06 15:47:00", "2020-01-06 15:48:00", "2020-01-06 15:49:00", "2020-01-06 15:50:00", "2020-01-06 15:51:00", "2020-01-06 15:52:00", "2020-01-06 15:53:00", "2020-01-06 15:54:00", "2020-01-06 15:55:00", "2020-01-06 15:56:00", "2020-01-06 15:57:00", "2020-01-06 15:58:00", "2020-01-06 15:59:00"],
                    ["2019-01-01 00:00:00", "2019-01-02 00:00:00", "2019-01-03 00:00:00", "2019-01-04 00:00:00", "2019-01-07 00:00:00", "2019-01-08 00:00:00", "2019-01-09 00:00:00", "2019-01-10 00:00:00", "2019-01-11 00:00:00", "2019-01-14 00:00:00", "2019-01-15 00:00:00", "2019-01-16 00:00:00", "2019-01-17 00:00:00", "2019-01-18 00:00:00", "2019-01-21 00:00:00", "2019-01-22 00:00:00", "2019-01-23 00:00:00", "2019-01-24 00:00:00", "2019-01-25 00:00:00", "2019-01-28 00:00:00", "2019-01-29 00:00:00", "2019-01-30 00:00:00", "2019-01-31 00:00:00", "2019-02-01 00:00:00", "2019-02-04 00:00:00", "2019-02-05 00:00:00", "2019-02-06 00:00:00", "2019-02-07 00:00:00", "2019-02-08 00:00:00", "2019-02-11 00:00:00", "2019-02-12 00:00:00", "2019-02-13 00:00:00", "2019-02-14 00:00:00", "2019-02-15 00:00:00", "2019-02-18 00:00:00", "2019-02-19 00:00:00", "2019-02-20 00:00:00", "2019-02-21 00:00:00", "2019-02-22 00:00:00", "2019-02-25 00:00:00", "2019-02-26 00:00:00", "2019-02-27 00:00:00", "2019-02-28 00:00:00", "2019-03-01 00:00:00", "2019-03-04 00:00:00", "2019-03-05 00:00:00", "2019-03-06 00:00:00", "2019-03-07 00:00:00", "2019-03-08 00:00:00", "2019-03-11 01:00:00", "2019-03-12 01:00:00", "2019-03-13 01:00:00", "2019-03-14 01:00:00", "2019-03-15 01:00:00", "2019-03-18 01:00:00", "2019-03-19 01:00:00", "2019-03-20 01:00:00", "2019-03-21 01:00:00", "2019-03-22 01:00:00", "2019-03-25 01:00:00", "2019-03-26 01:00:00", "2019-03-27 01:00:00", "2019-03-28 01:00:00", "2019-03-29 01:00:00", "2019-04-01 01:00:00", "2019-04-02 01:00:00", "2019-04-03 01:00:00", "2019-04-04 01:00:00", "2019-04-05 01:00:00", "2019-04-08 01:00:00", "2019-04-09 01:00:00", "2019-04-10 01:00:00", "2019-04-11 01:00:00", "2019-04-12 01:00:00", "2019-04-15 01:00:00", "2019-04-16 01:00:00", "2019-04-17 01:00:00", "2019-04-18 01:00:00", "2019-04-19 01:00:00", "2019-04-22 01:00:00", "2019-04-23 01:00:00", "2019-04-24 01:00:00", "2019-04-25 01:00:00", "2019-04-26 01:00:00", "2019-04-29 01:00:00", "2019-04-30 01:00:00", "2019-05-01 01:00:00", "2019-05-02 01:00:00", "2019-05-03 01:00:00", "2019-05-06 01:00:00", "2019-05-07 01:00:00", "2019-05-08 01:00:00", "2019-05-09 01:00:00", "2019-05-10 01:00:00", "2019-05-13 01:00:00", "2019-05-14 01:00:00", "2019-05-15 01:00:00", "2019-05-16 01:00:00", "2019-05-17 01:00:00", "2019-05-20 01:00:00", "2019-05-21 01:00:00", "2019-05-22 01:00:00", "2019-05-23 01:00:00", "2019-05-24 01:00:00", "2019-05-27 01:00:00", "2019-05-28 01:00:00", "2019-05-29 01:00:00", "2019-05-30 01:00:00", "2019-05-31 01:00:00", "2019-06-03 01:00:00", "2019-06-04 01:00:00", "2019-06-05 01:00:00", "2019-06-06 01:00:00", "2019-06-07 01:00:00", "2019-06-10 01:00:00", "2019-06-11 01:00:00", "2019-06-12 01:00:00", "2019-06-13 01:00:00", "2019-06-14 01:00:00", "2019-06-17 01:00:00", "2019-06-18 01:00:00", "2019-06-19 01:00:00", "2019-06-20 01:00:00", "2019-06-21 01:00:00", "2019-06-24 01:00:00", "2019-06-25 01:00:00", "2019-06-26 01:00:00", "2019-06-27 01:00:00", "2019-06-28 01:00:00", "2019-07-01 01:00:00", "2019-07-02 01:00:00", "2019-07-03 01:00:00", "2019-07-04 01:00:00", "2019-07-05 01:00:00", "2019-07-08 01:00:00", "2019-07-09 01:00:00", "2019-07-10 01:00:00", "2019-07-11 01:00:00", "2019-07-12 01:00:00", "2019-07-15 01:00:00", "2019-07-16 01:00:00", "2019-07-17 01:00:00", "2019-07-18 01:00:00", "2019-07-19 01:00:00", "2019-07-22 01:00:00", "2019-07-23 01:00:00", "2019-07-24 01:00:00", "2019-07-25 01:00:00", "2019-07-26 01:00:00", "2019-07-29 01:00:00", "2019-07-30 01:00:00", "2019-07-31 01:00:00", "2019-08-01 01:00:00", "2019-08-02 01:00:00", "2019-08-05 01:00:00", "2019-08-06 01:00:00", "2019-08-07 01:00:00", "2019-08-08 01:00:00", "2019-08-09 01:00:00", "2019-08-12 01:00:00", "2019-08-13 01:00:00", "2019-08-14 01:00:00", "2019-08-15 01:00:00", "2019-08-16 01:00:00", "2019-08-19 01:00:00", "2019-08-20 01:00:00", "2019-08-21 01:00:00", "2019-08-22 01:00:00", "2019-08-23 01:00:00", "2019-08-26 01:00:00", "2019-08-27 01:00:00", "2019-08-28 01:00:00", "2019-08-29 01:00:00", "2019-08-30 01:00:00", "2019-09-02 01:00:00", "2019-09-03 01:00:00", "2019-09-04 01:00:00", "2019-09-05 01:00:00", "2019-09-06 01:00:00", "2019-09-09 01:00:00", "2019-09-10 01:00:00", "2019-09-11 01:00:00", "2019-09-12 01:00:00", "2019-09-13 01:00:00", "2019-09-16 01:00:00", "2019-09-17 01:00:00", "2019-09-18 01:00:00", "2019-09-19 01:00:00", "2019-09-20 01:00:00", "2019-09-23 01:00:00", "2019-09-24 01:00:00", "2019-09-25 01:00:00", "2019-09-26 01:00:00", "2019-09-27 01:00:00", "2019-09-30 01:00:00", "2019-10-01 01:00:00", "2019-10-02 01:00:00", "2019-10-03 01:00:00", "2019-10-04 01:00:00", "2019-10-07 01:00:00", "2019-10-08 01:00:00", "2019-10-09 01:00:00", "2019-10-10 01:00:00", "2019-10-11 01:00:00", "2019-10-14 01:00:00", "2019-10-15 01:00:00", "2019-10-16 01:00:00", "2019-10-17 01:00:00", "2019-10-18 01:00:00", "2019-10-21 01:00:00", "2019-10-22 01:00:00", "2019-10-23 01:00:00", "2019-10-24 01:00:00", "2019-10-25 01:00:00", "2019-10-28 01:00:00", "2019-10-29 01:00:00", "2019-10-30 01:00:00", "2019-10-31 01:00:00", "2019-11-01 01:00:00", "2019-11-04 00:00:00", "2019-11-05 00:00:00", "2019-11-06 00:00:00", "2019-11-07 00:00:00", "2019-11-08 00:00:00", "2019-11-11 00:00:00", "2019-11-12 00:00:00", "2019-11-13 00:00:00", "2019-11-14 00:00:00", "2019-11-15 00:00:00", "2019-11-18 00:00:00", "2019-11-19 00:00:00", "2019-11-20 00:00:00", "2019-11-21 00:00:00", "2019-11-22 00:00:00", "2019-11-25 00:00:00", "2019-11-26 00:00:00", "2019-11-27 00:00:00", "2019-11-28 00:00:00", "2019-11-29 00:00:00", "2019-12-02 00:00:00", "2019-12-03 00:00:00", "2019-12-04 00:00:00", "2019-12-05 00:00:00", "2019-12-06 00:00:00", "2019-12-09 00:00:00", "2019-12-10 00:00:00", "2019-12-11 00:00:00", "2019-12-12 00:00:00", "2019-12-13 00:00:00", "2019-12-16 00:00:00", "2019-12-17 00:00:00", "2019-12-18 00:00:00", "2019-12-19 00:00:00", "2019-12-20 00:00:00", "2019-12-23 00:00:00", "2019-12-24 00:00:00", "2019-12-25 00:00:00", "2019-12-26 00:00:00", "2019-12-27 00:00:00", "2019-12-30 00:00:00", "2019-12-31 00:00:00", "2020-01-01 00:00:00", "2020-01-02 00:00:00", "2020-01-03 00:00:00", "2020-01-06 00:00:00", "2020-01-07 00:00:00", "2020-01-08 00:00:00", "2020-01-09 00:00:00", "2020-01-10 00:00:00"],
                    ["2017-01-02 00:00:00", "2017-01-09 00:00:00", "2017-01-16 00:00:00", "2017-01-23 00:00:00", "2017-01-30 00:00:00", "2017-02-06 00:00:00", "2017-02-13 00:00:00", "2017-02-20 00:00:00", "2017-02-27 00:00:00", "2017-03-06 00:00:00", "2017-03-13 01:00:00", "2017-03-20 01:00:00", "2017-03-27 01:00:00", "2017-04-03 01:00:00", "2017-04-10 01:00:00", "2017-04-17 01:00:00", "2017-04-24 01:00:00", "2017-05-01 01:00:00", "2017-05-08 01:00:00", "2017-05-15 01:00:00", "2017-05-22 01:00:00", "2017-05-29 01:00:00", "2017-06-05 01:00:00", "2017-06-12 01:00:00", "2017-06-19 01:00:00", "2017-06-26 01:00:00", "2017-07-03 01:00:00", "2017-07-10 01:00:00", "2017-07-17 01:00:00", "2017-07-24 01:00:00", "2017-07-31 01:00:00", "2017-08-07 01:00:00", "2017-08-14 01:00:00", "2017-08-21 01:00:00", "2017-08-28 01:00:00", "2017-09-04 01:00:00", "2017-09-11 01:00:00", "2017-09-18 01:00:00", "2017-09-25 01:00:00", "2017-10-02 01:00:00", "2017-10-09 01:00:00", "2017-10-16 01:00:00", "2017-10-23 01:00:00", "2017-10-30 01:00:00", "2017-11-06 00:00:00", "2017-11-13 00:00:00", "2017-11-20 00:00:00", "2017-11-27 00:00:00", "2017-12-04 00:00:00", "2017-12-11 00:00:00", "2017-12-18 00:00:00", "2017-12-25 00:00:00", "2018-01-01 00:00:00", "2018-01-08 00:00:00", "2018-01-15 00:00:00", "2018-01-22 00:00:00", "2018-01-29 00:00:00", "2018-02-05 00:00:00", "2018-02-12 00:00:00", "2018-02-19 00:00:00", "2018-02-26 00:00:00", "2018-03-05 00:00:00", "2018-03-12 01:00:00", "2018-03-19 01:00:00", "2018-03-26 01:00:00", "2018-04-02 01:00:00", "2018-04-09 01:00:00", "2018-04-16 01:00:00", "2018-04-23 01:00:00", "2018-04-30 01:00:00", "2018-05-07 01:00:00", "2018-05-14 01:00:00", "2018-05-21 01:00:00", "2018-05-28 01:00:00", "2018-06-04 01:00:00", "2018-06-11 01:00:00", "2018-06-18 01:00:00", "2018-06-25 01:00:00", "2018-07-02 01:00:00", "2018-07-09 01:00:00", "2018-07-16 01:00:00", "2018-07-23 01:00:00", "2018-07-30 01:00:00", "2018-08-06 01:00:00", "2018-08-13 01:00:00", "2018-08-20 01:00:00", "2018-08-27 01:00:00", "2018-09-03 01:00:00", "2018-09-10 01:00:00", "2018-09-17 01:00:00", "2018-09-24 01:00:00", "2018-10-01 01:00:00", "2018-10-08 01:00:00", "2018-10-15 01:00:00", "2018-10-22 01:00:00", "2018-10-29 01:00:00", "2018-11-05 00:00:00", "2018-11-12 00:00:00", "2018-11-19 00:00:00", "2018-11-26 00:00:00", "2018-12-03 00:00:00", "2018-12-10 00:00:00", "2018-12-17 00:00:00", "2018-12-24 00:00:00", "2018-12-31 00:00:00", "2019-01-07 00:00:00", "2019-01-14 00:00:00", "2019-01-21 00:00:00", "2019-01-28 00:00:00", "2019-02-04 00:00:00", "2019-02-11 00:00:00", "2019-02-18 00:00:00", "2019-02-25 00:00:00", "2019-03-04 00:00:00", "2019-03-11 01:00:00", "2019-03-18 01:00:00", "2019-03-25 01:00:00", "2019-04-01 01:00:00", "2019-04-08 01:00:00", "2019-04-15 01:00:00", "2019-04-22 01:00:00", "2019-04-29 01:00:00", "2019-05-06 01:00:00", "2019-05-13 01:00:00", "2019-05-20 01:00:00", "2019-05-27 01:00:00", "2019-06-03 01:00:00", "2019-06-10 01:00:00", "2019-06-17 01:00:00", "2019-06-24 01:00:00", "2019-07-01 01:00:00", "2019-07-08 01:00:00", "2019-07-15 01:00:00", "2019-07-22 01:00:00", "2019-07-29 01:00:00", "2019-08-05 01:00:00", "2019-08-12 01:00:00", "2019-08-19 01:00:00", "2019-08-26 01:00:00", "2019-09-02 01:00:00", "2019-09-09 01:00:00", "2019-09-16 01:00:00", "2019-09-23 01:00:00", "2019-09-30 01:00:00", "2019-10-07 01:00:00", "2019-10-14 01:00:00", "2019-10-21 01:00:00", "2019-10-28 01:00:00", "2019-11-04 00:00:00", "2019-11-11 00:00:00", "2019-11-18 00:00:00", "2019-11-25 00:00:00", "2019-12-02 00:00:00", "2019-12-09 00:00:00", "2019-12-16 00:00:00", "2019-12-23 00:00:00", "2019-12-30 00:00:00", "2020-01-06 00:00:00", "2020-01-10 00:00:00"]
        ], indexOfStockSeries: 3),
        
        ChartModel(chartType: .stock, data: [[16.52, 15.50, 18.67, 16.70, 16.90]],
                   titlesForCategory: [["2020-01-06 10:00:00", "2020-01-06 10:30:00", "2020-01-06 11:00:00", "2020-01-06 11:30:00", "2020-01-06 12:00:00"]]),
        
        ChartModel(chartType: .stock,
                   data: [[16.52, 16.50, 0]],
                   titlesForCategory: [["2020-01-06 09:30:00", "2020-01-06 10:00:00", "2020-01-06 15:30:00"]]),
        
        // nil values
        ChartModel(chartType: .stock, data3d: [[[nil, nil, 19.21, 20.00, 20000], [16.52, 17.20, 17.48, 22.21, 60000], [18.50, 17.20, 17.48, 22.21, 60000], [24.50, 17.20, 17.48, 22.21, 60000]]], titlesForCategory: [["2020-01-06 09:30:00", "2020-01-06 10:00:00", "2020-01-06 10:30:00", "2020-01-06 11:00:00"]]),
        
        ChartModel(chartType: .stock, data: [[16.52, 15.50, 18.67, 16.70, 16.90, 17.00, 16.32, 15.22, 16.89, 18.01, 18.22, 17.76, 16.82, 17.66]], titlesForCategory: [["2020-01-06 09:30:00", "2020-01-06 10:00:00", "2020-01-06 10:30:00", "2020-01-06 11:00:00", "2020-01-06 11:30:00", "2020-01-06 12:00:00", "2020-01-06 12:30:00", "2020-01-06 13:00:00", "2020-01-06 13:30:00", "2020-01-06 14:00:00", "2020-01-06 14:30:00", "2020-01-06 15:00:00", "2020-01-06 15:30:00", "2020-01-06 15:59:00"]]),
        
        ChartModel(chartType: .stock, data: [[nil]]),
        
        ChartModel(chartType: .stock, data: [[]])
    ]
    
    /// descriptions for stock models
    public static let stockModelsDesc = ["includes intraday: 1min, one day: 1min, 1year:1day, 3years:1week, last series is selected", "simple one", "intraday", "3 dimention data, first value is nil", "typical one", "data: [[nil]]", "data = [[]]"]
    
    /// all test models
    public static let allCases = [stockModels, lineModels, waterfallModels, donutModels, columnModels, harveyBallModels, radialModels, bulletModles].flatMap { $0 }
}

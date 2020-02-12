//
//  Tests.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/11/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI

struct Tests {
    static let bulletModles = [
        ChartModel(chartType: .micro_bullet,
                   data: [[120, 100, 110], [0, 50, 150, 200]],
                   colorsForCategory: [[.green, .green, .red, .blue]]),
        
        ChartModel(chartType: .micro_bullet,
                   data: [[35, 50, 70], [0, 20, 50, 100]],
                   colorsForCategory: [[.red, .yellow, .yellow, .red]])
    ]
    
    static let columnModels = [
        ChartModel(chartType: .micro_column,
                   data: [[200, 170, 165, 143, 166, 112, 110]],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]],
                   colorsForCategory: [[Color.green, Color.green, Color.red, Color.blue, Color.green]],
                   titlesForAxis: nil,
                   labelsForDimension: [["$200K", "avg", "$165K", "$143K", "$166K", "$112K", "$110K"]]),
        ChartModel(chartType: .micro_column,
                   data: [[200, 170, -165, 143, 166, 112, 110]],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]],
                   colorsForCategory: [[Color.green, Color.green, Color.red, Color.blue, Color.green]],
                   titlesForAxis: nil,
                   labelsForDimension: [["$200K", "avg", "-165K", "$143K", "$166K", "$112K", "$110K"]]),
        ChartModel(chartType: .micro_column,
                   data: [[60, 80, 100, 60, 55, 15]],
                   titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun"]],
                   colorsForCategory: [[Color.green, Color.green, Color.red, Color.blue]])
    ]
    
    static let harveyBallModels = [
        ChartModel(chartType: .micro_harvey_ball,
                   data: [[360], [8]],
                   titlesForCategory: [["360 Mrd"], ["8 Mrd"]],
                   colorsForCategory: [[Color.gray], [Color.green]]),
        ChartModel(chartType: .micro_harvey_ball,
                   data: [[360], [352]],
                   titlesForCategory: [["360 Mrd"], ["352 Mrd"]],
                   colorsForCategory: [[Color.gray], [Color.blue]]),
        ChartModel(chartType: .micro_harvey_ball,
                   data: [[360], [400]],
                   titlesForCategory: [["360 Mrd"], ["400 Mrd"]],
                   colorsForCategory: [[Color.gray], [Color.red]]),
        ChartModel(chartType: .micro_harvey_ball,
                   data: [[100], [8]],
                   titlesForCategory: [["100 Mrd"], [""]],
                   colorsForCategory: [[Color.gray], [Color.purple]])
    ]
    
    static let radialModels = [
        ChartModel(chartType: .micro_radial, data: [[45]], colorsForCategory: [[Color.blue]]),
        ChartModel(chartType: .micro_radial, data: [[99.9]], colorsForCategory: [[Color.green]]),
        ChartModel(chartType: .micro_radial, data: [[0.1]], colorsForCategory: [[Color.red]]),
        ChartModel(chartType: .micro_radial, data: [[0]], colorsForCategory: [[Color.red]])
    ]
    
    static let stockModels = [
        ChartModel(chartType: .stock, data: [[16.52, 16.50, 16.67, 16.70, 16.90, 17.00, 16.32, 15.22, 16.89, 17.01, 18.22, 17.76, 17.82, 17.66]], titlesForCategory: [["2020-01-06 09:30:00", "2020-01-06 10:00:00", "2020-01-06 10:30:00", "2020-01-06 11:00:00", "2020-01-06 11:30:00", "2020-01-06 12:00:00", "2020-01-06 12:30:00", "2020-01-06 13:00:00", "2020-01-06 13:30:00", "2020-01-06 14:00:00", "2020-01-06 14:30:00", "2020-01-06 15:00:00", "2020-01-06 15:30:00", "2020-01-06 15:59:00"]]),
        
        ChartModel(chartType: .stock, data: [[16.52, 15.50, 18.67, 16.70, 16.90, 17.00, 16.32, 15.22, 16.89, 18.01, 18.22, 17.76, 16.82, 17.66]], titlesForCategory: [["2020-01-06 09:30:00", "2020-01-06 10:00:00", "2020-01-06 10:30:00", "2020-01-06 11:00:00", "2020-01-06 11:30:00", "2020-01-06 12:00:00", "2020-01-06 12:30:00", "2020-01-06 13:00:00", "2020-01-06 13:30:00", "2020-01-06 14:00:00", "2020-01-06 14:30:00", "2020-01-06 15:00:00", "2020-01-06 15:30:00", "2020-01-06 15:59:00"]])
    ]
    
    public static let allCases = [bulletModles, columnModels, harveyBallModels, radialModels, stockModels].flatMap { $0 }
}


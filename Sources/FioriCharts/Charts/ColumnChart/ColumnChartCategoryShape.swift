//
//  ColumnChartCategoryShape.swift
//  
//
//  Created by Xu, Sheng on 12/9/20.
//

import SwiftUI

struct ColumnChartCategoryShape: Shape {
    let chartType: ChartType
    let plotBaselinePosition: CGFloat
    let path: [[[Path]]]
    let seriesIndex: Int
    let categoryIndex: Int
    var animateScale: CGFloat
    
    //    var animatableData: CGFloat {
    //        get {
    //            animateScale
    //        }
    //        set {
    //            animateScale = newValue
    //        }
    //    }
    
    func path(in rect: CGRect) -> Path {
        guard seriesIndex >= 0, categoryIndex >= 0, path.count > seriesIndex, !path[seriesIndex].isEmpty, path[seriesIndex].count > categoryIndex, !path[seriesIndex][categoryIndex].isEmpty else {
            return Path()
        }
        
        var animateWidth: CGFloat = rect.size.width
        var animateHeight: CGFloat = rect.size.height
        let baselinePosition: CGFloat = 1 - plotBaselinePosition
        let animTransform: CGAffineTransform
        
        if chartType == .bar || chartType == .stackedBar {
            animateWidth = rect.size.width * animateScale
            animTransform = CGAffineTransform(translationX: (1 - baselinePosition) * (rect.size.width - animateWidth), y: 0)
        } else { // column & stacked column chart
            animateHeight = rect.size.height * animateScale
            animTransform = CGAffineTransform(translationX: 0, y: baselinePosition * (rect.size.height - animateHeight))
        }
        
        return path[seriesIndex][categoryIndex][0]
            .applying(CGAffineTransform(scaleX: animateWidth, y: animateHeight))
            .applying(animTransform)
    }
}

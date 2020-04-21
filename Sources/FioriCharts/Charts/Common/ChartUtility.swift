//
//  ChartUtility.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/8/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI

class ChartUtility {
    static func calculateRangeProperties(_ model: ChartModel, secondaryRange: Bool)
        {
            if model.data.count == 0 || model.data.first?.count == 0 {
                return
            }
            
            let allowLooseLabel = false
        
            let allIndexs = IndexSet(integersIn: 0 ..< model.data.count)
            let indexes = secondaryRange ? model.indexesOfSecondaryValueAxis.sorted() : model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs).sorted()
            
            if indexes.count == 0 {
                return
            }
            
            let dataRange: ClosedRange<Double> = indexes.reduce(model.ranges[indexes[0]]) { (result, i) -> ClosedRange<Double> in
                let dmin = min(result.lowerBound, model.ranges[i].lowerBound)
                let dmax = max(result.upperBound, model.ranges[i].upperBound)
                return dmin...dmax
            }
    //        let dataRange: ClosedRange<Double> = model.ranges.reduce(model.ranges.first ?? (0...1)) { (result, range) -> ClosedRange<Double> in
    //            let dmin = min(result.lowerBound, range.lowerBound)
    //            let dmax = max(result.upperBound, range.upperBound)
    //            return dmin...dmax
    //        }
            
            var fudgeRange: Bool
            
            var dmin = dataRange.lowerBound
            var dmax = dataRange.upperBound
            
            switch model.chartType {
            case .bubble, .scatter, .stackedColumn, .waterfall, .combo:
                fudgeRange = true
                
            default:
                fudgeRange = false
            }
            
            if secondaryRange
            {
                //
                // Check if explicit min is defined, otherwise use data min.
                //
                /*if (!isnan(context->secondaryExplicitMinimumValue))
                 {
                 min = context->secondaryExplicitMinimumValue
                 }
                 
                 //
                 // Check if explicit max is defined, otherwise use data max.
                 //
                 if (!isnan(context->secondaryExplicitMaximumValue))
                 {
                 max = context->secondaryExplicitMaximumValue
                 }
                 
                 //
                 // Check if we need to clamp the baseline at zero and adjust accordingly.
                 //
                 if (context->secondaryValueAxisBaselineClampedAtZero)
                 {
                 if (min >= 0.0 && max >= min)
                 {
                 min = 0.0
                 }
                 else if (max <= 0.0 && min <= max)
                 {
                 max = 0.0
                 }
                 }
                 
                 //
                 // Create value axis tick properties based on min/max and if we need to adjust to nice values.
                 //
                 if (allowLooseLabel)
                 {
                 bool useLooseLabels = true
                 
                 context->secondaryValueAxisBaselineValue = max < 0.0 ? max : fmax(0.0, min)
                 
                 // If the baseline is at zero we aim to always show the baseline with a tick.
                 if (context->secondaryValueAxisBaselineValue == 0.0)
                 {
                 useLooseLabels = false
                 }
                 
                 MCAxisContextCreateTicks(context->secondaryValueAxisContext, min, max, context->desiredYAxisTickCount, useLooseLabels, fudgeRange, context->adjustToNiceValues)
                 }
                 else
                 {
                 MCAxisContextCreateTicks(context->secondaryValueAxisContext, min, max, context->desiredYAxisTickCount, false, fudgeRange, context->adjustToNiceValues)
                 }*/
            }
            else
            {
                //
                // Check if explicit min is defined, otherwise use data min.
                //
                if let emin = model.numericAxis.explicitMin {
                    dmin = emin
                }
                
                //
                // Check if explicit max is defined, otherwise use data max.
                //
                if let emax = model.numericAxis.explicitMax {
                    dmax = emax
                }
                
                //
                // Check if we need to clamp the baseline at zero and adjust accordingly.
                //
                if model.numericAxis.isZeroBased
                {
                    if (dmin >= 0.0 && dmax >= dmin)
                    {
                        dmin = 0.0
                    }
                    else if (dmax <= 0.0 && dmin <= dmax)
                    {
                        dmax = 0.0
                    }
                }
                
                //
                // Create value axis tick properties based on min/max and if we need to adjust to nice values.
                //
                if (allowLooseLabel)
                {
                    var useLooseLabels = true
                    
                    let valueAxisBaselineValue: Double = dmax < 0.0 ? dmax : max(0.0, dmin)
                    
                    // If the baseline is at zero we aim to always show the baseline with a tick.
                    if valueAxisBaselineValue == 0.0
                    {
                        useLooseLabels = false
                    }
                    
                    axisCreateTicks(model, rangeStart: dmin, rangeEnd: dmax, desiredTickCount: UInt(model.numberOfGridlines + 1), looseLabels: useLooseLabels, fudgeRange: fudgeRange, adjustToNiceValues: model.adjustToNiceValues)
                }
                else
                {
                    axisCreateTicks(model, rangeStart: dmin, rangeEnd: dmax, desiredTickCount: UInt(model.numberOfGridlines + 1), looseLabels: false, fudgeRange: fudgeRange, adjustToNiceValues: model.adjustToNiceValues)
                }
            }
        }
        
        
        static func axisCreateTicks(_ model: ChartModel, rangeStart: Double, rangeEnd: Double, desiredTickCount: UInt, looseLabels: Bool, fudgeRange: Bool, adjustToNiceValues: Bool)
        {
            let Q:[Double] = [1.0, 2.0, 4.0, 5.0, 3.0, 6.0, 7.0, 8.0, 9.0]
            // As suggested in the paper but not ideal for our use cases.
            //    Q[0] = 1.0
            //    Q[1] = 5.0
            //    Q[2] = 2.0
            //    Q[3] = 2.5
            //    Q[4] = 4.0
            //    Q[5] = 3.0
            //    Q[6] = 1.2
            //    Q[7] = 1.25
            
            // Weights applied to the four optimization components (simplicity, coverage, density, and legibility)
            let w:[Double] = [0.06, 0.01, 0.1]
            // As defined in the paper but not ideal for our use cases.
            //    w[0] = 0.2
            //    w[1] = 0.25
            //    w[2] = 0.5
            
            //let desiredTickCount = 3
            let looseLabels = true
            
            axisUtilExtended(model, rangeStart, rangeEnd, desiredTickCount, Q, looseLabels, fudgeRange, w, UInt(Q.count), adjustToNiceValues)
        }
        
        struct Best {
            var lmin: Double
            var lmax: Double
            var lstep: Double
            var score: Double
        }
        
        // An Extension of Wilkinson's Algorithm for Position Tick Labels on Axes
        //
        // Enhanced version of Wilkinson's optimization-based axis labeling approach. It is described in detail in our paper. See the references.
        //
        // @param dmin minimum of the data range
        // @param dmax maximum of the data range
        // @param m number of axis labels
        // @param Q set of nice numbers
        // @param only.loose if true, the extreme labels will be outside the data range
        // @param w weights applied to the four optimization components (simplicity, coverage, density, and legibility)
        // @references
        // Talbot, J., Lin, S., Hanrahan, P. (2010) An Extension of Wilkinson's Algorithm for Positioning Tick Labels on Axes, InfoVis 2010.
        static func axisUtilExtended(_ model: ChartModel, _ dMin: Double, _ dMax: Double, _ m: UInt, _ Q: [Double], _ loose: Bool, _ fudgeRange: Bool, _ w: [Double], _ qLength: UInt, _ adjustToNiceValues: Bool)
        {
            let eps = 1e-10
            let maxIterations = 30
            
            func modFloor(_ a: Double, _ n: Double) -> Double {
                return a - n * floor(a / n)
            }
            
            // Scoring functions, including the approximations for limiting the search
            func simplicity(_ q: Double, _ j: Double, _ lmin: Double, _ lmax: Double, _ lstep: Double, _ qLength: UInt, _ index: UInt) -> Double {
                let targetIndex = max(min(index, qLength - 1), 0)
                let n = qLength
                let i = targetIndex + 1
                let v: Double = (modFloor(lmin, lstep) < eps && lmin <= 0 && lmax >= 0) ? 1 : 0
                var score: Double
                
                if (n <= 1)
                {
                    score = 1 - j + v
                }
                else
                {
                    score = 1 - Double(i - 1) / Double(n - 1) - j + v
                }
                
                return score
            }
            
            func simplicityMax(_ q: Double, _ j: Double, _ qLength: UInt, _ index: UInt) -> Double
            {
                let targetIndex = max(min(index, qLength - 1), 0)
                let n = qLength
                let i = targetIndex + 1
                let v = 1.0
                var score: Double
                
                if (n <= 1)
                {
                    score = 1 - j + v
                }
                else
                {
                    score = 1 - Double(i - 1) / Double(n - 1) - j + v
                }
                
                return score
            }
            
            func coverage(_ dmin: Double, _ dmax: Double, _ lmin: Double, _ lmax: Double) -> Double
            {
                let range = dmax - dmin
                return 1.0 - 0.5 * (pow(dmax - lmax, 2.0) + pow(dmin - lmin, 2.0)) / pow(0.1 * range, 2.0)
            }
            
            func coverageMax(_ dmin: Double, _ dmax: Double, _ span: Double) -> Double
            {
                let range = dmax - dmin
                
                if(span > range)
                {
                    let half = (span - range) / 2.0
                    return 1.0 - 0.5 * (pow(half, 2.0) + pow(half, 2.0)) / pow(0.1 * range, 2.0)
                }
                else
                {
                    return 1.0
                }
            }
            
            func density(_ k: Double, _ m: Double, _ dmin: Double, _ dmax: Double, _ lmin: Double, _ lmax: Double) -> Double
            {
                let r = (k - 1.0) / (lmax - lmin)
                let rt = (m - 1.0) / (max(lmax, dmax) - min(dmin, lmin))
                
                return 2.0 - max(r / rt, rt / r)
            }
            
            func densityMax(_ k: Double, _ m: Double) -> Double {
                if(k >= m)
                {
                    return 2.0 - (k - 1.0) / (m - 1.0)
                }
                else
                {
                    return 1.0
                }
            }
            
            var plotMinimum: Double = 0
            var plotMaximum: Double = 0
            var tickMinimum: Double = 0
            var tickMaximum: Double = 0
            var dataMinimum: Double = 0
            var dataMaximum: Double = 0
            var plotRange: Double = 0
            var tickRange: Double = 0
            var dataRange: Double = 0
            var plotScale: Double = 0
            var tickScale: Double = 0
            var dataScale: Double = 0
            var tickStepSize: Double = 0
            var tickValues: [Double] = []
            var tickPositions: [Double] = []
            var tickCount: UInt = 0
            
            let dmin = min(dMin, dMax)
            let dmax = dMin == dMax ? (dMax + 1): max(dMin, dMax)
            
            //        var temp: Double
            //
            //        if (dmin > dmax)
            //        {
            //            temp = dmin
            //            dmin = dmax
            //            dmax = temp
            //        }
            let plotBaselineValue: Double = dmax < 0.0 ? dmax : max(0.0, dmin)
            
            if (!adjustToNiceValues || dmax - dmin < eps)
            {
                //if the range is near the floating point limit,
                //let seq generate some equally spaced steps.
                //return seq(from=dmin, to=dmax, length.out=m)
                //return sequenceFromToByLength(dmin, dmax, m)
                
                let range: Double = dmax - dmin
                var baselineWithinPlot: Bool = dmax > 0.0 && dmin < 0.0
                if (dmin == 0 || dmax == 0)
                {
                    baselineWithinPlot = true
                }
                
                // We multiply by 0.04 to get four percent of the range, which is used for
                // minimum values in column/bar based charts, so that the minimum isn't shown
                // at the baseline (not visible).
                
                plotMinimum = fudgeRange && !baselineWithinPlot ? dmin - range * 0.04 : dmin
                plotMaximum = fudgeRange && !baselineWithinPlot ? dmax + range * 0.04 : dmax
                tickMinimum = plotMinimum
                tickMaximum = plotMaximum
                dataMinimum = dmin
                dataMaximum = dmax
                plotRange = plotMaximum - plotMinimum
                tickRange = tickMaximum - tickMinimum
                dataRange = dataMaximum - dataMinimum
                
                if (plotRange == 0)
                {
                    plotScale = 0
                }
                else
                {
                    plotScale = 1.0 / plotRange
                }
                
                if (tickRange == 0)
                {
                    tickScale = 0
                }
                else
                {
                    tickScale = 1.0 / tickRange
                }
                
                if (dataRange == 0)
                {
                    dataScale = 0
                }
                else
                {
                    dataScale = 1.0 / dataRange
                }
                
                tickStepSize = tickRange / Double(m - 1)
                tickCount = m
                
                for i in 0 ..< tickCount {
                    let tickValue = dmin + tickStepSize * Double(i)
                    tickValues.append(tickValue)
                    tickPositions.append(plotScale * (tickValue - plotMinimum))
                }
    //            let plotBaselinePosition = plotScale * (plotBaselineValue - plotMinimum)
    //            return AxisTickValues(plotMinimum: plotMinimum, plotMaximum: plotMaximum, plotBaselineValue: plotBaselineValue, plotBaselinePosition: plotBaselinePosition, tickMinimum: tickMinimum, tickMaximum: tickMaximum, dataMinimum: dataMinimum, dataMaximum: dataMaximum, plotRange: plotRange, tickRange: tickRange, dataRange: dataRange, plotScale: plotScale, tickScale: tickScale, dataScale: dataScale, tickStepSize: tickStepSize, tickValues: tickValues, tickPositions: tickPositions, tickCount: tickCount)
            }
            
            var best = Best(lmin: 0, lmax: 0, lstep: 0, score: -2.0)
            
            var j = 1
            
            while (j < maxIterations)
            {
                for i in 0 ..< qLength {
                    let q = Q[Int(i)]
                    let sm = simplicityMax(q, Double(j), qLength, i)
                    
                    if ((w[0] * sm + w[1] + w[2]) < best.score)
                    {
                        j = maxIterations - 1
                        break
                    }
                    
                    var k = 2
                    
                    // loop over tick counts (don't loop more than twice the desired tick count).
                    while (k < m + m)
                    {
                        let dm = densityMax(Double(k), Double(m))
                        
                        if((w[0] * sm + w[1] + w[2] * dm) < best.score)
                        {
                            break
                        }
                        
                        let delta = (dmax - dmin) / (Double(k) + 1.0) / (Double(j) * q)
                        var z = ceil(log10(delta))
                        
                        while (z < Double(maxIterations))
                        {
                            let step = Double(j) * q * pow(10.0, z)
                            
                            if step.isInfinite || step.isNaN
                            {
                                break
                            }
                            
                            let cm = coverageMax(dmin, dmax, step * (Double(k) - 1.0))
                            
                            if ((w[0] * sm + w[1] * cm + w[2] * dm) < best.score)
                            {
                                break
                            }
                            
                            let minStart = Int(floor(dmax / step - (Double(k) - 1.0)) * Double(j))
                            let maxStart = Int(ceil(dmin / step) * Double(j))
                            
                            if (minStart > maxStart)
                            {
                                z += 1
                                continue
                            }
                            
                            for start in minStart ... maxStart
                            {
                                let lmin = Double(start) * (step / Double(j))
                                let lmax = lmin + step * (Double(k) - 1.0)
                                let lstep = step
                                
                                let s = simplicity(q, Double(j), lmin, lmax, lstep, qLength, i)
                                let c = coverage(dmin, dmax, lmin, lmax)
                                let g = density(Double(k), Double(m), dmin, dmax, lmin, lmax)
                                
                                let score = w[0] * s + w[1] * c + w[2] * g
                                
                                if (score > best.score && (!loose || (lmin <= dmin && lmax >= dmax)))
                                {
                                    best.lmin = lmin
                                    best.lmax = lmax
                                    best.lstep = lstep
                                    best.score = score
                                }
                            }
                            z += 1
                        }
                        k += 1
                    }
                }
                j += 1
            }
            
            tickCount = UInt(round((best.lmax - best.lmin) / best.lstep) + 1)
            
            var rangeStart = dmin
            var rangeEnd = dmax
            
            if (fudgeRange)
            {
                if (rangeStart <= best.lmin && rangeStart > 0.0 && rangeEnd >= rangeStart)
                {
                    rangeStart -= best.lstep / Double(tickCount)
                }
                else if (rangeEnd >= best.lmax && rangeEnd < 0.0 && rangeStart <= rangeEnd)
                {
                    rangeEnd += best.lstep / Double(tickCount)
                }
            }
            
            tickMinimum = best.lmin
            tickMaximum = best.lmax
            tickStepSize = best.lstep
            
            dataMinimum = dmin
            dataMaximum = dmax
            
            plotMinimum = fmin(rangeStart, tickMinimum)
            plotMaximum = fmax(rangeEnd, tickMaximum)
            
            plotRange = plotMaximum - plotMinimum
            tickRange = tickMaximum - tickMinimum
            dataRange = dataMaximum - dataMinimum
            
            if (plotRange == 0)
            {
                plotScale = 0
            }
            else
            {
                plotScale = 1.0 / plotRange
            }
            
            if (tickRange == 0)
            {
                tickScale = 0
            }
            else
            {
                tickScale = 1.0 / tickRange
            }
            
            if (dataRange == 0)
            {
                dataScale = 0
            }
            else
            {
                dataScale = 1.0 / dataRange
            }
            
            for i in 0 ..< tickCount
            {
                let tickValue = tickMinimum + tickStepSize * Double(i)
                tickValues.append(tickValue)
                tickPositions.append(plotScale * (tickValue - plotMinimum))
            }
            
    //        let plotBaselinePosition = plotScale * (plotBaselineValue - plotMinimum)
    //        return AxisTickValues(plotMinimum: plotMinimum, plotMaximum: plotMaximum, plotBaselineValue: plotBaselineValue, plotBaselinePosition: plotBaselinePosition, tickMinimum: tickMinimum, tickMaximum: tickMaximum, dataMinimum: dataMinimum, dataMaximum: dataMaximum, plotRange: plotRange, tickRange: tickRange, dataRange: dataRange, plotScale: plotScale, tickScale: tickScale, dataScale: dataScale, tickStepSize: tickStepSize, tickValues: tickValues, tickPositions: tickPositions, tickCount: tickCount)
        }
    
    static func numOfDataItmes(_ model: ChartModel) -> Int {
        if let titles = model.titlesForCategory {
            return titles[model.currentSeriesIndex].count
        }
        
        return model.data[model.currentSeriesIndex].count
    }
    
    static func displayRange(_ model: ChartModel) -> ClosedRange<CGFloat> {
        if let minVal = model.numericAxis.explicitMin, let maxVal = model.numericAxis.explicitMax {
            let displayMinVal = CGFloat(minVal)
            let displayMaxVal = maxVal < minVal ? CGFloat(minVal + 1) : CGFloat(maxVal)
            
            return displayMinVal...displayMaxVal
        }
        // calculate display range
        var minVal: CGFloat = CGFloat(Int.max)
        var maxVal: CGFloat = CGFloat(Int.min)
        if model.chartType == .stock {
            minVal = CGFloat(model.ranges[model.currentSeriesIndex].lowerBound)
            maxVal = CGFloat(model.ranges[model.currentSeriesIndex].upperBound)
        } else {
            for range in model.ranges {
                minVal = min(CGFloat(range.lowerBound), minVal)
                maxVal = max(CGFloat(range.upperBound), maxVal)
            }
        }
        
        var displayMinVal: CGFloat = minVal - (maxVal - minVal) * 0.2
        var displayMaxVal: CGFloat = maxVal + (maxVal - minVal) * 0.2
        
        if abs(displayMaxVal) > 10 {
            displayMaxVal = ChartUtility.roundToGoodNumber(val: displayMaxVal, roundUp: true)
        }
        
        if abs(displayMinVal) > 10 {
            displayMinVal = ChartUtility.roundToGoodNumber(val: displayMinVal, roundUp: false)
        }
        
        if abs(displayMaxVal - displayMinVal) < 0.1 {
            displayMaxVal += 1
        }
        
        let valueType = model.valueType
        if valueType == .allPositive && (model.numericAxis.isZeroBased || displayMinVal < 0) {
            displayMinVal = 0
        } else if valueType == .allNegative && (model.numericAxis.isZeroBased || displayMaxVal > 0) {
            displayMaxVal = 0
        }
        
        if let tmp = model.numericAxis.explicitMin {
            displayMinVal = CGFloat(tmp)
        }
        
        if let tmp = model.numericAxis.explicitMax {
            displayMaxVal = CGFloat(tmp)
        }
        
        return displayMinVal...displayMaxVal
    }
    
    static func roundToGoodNumber(val: CGFloat, roundUp: Bool) -> CGFloat {
        let negative: CGFloat = val > 0 ? 1 : -1
        var factor: CGFloat = 1
        var coefficient = negative * val
        while coefficient >= 10 {
            coefficient /= 10
            factor *= 10
        }
        
        coefficient = coefficient.rounded(roundUp ? .up : .down)
        
        return negative * coefficient * factor
    }
    
    static func lastValidDimIndex(_ model: ChartModel) -> Int {
        return model.data[model.currentSeriesIndex].count - 1
    }
    
    static func isIntraDay(_ model: ChartModel) -> Bool {
        let countA = model.titlesForCategory?[model.currentSeriesIndex].count ?? 0
        let countB = ChartUtility.lastValidDimIndex(model) + 1
        
        return countA != countB
    }
    
    static func dimensionValue(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int, dimensionIndex: Int) -> Double? {
        if model.data.count < seriesIndex || model.data[seriesIndex].count < categoryIndex {
            return nil
        }
        
        if let value = model.data[seriesIndex][categoryIndex].value {
            return value
        } else if let values = model.data[seriesIndex][categoryIndex].values {
            if values.count > dimensionIndex {
                return values[dimensionIndex]
            }
        }
        
        return nil
    }
    
    static func dimensionValue(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int) -> Double? {
        return dimensionValue(model, seriesIndex: seriesIndex, categoryIndex: categoryIndex, dimensionIndex: 0)
    }
    
    static func dimensionValue(_ model: ChartModel, categoryIndex: Int) -> Double? {
        return dimensionValue(model, seriesIndex: model.currentSeriesIndex, categoryIndex: categoryIndex, dimensionIndex: 0)
    }
    
    static func categoryValue(_ model: ChartModel, categoryIndex: Int) -> String? {
        return categoryValue(model, seriesIndex: model.currentSeriesIndex, categoryIndex: categoryIndex)
    }
    
    static func categoryValue(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int) -> String? {
        guard let categories = model.titlesForCategory else { return nil }
        
        if seriesIndex < 0 || seriesIndex >= categories.count || categoryIndex < 0 || categoryIndex >= categories[seriesIndex].count {
            return nil
        }
        
        return categories[seriesIndex][categoryIndex]
    }
    
    static func xPos(_ pos: CGFloat, layoutDirection: LayoutDirection, width: CGFloat) -> CGFloat {
        if layoutDirection == .rightToLeft {
            return (width - pos)
        } else {
            return pos
        }
    }
    
    /*
     Stock chart functions only
     */
    static func categoryValueInDate(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int) -> Date? {
        guard let dateString = categoryValue(model, seriesIndex: seriesIndex, categoryIndex: categoryIndex) else { return nil }
        
        return date(from: dateString)
    }
    
    static func categoryValueInDate(_ model: ChartModel, categoryIndex: Int) -> Date? {
        return categoryValueInDate(model, seriesIndex: model.currentSeriesIndex, categoryIndex: categoryIndex)
    }
    
    static func date(from s: String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return df.date(from: s)
    }
}

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
    static func cgfloatOptional(from value: Double?) -> CGFloat? {
        var result: CGFloat? = nil
        if let v = value {
            result = CGFloat(v)
        }
        
        return result
    }
    
    static func doubleOptional(from value: CGFloat?) -> Double? {
        var result: Double? = nil
        if let v = value {
            result = Double(v)
        }
        
        return result
    }
    
    // swiftlint:disable cyclomatic_complexity
    static func calculateDataElementsForAxisTickValues (_ model: ChartModel, secondaryRange: Bool) -> ChartModel.DataElementsForAxisTickValues {
        if model.data.isEmpty || model.data.first?.isEmpty ?? true {
            return ChartModel.DataElementsForAxisTickValues(noData: true, dataMinimum: 0, dataMaximum: 0, currentSeriesIndex: 0, numberOfGridlines: 2, allowLooseLabels: false, fudgeYAxisRange: false, adjustToNiceValues: true, secondaryRange: secondaryRange)
        }
        
        let allIndexs = IndexSet(integersIn: 0 ..< model.data.count)
        let indexes = secondaryRange ? model.indexesOfSecondaryValueAxis.sorted() : model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs).sorted()
        
        if indexes.isEmpty {
            return ChartModel.DataElementsForAxisTickValues(noData: true, dataMinimum: 0, dataMaximum: 0, currentSeriesIndex: 0, numberOfGridlines: 2, allowLooseLabels: false, fudgeYAxisRange: false, adjustToNiceValues: true, secondaryRange: secondaryRange)
        }
        
        var currentSeriesIndex: Int = 0
        var dmin: CGFloat
        var dmax: CGFloat
        if model.chartType == .stock {
            currentSeriesIndex = model.currentSeriesIndex
            dmin = CGFloat(model.ranges[model.currentSeriesIndex].lowerBound)
            dmax = CGFloat(model.ranges[model.currentSeriesIndex].upperBound)
        } else {
            let dataRange: ClosedRange<CGFloat> = indexes.reduce(model.ranges[indexes[0]]) { (result, i) -> ClosedRange<CGFloat> in
                let dmin = min(result.lowerBound, model.ranges[i].lowerBound)
                let dmax = max(result.upperBound, model.ranges[i].upperBound)
                return dmin...dmax
            }
            
            dmin = dataRange.lowerBound
            dmax = dataRange.upperBound
        }
        
        if secondaryRange {
            //
            // Check if explicit min is defined, otherwise use data min.
            //
            if let emin = model.secondaryNumericAxis.explicitMin {
                dmin = emin
            }
            
            //
            // Check if explicit max is defined, otherwise use data max.
            //
            if let emax = model.secondaryNumericAxis.explicitMax {
                dmax = emax
            }
            
            //
            // Check if we need to clamp the baseline at zero and adjust accordingly.
            //
            if model.secondaryNumericAxis.isZeroBased {
                if dmin >= 0.0 && dmax >= dmin {
                    dmin = 0.0
                } else if dmax <= 0.0 && dmin <= dmax {
                    dmax = 0.0
                }
            }
        } else {
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
            if model.numericAxis.isZeroBased {
                if dmin >= 0.0 && dmax >= dmin {
                    dmin = 0.0
                } else if dmax <= 0.0 && dmin <= dmax {
                    dmax = 0.0
                }
            }
        }
        
        let axisAttributes = secondaryRange ? model.secondaryNumericAxis : model.numericAxis
        
        return ChartModel.DataElementsForAxisTickValues(noData: false, dataMinimum: dmin, dataMaximum: dmax, currentSeriesIndex: currentSeriesIndex, numberOfGridlines: model.numberOfGridlines, allowLooseLabels: axisAttributes.allowLooseLabels, fudgeYAxisRange: axisAttributes.fudgeAxisRange, adjustToNiceValues: axisAttributes.adjustToNiceValues, secondaryRange: secondaryRange)
    }
    
    static func calculateRangeProperties(_ model: ChartModel, dataElements: ChartModel.DataElementsForAxisTickValues, secondaryRange: Bool) -> AxisTickValues {
        
        if dataElements.noData {
            return AxisTickValues(plotMinimum: 0, plotMaximum: 1, plotBaselineValue: 0, plotBaselinePosition: 0, tickMinimum: 0, tickMaximum: 1, dataMinimum: 0, dataMaximum: 1, plotRange: 1, tickRange: 1, dataRange: 1, plotScale: 1, tickScale: 1, dataScale: 1, tickStepSize: 1, tickValues: [0, 1], tickPositions: [0, 1], tickCount: 2)
        }
        
        let axisAttributes = secondaryRange ? model.secondaryNumericAxis : model.numericAxis
        
//        var allowLooseLabel = axisAttributes.allowLooseLabels
//        if model.chartType == .line || model.chartType == .area || model.chartType == .stock || model.chartType == .combo {
//            allowLooseLabel = false
//        }
        
        let dmin = dataElements.dataMinimum
        let dmax = dataElements.dataMaximum
        
//        var fudgeRange: Bool = false
//
//        switch model.chartType {
//        case .bubble, .scatter, .stackedColumn, .waterfall, .combo:
//            fudgeRange = true
//
//        default:
//            fudgeRange = false
//        }
        
        var useLooseLabels = axisAttributes.allowLooseLabels
        //
        // Create value axis tick properties based on min/max and if we need to adjust to nice values.
        //
        if useLooseLabels {
            let valueAxisBaselineValue: CGFloat = dmax < 0.0 ? dmax : max(0.0, dmin)
            
            // If the baseline is at zero we aim to always show the baseline with a tick.
            if valueAxisBaselineValue == 0.0 {
                useLooseLabels = false
            }
        }
        
        return axisCreateTicks(model, rangeStart: dmin, rangeEnd: dmax, desiredTickCount: UInt(model.numberOfGridlines + 1), looseLabels: useLooseLabels, fudgeRange: axisAttributes.fudgeAxisRange, adjustToNiceValues: axisAttributes.adjustToNiceValues)
    }
    
    // swiftlint:disable function_parameter_count
    static func axisCreateTicks(_ model: ChartModel, rangeStart: CGFloat, rangeEnd: CGFloat, desiredTickCount: UInt, looseLabels: Bool, fudgeRange: Bool, adjustToNiceValues: Bool) -> AxisTickValues {
        let Q: [CGFloat] = [1.0, 2.0, 4.0, 5.0, 3.0, 6.0, 7.0, 8.0, 9.0]
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
        let w: [CGFloat] = [0.06, 0.01, 0.1]
        // As defined in the paper but not ideal for our use cases.
        //    w[0] = 0.2
        //    w[1] = 0.25
        //    w[2] = 0.5
        
        //let desiredTickCount = 3
        //let looseLabels = true
        
        return axisUtilExtended(model, rangeStart, rangeEnd, desiredTickCount, Q, looseLabels, fudgeRange, w, UInt(Q.count), adjustToNiceValues)
    }
    
    struct Best {
        var lmin: CGFloat
        var lmax: CGFloat
        var lstep: CGFloat
        var score: CGFloat
    }

    // swiftlint:disable cyclomatic_complexity function_body_length function_parameter_count

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
    static func axisUtilExtended(_ model: ChartModel, _ dMin: CGFloat, _ dMax: CGFloat, _ m: UInt, _ Q: [CGFloat], _ loose: Bool, _ fudgeRange: Bool, _ w: [CGFloat], _ qLength: UInt, _ adjustToNiceValues: Bool) -> AxisTickValues {
        //print("loose = \(loose), fudgeRange = \(fudgeRange), adjustToNiceValues = \(adjustToNiceValues)")
        let eps = CGFloat(1e-10)
        let maxIterations = 30
        
        func modFloor(_ a: CGFloat, _ n: CGFloat) -> CGFloat {
            return a - n * floor(a / n)
        }
        
        // Scoring functions, including the approximations for limiting the search
        func simplicity(_ q: CGFloat, _ j: CGFloat, _ lmin: CGFloat, _ lmax: CGFloat, _ lstep: CGFloat, _ qLength: UInt, _ index: UInt) -> CGFloat {
            let targetIndex = max(min(index, qLength - 1), 0)
            let n = qLength
            let i = targetIndex + 1
            let v: CGFloat = (modFloor(lmin, lstep) < eps && lmin <= 0 && lmax >= 0) ? 1 : 0
            var score: CGFloat
            
            if n <= 1 {
                score = 1 - j + v
            } else {
                score = 1 - CGFloat(i - 1) / CGFloat(n - 1) - j + v
            }
            
            return score
        }
        
        func simplicityMax(_ q: CGFloat, _ j: CGFloat, _ qLength: UInt, _ index: UInt) -> CGFloat {
            let targetIndex = max(min(index, qLength - 1), 0)
            let n = qLength
            let i = targetIndex + 1
            let v: CGFloat = 1.0
            var score: CGFloat
            
            if n <= 1 {
                score = 1 - j + v
            } else {
                score = 1 - CGFloat(i - 1) / CGFloat(n - 1) - j + v
            }
            
            return score
        }
        
        func coverage(_ dmin: CGFloat, _ dmax: CGFloat, _ lmin: CGFloat, _ lmax: CGFloat) -> CGFloat {
            let range = dmax - dmin
            return 1.0 - 0.5 * (pow(dmax - lmax, 2.0) + pow(dmin - lmin, 2.0)) / pow(0.1 * range, 2.0)
        }
        
        func coverageMax(_ dmin: CGFloat, _ dmax: CGFloat, _ span: CGFloat) -> CGFloat {
            let range = dmax - dmin
            
            if span > range {
                let half = (span - range) / 2.0
                return 1.0 - 0.5 * (pow(half, 2.0) + pow(half, 2.0)) / pow(0.1 * range, 2.0)
            } else {
                return 1.0
            }
        }
        
        func density(_ k: CGFloat, _ m: CGFloat, _ dmin: CGFloat, _ dmax: CGFloat, _ lmin: CGFloat, _ lmax: CGFloat) -> CGFloat {
            let r = (k - 1.0) / (lmax - lmin)
            let rt = (m - 1.0) / (max(lmax, dmax) - min(dmin, lmin))
            
            return 2.0 - max(r / rt, rt / r)
        }
        
        func densityMax(_ k: CGFloat, _ m: CGFloat) -> CGFloat {
            if k >= m {
                return 2.0 - (k - 1.0) / (m - 1.0)
            } else {
                return 1.0
            }
        }
        
        var plotMinimum: CGFloat = 0
        var plotMaximum: CGFloat = 0
        var tickMinimum: CGFloat = 0
        var tickMaximum: CGFloat = 0
        var dataMinimum: CGFloat = 0
        var dataMaximum: CGFloat = 0
        var plotRange: CGFloat = 0
        var tickRange: CGFloat = 0
        var dataRange: CGFloat = 0
        var plotScale: CGFloat = 0
        var tickScale: CGFloat = 0
        var dataScale: CGFloat = 0
        var tickStepSize: CGFloat = 0
        var tickValues: [CGFloat] = []
        var tickPositions: [CGFloat] = []
        var tickCount: UInt = 0
        
        let dmin = min(dMin, dMax)
        let dmax = dMin == dMax ? (dMax + 1): max(dMin, dMax)
    
        if !adjustToNiceValues || dmax - dmin < eps {
            //if the range is near the floating point limit,
            //let seq generate some equally spaced steps.
            //return seq(from=dmin, to=dmax, length.out=m)
            //return sequenceFromToByLength(dmin, dmax, m)
            
            let range: CGFloat = dmax - dmin
            var baselineWithinPlot: Bool = dmax > 0.0 && dmin < 0.0
            if dmin == 0 || dmax == 0 {
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
            
            if plotRange == 0 {
                plotScale = 0
            } else {
                plotScale = 1.0 / plotRange
            }
            
            if tickRange == 0 {
                tickScale = 0
            } else {
                tickScale = 1.0 / tickRange
            }
            
            if dataRange == 0 {
                dataScale = 0
            } else {
                dataScale = 1.0 / dataRange
            }
            
            tickStepSize = tickRange / CGFloat(m - 1)
            tickCount = m
            
            for i in 0 ..< tickCount {
                let tickValue = dmin + tickStepSize * CGFloat(i)
                tickValues.append(tickValue)
                tickPositions.append(plotScale * (tickValue - plotMinimum))
            }
            tickValues.reverse()
            tickPositions.reverse()
            
            let plotBaselineValue: CGFloat = plotMaximum <= 0.0 ? plotMaximum : (plotMinimum < 0 ? 0 : plotMinimum)
            let plotBaselinePosition = plotScale * (plotBaselineValue - plotMinimum)
            return AxisTickValues(plotMinimum: plotMinimum, plotMaximum: plotMaximum, plotBaselineValue: plotBaselineValue, plotBaselinePosition: plotBaselinePosition, tickMinimum: tickMinimum, tickMaximum: tickMaximum, dataMinimum: dataMinimum, dataMaximum: dataMaximum, plotRange: plotRange, tickRange: tickRange, dataRange: dataRange, plotScale: plotScale, tickScale: tickScale, dataScale: dataScale, tickStepSize: tickStepSize, tickValues: tickValues, tickPositions: tickPositions, tickCount: tickCount)
        }
        
        var best = Best(lmin: 0, lmax: 0, lstep: 0, score: -2.0)
        
        var j = 1
        
        while j < maxIterations {
            for i in 0 ..< qLength {
                let q = Q[Int(i)]
                let sm = simplicityMax(q, CGFloat(j), qLength, i)
                
                if (w[0] * sm + w[1] + w[2]) < best.score {
                    j = maxIterations - 1
                    break
                }
                
                var k = 2
                
                // loop over tick counts (don't loop more than twice the desired tick count).
                while k < m + m {
                    let dm = densityMax(CGFloat(k), CGFloat(m))
                    
                    if (w[0] * sm + w[1] + w[2] * dm) < best.score {
                        break
                    }
                    
                    let delta = (dmax - dmin) / (CGFloat(k) + 1.0) / (CGFloat(j) * q)
                    var z = ceil(log10(delta))
                    
                    while z < CGFloat(maxIterations) {
                        let step = CGFloat(j) * q * pow(10.0, z)
                        
                        if step.isInfinite || step.isNaN {
                            break
                        }
                        
                        let cm = coverageMax(dmin, dmax, step * (CGFloat(k) - 1.0))
                        
                        if (w[0] * sm + w[1] * cm + w[2] * dm) < best.score {
                            break
                        }
                        
                        let minStart = Int(floor(dmax / step - (CGFloat(k) - 1.0)) * CGFloat(j))
                        let maxStart = Int(ceil(dmin / step) * CGFloat(j))
                        
                        if minStart > maxStart {
                            z += 1
                            continue
                        }
                        
                        for start in minStart ... maxStart {
                            let lmin = CGFloat(start) * (step / CGFloat(j))
                            let lmax = lmin + step * (CGFloat(k) - 1.0)
                            let lstep = step
                            
                            let s = simplicity(q, CGFloat(j), lmin, lmax, lstep, qLength, i)
                            let c = coverage(dmin, dmax, lmin, lmax)
                            let g = density(CGFloat(k), CGFloat(m), dmin, dmax, lmin, lmax)
                            
                            let score = w[0] * s + w[1] * c + w[2] * g
                            
                            if score > best.score && (!loose || (lmin <= dmin && lmax >= dmax)) {
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
        
        if best.lstep == 0 {
            tickCount = 1
        } else {
            tickCount = UInt(round((best.lmax - best.lmin) / best.lstep) + 1)
        }
        
        var rangeStart = dmin
        var rangeEnd = dmax
        
        if fudgeRange {
            if rangeStart <= best.lmin && rangeStart > 0.0 && rangeEnd >= rangeStart {
                rangeStart -= best.lstep / CGFloat(tickCount)
            } else if rangeEnd >= best.lmax && rangeEnd < 0.0 && rangeStart <= rangeEnd {
                rangeEnd += best.lstep / CGFloat(tickCount)
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
        
        if plotRange == 0 {
            plotScale = 0
        } else {
            plotScale = 1.0 / plotRange
        }
        
        if tickRange == 0 {
            tickScale = 0
        } else {
            tickScale = 1.0 / tickRange
        }
        
        if dataRange == 0 {
            dataScale = 0
        } else {
            dataScale = 1.0 / dataRange
        }
        
        for i in 0 ..< tickCount {
            let tickValue = tickMinimum + tickStepSize * CGFloat(i)
            tickValues.append(tickValue)
            tickPositions.append(plotScale * (tickValue - plotMinimum))
        }
        tickValues.reverse()
        tickPositions.reverse()
        
        let plotBaselineValue: CGFloat = plotMaximum <= 0.0 ? plotMaximum : (plotMinimum < 0 ? 0 : plotMinimum)
        let plotBaselinePosition = plotScale * (plotBaselineValue - plotMinimum)
        return AxisTickValues(plotMinimum: plotMinimum, plotMaximum: plotMaximum, plotBaselineValue: plotBaselineValue, plotBaselinePosition: plotBaselinePosition, tickMinimum: tickMinimum, tickMaximum: tickMaximum, dataMinimum: dataMinimum, dataMaximum: dataMaximum, plotRange: plotRange, tickRange: tickRange, dataRange: dataRange, plotScale: plotScale, tickScale: tickScale, dataScale: dataScale, tickStepSize: tickStepSize, tickValues: tickValues, tickPositions: tickPositions, tickCount: tickCount)
    }
    
    static func plotItemYPosition(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int, rect: CGRect) -> CGFloat? {
        let allIndexs = IndexSet(integersIn: 0 ..< model.data.count)
        let indexes = model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs).sorted()
        let secondary = indexes.contains(seriesIndex) ? false : true
        let range = ChartUtility.displayRange(model, secondary: secondary)
    
        if let value = ChartUtility.dimensionValue(model, seriesIndex: seriesIndex, categoryIndex: categoryIndex) {
            let y = rect.size.height - (CGFloat(value) - range.lowerBound) * rect.size.height / (range.upperBound - range.lowerBound) + rect.origin.y
            
            return y
        }
        
        return nil
    }
    
    static func xAxisBaselinePosition(_ model: ChartModel) -> CGFloat {
        let allIndexs = IndexSet(integersIn: 0 ..< model.data.count)
        let indexes = model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs).sorted()
        let axisValues = indexes.isEmpty ? model.secondaryNumericAxisTickValues : model.numericAxisTickValues
      
        return (axisValues.plotBaselineValue - axisValues.plotMinimum) * axisValues.plotScale
    }
    
    static func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect) -> (seriesIndex: Int, categoryIndex: Int) {
        let width = rect.size.width
        
        let unitWidth: CGFloat = width * model.scale / CGFloat(max(ChartUtility.numOfDataItems(model) - 1, 1))
        let startIndex = Int((CGFloat(model.startPos) / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - CGFloat(model.startPos).truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        let index: Int = Int((atPoint.x - startOffset) / unitWidth + 0.5) + startIndex
        
        var closestDataIndex = index.clamp(low: 0, high: ChartUtility.lastValidDimIndex(model))
        
        let xPos = rect.origin.x + startOffset + CGFloat(closestDataIndex - startIndex) * unitWidth
        if xPos - rect.origin.x - rect.size.width > 1 {
            closestDataIndex -= 1
        }
        
        var curSeriesIndex = model.currentSeriesIndex
        if model.selectionMode == .single {
            var minYDistance = CGFloat(Int.max)
            if model.selectionMode == .single && model.chartType != .stock {
                for seriesIndex in 0 ... max(model.data.count - 1, 0) {
                    if let y = ChartUtility.plotItemYPosition(model, seriesIndex: seriesIndex, categoryIndex: closestDataIndex, rect: rect) {
                        if abs(y - atPoint.y) < minYDistance {
                            curSeriesIndex = seriesIndex
                            minYDistance = abs(y - atPoint.y)
                        }
                    }
                }
            }
        }
        
        return (curSeriesIndex, closestDataIndex)
    }
    
    static func updateSelections(_ model: ChartModel, selectedPlotItems: [(Int, Int)]) {
        if selectedPlotItems.isEmpty {
            return
        }
        if let firstItem = selectedPlotItems.first, let lastItem = selectedPlotItems.last {
            let selectedCategoryInRange: ClosedRange<Int> = firstItem.1 ... lastItem.1
            
            let seriesRange: ClosedRange<Int>
            if model.chartType == .stock {
                seriesRange = model.currentSeriesIndex ... model.currentSeriesIndex
            } else {
                if model.selectionMode == .single {
                    if firstItem == lastItem {
                        seriesRange = firstItem.0 ... firstItem.0
                    } else {
                        // renge selection
                        var prevSeriesIndex = model.currentSeriesIndex
                        if let sels = model.selections {
                            prevSeriesIndex = sels[0].lowerBound
                        }
                        seriesRange = prevSeriesIndex ... prevSeriesIndex
                    }
                } else {
                    seriesRange = 0 ... model.data.count - 1
                }
            }
            
            let tmpSelections: [ClosedRange<Int>] = [seriesRange, selectedCategoryInRange]
            if tmpSelections != model.selections {
                model.selections = [seriesRange, selectedCategoryInRange]
            } else {
                // clear selection if it is not range selection
                if selectedCategoryInRange.count == 1 {
                    model.selections = nil
                }
            }
        }
    }
    
    static func numOfDataItems(_ model: ChartModel) -> Int {
        if let titles = model.titlesForCategory, model.currentSeriesIndex < titles.count {
            return titles[model.currentSeriesIndex].count
        }
        
        return model.data[model.currentSeriesIndex].count
    }
    
    static func displayRange(_ model: ChartModel, secondary: Bool = false) -> ClosedRange<CGFloat> {
        if secondary {
            let axisValues = model.secondaryNumericAxisTickValues
            return axisValues.plotMinimum ... axisValues.plotMaximum
        } else {
            let axisValues = model.numericAxisTickValues
            return axisValues.plotMinimum ... axisValues.plotMaximum
        }
    }
    
    static func lastValidDimIndex(_ model: ChartModel) -> Int {
        return model.data[model.currentSeriesIndex].count - 1
    }
    
    static func isIntraDay(_ model: ChartModel) -> Bool {
        let countA = model.titlesForCategory?[model.currentSeriesIndex].count ?? 0
        let countB = ChartUtility.lastValidDimIndex(model) + 1
        
        return countA != countB
    }
    
    static func dimensionValue(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int, dimensionIndex: Int) -> CGFloat? {
        let val = model.plotItemValue(at: seriesIndex, category: categoryIndex, dimension: dimensionIndex)
        
        if let realVal = val {
            return CGFloat(realVal)
        } else {
            return nil
        }
    }
    
    static func dimensionValue(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int) -> CGFloat? {
        return dimensionValue(model, seriesIndex: seriesIndex, categoryIndex: categoryIndex, dimensionIndex: 0)
    }
    
    static func dimensionValue(_ model: ChartModel, categoryIndex: Int) -> CGFloat? {
        return dimensionValue(model, seriesIndex: model.currentSeriesIndex, categoryIndex: categoryIndex, dimensionIndex: 0)
    }
    
    static func categoryValue(_ model: ChartModel, categoryIndex: Int) -> String? {
        return categoryValue(model, seriesIndex: model.currentSeriesIndex, categoryIndex: categoryIndex)
    }
    
    static func categoryValue(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int) -> String? {
        guard let categories = model.titlesForCategory else { return nil }
        
        if model.chartType == .stock {
            if seriesIndex < 0 || seriesIndex >= categories.count || categoryIndex < 0 || categoryIndex >= categories[seriesIndex].count {
                return nil
            } else {
                return categories[seriesIndex][categoryIndex]
            }
        } else {
            var tmpSeriesIndex = seriesIndex
            if seriesIndex < 0 || seriesIndex >= categories.count {
                tmpSeriesIndex = 0
            }
            
            if categoryIndex < 0 || categoryIndex >= categories[tmpSeriesIndex].count {
                return nil
            } else {
                return categories[tmpSeriesIndex][categoryIndex]
            }
        }
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

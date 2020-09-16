//
//  SettingsAxis.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct SettingsAxis: View {
    @Binding var axis: ChartNumericAxisAttributes
    
    var body: some View {
        Form {
            Section(header: Text("Basic")) {
                Toggle(isOn: $axis.isZeroBased) {
                    Text("Is Zero Based")
                }
                
                Toggle(isOn: $axis.allowLooseLabels) {
                    Text("Allow Loose Labels")
                }
                
                Toggle(isOn: $axis.fudgeAxisRange) {
                    Text("Fudge Axis Range")
                }
                
                Toggle(isOn: $axis.adjustToNiceValues) {
                    Text("Adjust To Nice Values")
                }
                
                Toggle(isOn: $axis.abbreviatesLabels) {
                    Text("Is Abbreviated Labels")
                }
                
                Toggle(isOn: $axis.isMagnitudedDisplayed) {
                    Text("Is Magnituded Displayed")
                }
                
                Text("Explicit Min: \(String(describing: axis.explicitMin))")
                Text("Explicit Max: \(String(describing: axis.explicitMax))")
                
                Picker(selection: $axis.formatter.numberStyle, label: Text("Number Formatter Style")) {
                    Text("decimal").tag(NumberFormatter.Style.decimal)
                    Text("percent").tag(NumberFormatter.Style.percent)
                    Text("currency").tag(NumberFormatter.Style.currency)
                    Text("currencyAccounting").tag(NumberFormatter.Style.currencyAccounting)
                    Text("currencyISOCode").tag(NumberFormatter.Style.currencyISOCode)
                    Text("currencyPlural").tag(NumberFormatter.Style.currencyPlural)
                    Text("ordinal").tag(NumberFormatter.Style.ordinal)
                    Text("none").tag(NumberFormatter.Style.none)
                }
                
                Picker(selection: $axis.abbreviatedFormatter.numberStyle, label: Text("Abbreviated Number Formatter Style")) {
                    Text("decimal").tag(NumberFormatter.Style.decimal)
                    Text("percent").tag(NumberFormatter.Style.percent)
                    Text("currency").tag(NumberFormatter.Style.currency)
                    Text("currencyAccounting").tag(NumberFormatter.Style.currencyAccounting)
                    Text("currencyISOCode").tag(NumberFormatter.Style.currencyISOCode)
                    Text("currencyPlural").tag(NumberFormatter.Style.currencyPlural)
                    Text("ordinal").tag(NumberFormatter.Style.ordinal)
                    Text("none").tag(NumberFormatter.Style.none)
                }
            }
            
            Section(header: Text("Line")) {
                NavigationLink(destination:
                SettingsBaseline(line: $axis.baseline)) {
                    Text("Baseline")
                }
                
                NavigationLink(destination:
                SettingsLine(line: $axis.gridlines)) {
                    Text("Gridlines")
                }
            }
            
            Section(header: Text("Label")) {
                NavigationLink(destination: SettingsLabel(label: $axis.labels)) {
                    Text("Axis Gridline Label")
                }
                
                NavigationLink(destination: SettingsLabel(label: $axis.titleLabel)) {
                    Text("Axis Title Label")
                }
            }
        }.navigationBarTitle("Axis")
    }
}

struct SettingsAxis_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAxis(axis: .constant(Tests.stockModels[0].numericAxis))
    }
}

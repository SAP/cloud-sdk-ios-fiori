import FioriCharts
import SwiftUI

struct SettingsAxis: View {
    @Binding var axis: ChartNumericAxisAttributes
    @State var textExplicitMin: String = ""
    @State var textExplicitMax: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Basic")) {
                Toggle(isOn: self.$axis.isZeroBased) {
                    Text("Is Zero Based")
                }
                
                Toggle(isOn: self.$axis.abbreviatesLabels) {
                    Text("Is Abbreviated Labels")
                }
                
                Toggle(isOn: self.$axis.isMagnitudedDisplayed) {
                    Text("Is Magnituded Displayed")
                }
                
                HStack(alignment: .center) {
                    Text("Explicit Min: ")
                    
                    TextField("", text: self.$textExplicitMin, onCommit: {
                        if let val = NumberFormatter().number(from: self.textExplicitMin) {
                            self.axis.explicitMin = CGFloat(truncating: val)
                        }
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack(alignment: .center) {
                    Text("Explicit Max: ")

                    TextField("", text: self.$textExplicitMax, onCommit: {
                        if let val = NumberFormatter().number(from: self.textExplicitMax) {
                            self.axis.explicitMax = CGFloat(truncating: val)
                        }
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Picker(selection: self.$axis.formatter.numberStyle, label: Text("Number Formatter Style")) {
                    Text("decimal").tag(NumberFormatter.Style.decimal)
                    Text("percent").tag(NumberFormatter.Style.percent)
                    Text("currency").tag(NumberFormatter.Style.currency)
                    Text("currencyAccounting").tag(NumberFormatter.Style.currencyAccounting)
                    Text("currencyISOCode").tag(NumberFormatter.Style.currencyISOCode)
                    Text("currencyPlural").tag(NumberFormatter.Style.currencyPlural)
                    Text("ordinal").tag(NumberFormatter.Style.ordinal)
                    Text("none").tag(NumberFormatter.Style.none)
                }
                
                Picker(selection: self.$axis.abbreviatedFormatter.numberStyle, label: Text("Abbreviated Number Formatter Style")) {
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
                    SettingsBaseline(line: self.$axis.baseline))
                {
                    Text("Baseline")
                }
                
                NavigationLink(destination:
                    SettingsLine(line: self.$axis.gridlines))
                {
                    Text("Gridlines")
                }
            }
            
            Section(header: Text("Label")) {
                NavigationLink(destination: SettingsLabel(label: self.$axis.labels)) {
                    Text("Axis Gridline Label")
                }
                
                NavigationLink(destination: SettingsLabel(label: self.$axis.titleLabel)) {
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

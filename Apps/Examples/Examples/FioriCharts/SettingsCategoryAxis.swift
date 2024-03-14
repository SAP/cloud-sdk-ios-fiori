import FioriCharts
import SwiftUI

struct SettingsCategoryAxis: View {
    @EnvironmentObject var model: ChartModel
    @Binding var axis: ChartCategoryAxisAttributes
    
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
                
                Picker(selection: self.$axis.labelLayoutStyle, label: Text("Axis Label Layout Style")) {
                    Text("All or Nothing").tag(ChartCategoryAxisLabelLayoutStyle.allOrNothing)
                    Text("Range").tag(ChartCategoryAxisLabelLayoutStyle.range)
                }
            }
        }.navigationBarTitle("Axis")
    }
}

struct SettingsCategoryAxis_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCategoryAxis(axis: .constant(Tests.stockModels[0].categoryAxis))
    }
}

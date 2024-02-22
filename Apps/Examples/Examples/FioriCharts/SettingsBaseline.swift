import FioriCharts
import SwiftUI

struct SettingsBaseline: View {
    @EnvironmentObject var model: ChartModel
    @Binding var line: ChartBaselineAttributes
    
    var body: some View {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 0
        
        return Form {
            Section(header: Text("Basic")) {
                Toggle(isOn: self.$line.isHidden) {
                    Text("Is Hidden")
                }
                
                Text("Line width: \(nf.string(from: NSNumber(value: Double(self.line.width))) ?? "")")
                Slider(value: self.$line.width, in: 1 ... 10, step: 1)

                SettingColor(color: self.$line.color)
            }
            
            Section(header: Text("Dash Pattern")) {
                Text("Length: \(nf.string(from: NSNumber(value: Double(self.line.dashPatternLength))) ?? "")")
                Slider(value: self.$line.dashPatternLength, in: 1 ... 20, step: 1)
                
                Text("Gap: \(nf.string(from: NSNumber(value: Double(self.line.dashPatternGap))) ?? "")")
                Slider(value: self.$line.dashPatternGap, in: 0 ... 20, step: 1)
            }
        }.navigationBarTitle("Line Attributes")
    }
}

struct SettingsBaseline_Previews: PreviewProvider {
    static var previews: some View {
        SettingsBaseline(line: .constant(Tests.stockModels[0].categoryAxis.baseline))
    }
}

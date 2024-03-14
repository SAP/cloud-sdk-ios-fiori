import FioriCharts
import SwiftUI

struct SettingsLabel: View {
    @EnvironmentObject var model: ChartModel
    @Binding var label: ChartLabelAttributes
    
    var body: some View {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 0
        
        return Form {
            Section {
                Toggle(isOn: self.$label.isHidden) {
                    Text("Is Hidden")
                }
                
                Text("Font Size: \(nf.string(from: NSNumber(value: Double(self.label.fontSize))) ?? "")")
                Slider(value: self.$label.fontSize, in: 5 ... 20, step: 1)
                
                Text("Font offset: \(nf.string(from: NSNumber(value: Double(self.label.offset))) ?? "")")
                Slider(value: self.$label.offset, in: 0 ... 10, step: 1)
                
                SettingColor(color: self.$label.color)
            }
        }.navigationBarTitle("Label Attributes")
    }
}

struct SettingsLabel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabel(label: .constant(Tests.stockModels[0].categoryAxis.labels))
    }
}

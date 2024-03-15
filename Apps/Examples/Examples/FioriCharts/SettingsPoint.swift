import FioriCharts
import SwiftUI

struct SettingsPoint: View {
    @EnvironmentObject var model: ChartModel
    @Binding var point: ChartPointAttributes
    
    var body: some View {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 0
        
        return Form {
            Section {
                Toggle(isOn: self.$point.isHidden) {
                    Text("Is Hidden")
                }
                
                Text("Diameter of the point: \(nf.string(from: NSNumber(value: Double(self.point.diameter))) ?? "")")
                Slider(value: self.$point.diameter, in: 0 ... 20, step: 1)
                
                Text("Allowed gap between dots before they run into each other and are hidden: \(nf.string(from: NSNumber(value: Double(self.point.gap))) ?? "")")
                Slider(value: self.$point.gap, in: 0 ... 10, step: 1)
                
                SettingColor(color: self.$point.strokeColor)
            }
        }.navigationBarTitle("Point Attributes")
    }
}

struct SettingsPoint_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPoint(point: .constant(Tests.stockModels[0].seriesAttributes[0].point))
    }
}

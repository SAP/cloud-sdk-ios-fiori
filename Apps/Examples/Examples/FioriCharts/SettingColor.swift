import FioriCharts
import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct SettingColor: View {
    @Binding var color: Color
    var title: String?
    
    let colorOptions: [Color] = ColorStyle.allCases.map { .preferredColor($0) }
    
    var body: some View {
        Picker(selection: self.$color, label: Text(self.title ?? "Select Color")) {
            ForEach(0 ..< self.colorOptions.count, id: \.self) { index in
                Rectangle()
                    .fill(self.colorOptions[index])
                    .tag(self.colorOptions[index])
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
                    .frame(width: 60, height: 20)
            }
        }
    }
}

struct SettingColor_Previews: PreviewProvider {
    static var previews: some View {
        SettingColor(color: .constant(Tests.stockModels[0].categoryAxis.baseline.color))
    }
}

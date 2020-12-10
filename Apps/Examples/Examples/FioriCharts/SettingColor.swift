import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct SettingColor: View {
    @Binding var color: Color
    var title: String?
    
    let colorOptions: [Color] = ColorStyle.allCases.map { .preferredColor($0) }
    
    var body: some View {
        Picker(selection: $color, label: Text(title ?? "Select Color")) {
            ForEach(0 ..< colorOptions.count, id: \.self) { index in
                Rectangle()
                    .fill(colorOptions[index])
                    .tag(colorOptions[index])
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

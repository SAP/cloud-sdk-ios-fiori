import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct SettingsColorForCategory: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        let seriesIds = [Int](model.colorsForCategory.keys.sorted())
        
        return Form {
            ForEach(0 ..< seriesIds.count, id: \.self) { index in
                Section(header: Text("Series \(seriesIds[index])")) {
                    SettingsColorForOneCategory(colors: self.model.colorsForCategory[seriesIds[index]]!)
                }
            }
        }
    }
}

struct SettingsColorForOneCategory: View {
    var colors: [Int: Color]
    
    var body: some View {
        let colorTuples: [(Int, Color)] = colors.map { (arg0) -> (Int, Color) in
            let (key, value) = arg0
            return (key, value)
        }.sorted { $0.0 < $1.0 }
        
        return ForEach(0 ..< colorTuples.count, id: \.self) { index in
            HStack {
                Text("Category \(colorTuples[index].0)")
                Spacer()
                Rectangle()
                    .fill(colorTuples[index].1)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
                    .frame(width: 80, height: 20)
            }
            
            // SettingColor(color: .constant(color))
        }
    }
}

struct SettingsColorForCategory_Previews: PreviewProvider {
    static var previews: some View {
        SettingsColorForCategory(model: Tests.radialModels[0])
    }
}

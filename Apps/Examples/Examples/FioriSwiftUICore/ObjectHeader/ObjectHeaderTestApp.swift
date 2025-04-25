import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct MyCustomTagStyle: TagStyle {
    func makeBody(_ configuration: TagConfiguration) -> some View {
        Tag(configuration)
            .foregroundStyle(Color.cyan)
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 4).fill(Color.yellow)
                    RoundedRectangle(cornerRadius: 4).stroke(Color.red, lineWidth: 0.5)
                }
            }
    }
}

struct ObjectHeaderTestApp: View {
    var body: some View {
        let header = ObjectHeader(title: {
            Text("Inspect Electric Pump Motor Long Job Title")
        }, subtitle: {
            Text("Job 819701")
        }, tags: {
            Tag("I am selected")
                .tagStyle(MyCustomTagStyle())
            Tag("Tag1")
            Tag("Tag2")
        }, bodyText: {
            Text("1000-Hamburg, MECHANIK")
        }, footnote: {
            Text("Due on 12/31/16")
        }, descriptionText: {
            Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
        }, status: {
            Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
        }, substatus: {
            Text("High High excel")
        }, detailImage: {
            Image("attachment009").resizable()
        }, detailContent: {
            ChartView(ChartModel(chartType: .line,
                                 data: [[200, 170, 165, 143, 166, 82, 110]],
                                 titlesForCategory: [["Jan", nil, nil, nil, nil, nil, "Jul"]]))
                .frame(width: 312, height: 75)
        })
        .objectHeaderStyle(ObjectHeaderSeparatorStyle())
        
        return List {
            Section(header: header) {}
                .textCase(nil)
                .listRowBackground(Color.preferredColor(.secondaryGroupedBackground))
        }
    }
}

struct ObjectHeaderTestApp_Previews: PreviewProvider {
    static var previews: some View {
        ObjectHeaderTestApp()
    }
}

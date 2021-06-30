import SwiftUI

struct ObjectHeaderExample: View {
    var body: some View {
        List {
            NavigationLink(destination: ObjectItemListView(title: "Analytics: Header Chart", listDataType: HeaderChartExample.self, changeLeftMargin: false, showEditButton: false)) {
                Text("Analytics: Header Chart")
            }
            
            NavigationLink(
                destination: ObjectItemListView(title: "Object Header Spec - Regular", listDataType: ObjectHeaderSpec.self, changeLeftMargin: false, showEditButton: false)) {
                Text("Object Header Spec - Regular")
            }
            
            NavigationLink(destination: ObjectItemListView(title: "Object Header Spec - Compact", listDataType: ObjectHeaderSpecCompact.self, changeLeftMargin: false, showEditButton: false)) {
                Text("Object Header Spec - Compact")
            }
            
            NavigationLink(
                destination: ObjectItemListView(title: "ObjectHeaderViewScenarios", listDataType: ObjectHeaderViewScenarios.self, changeLeftMargin: false, showEditButton: false)) {
                Text("ObjectHeaderViewScenarios")
            }
            
            NavigationLink(
                destination: ObjectHeaderTestApp()) {
                Text("Object Header Test App")
            }
            
            NavigationLink(
                destination: ObjectItemListView(title: "Tags Example", listDataType: ObjectHeaderDeveloperExample.self, changeLeftMargin: false, showEditButton: false)) {
                Text("Tags Example")
            }
        }.background(Color.preferredColor(.primary6))
            .navigationBarTitle("ObjectHeader")
    }
}

struct ObjectHeaderExample_Previews: PreviewProvider {
    static var previews: some View {
        ObjectHeaderExample()
    }
}

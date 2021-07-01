import SwiftUI

struct ContactItemExample: View {
    var body: some View {
        List {
            NavigationLink(destination: ObjectItemListView(title: "Regular View Examples", listDataType: ContactItemRegularExamples.self, changeLeftMargin: false, showEditButton: false)) {
                Text("Regular View Examples")
            }
            
            NavigationLink(destination: ObjectItemListView(title: "Compact View Examples", listDataType: ContactItemCompactExamples.self, changeLeftMargin: false, showEditButton: false)) {
                Text("Compact View Examples")
            }
            
            NavigationLink(destination: ContactItemTapStateExamples()) {
                Text("Tap State Examples")
            }
        }.navigationBarTitle("ContactItem Examples", displayMode: .inline)
    }
}

struct ContactItemExample_Previews: PreviewProvider {
    static var previews: some View {
        ContactItemExample()
    }
}

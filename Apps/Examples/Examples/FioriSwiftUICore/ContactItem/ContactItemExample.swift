import SwiftUI

struct ContactItemExample: View {
    var isNewObjectItem = false
    
    var body: some View {
        List {
            if self.isNewObjectItem {
                Section {
                    NavigationLink {
                        ActivityItemExample()
                    } label: {
                        Text("ActivityItem")
                    }
                    
                    NavigationLink {
                        ActivityItemsExample()
                    } label: {
                        Text("ActivityItems")
                    }
                } header: {
                    Text("ActivityItem")
                        .textCase(.none)
                }
            }

            Section {
                NavigationLink(destination: ObjectItemListView(title: "Regular View Examples", listDataType: ContactItemRegularExamples.self, changeLeftMargin: false, showEditButton: false, isNewObjectItem: self.isNewObjectItem)) {
                    Text("Regular View Examples")
                }
                
                NavigationLink(destination: ObjectItemListView(title: "Compact View Examples", listDataType: ContactItemCompactExamples.self, changeLeftMargin: false, showEditButton: false, isNewObjectItem: self.isNewObjectItem)) {
                    Text("Compact View Examples")
                }
                
                NavigationLink(destination: ContactItemTapStateExamples(isNewObjectItem: self.isNewObjectItem)) {
                    Text("Tap State Examples")
                }
            } header: {
                Text("ContactItem")
                    .textCase(.none)
            }
        }.navigationBarTitle("ContactItem Examples", displayMode: .inline)
    }
}

struct ContactItemExample_Previews: PreviewProvider {
    static var previews: some View {
        ContactItemExample()
    }
}

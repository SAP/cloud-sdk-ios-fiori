import FioriSwiftUICore
import SwiftUI

struct ObjectItemExample: View {
    var _isNewObjectItem = false
    
    var body: some View {
        List {
            NavigationLink("Object Cell_Single Action_May2018.pdf", destination: ObjectItemSingleActionView(isNewObjectItem: self._isNewObjectItem))

            NavigationLink(
                destination: ObjectItemListView(title: "ObjectCell_Spec_Jan2018", listDataType: ObjectCell_Spec_Jan2018.self, isNewObjectItem: self._isNewObjectItem)) {
                Text("Object Cell Specifications_Jan2018.pdf")
            }
            
            NavigationLink(
                destination: ObjectItemListView(title: "ObjectCell_Rules_&_Alignment.pdf", listDataType: ObjectCell_Rules_Alignment.self, isNewObjectItem: self._isNewObjectItem)) {
                Text("ObjectCell_Rules_&_Alignment.pdf")
            }
            
            NavigationLink(
                destination: ObjectItemListView(title: "Init tests", listDataType: ObjectItemInitExamples.self, isNewObjectItem: self._isNewObjectItem)) {
                Text("Init tests")
            }
            
            NavigationLink(
                destination: ObjectItemListView(title: "Avatars and Icons Tests", listDataType: ObjectItemAvatarsExample.self, isNewObjectItem: self._isNewObjectItem)) {
                Text("Avatars and Icons Tests")
            }
        }.navigationBarTitle("ObjectItem", displayMode: .inline)
    }
}

extension ObjectItemExample {
    init(isNewObjectItem: Bool) {
        self._isNewObjectItem = isNewObjectItem
    }
}

struct ObjectItemSingleActionView: View {
    var _isNewObjectItem = false
    
    var body: some View {
        List {
            NavigationLink("Single Action P6: Follow Button", destination: ObjectItemListView(title: "Single Action P6: Follow Button", listDataType: SingleActionFollowButton.self, isNewObjectItem: self._isNewObjectItem))
            
            NavigationLink("Single Action P6: Follow Button LONG TEXT", destination: ObjectItemListView(title: "Single Action P6: Follow Button LONG TEXT", listDataType: SingleActionLongFollowButton.self, isNewObjectItem: self._isNewObjectItem))
            
            NavigationLink("Single Action P8-9: Profiles", destination: ObjectItemListView(title: "Single Action P8-9: Profiles", listDataType: SingleActionProfiles.self, isNewObjectItem: self._isNewObjectItem))
            
            NavigationLink("Single Action Collection Example", destination: SingleActionCollectionView(isNewObjectItem: self._isNewObjectItem))
        }
    }
}

extension ObjectItemSingleActionView {
    init(isNewObjectItem: Bool) {
        self._isNewObjectItem = isNewObjectItem
    }
}

struct ObjectItemExample_Previews: PreviewProvider {
    static var previews: some View {
        ObjectItemListView(title: "Single Action P6: Follow Button", listDataType: SingleActionFollowButton.self, isNewObjectItem: true)
        
        ObjectItemListView(title: "Single Action P6: Follow Button LONG TEXT", listDataType: SingleActionLongFollowButton.self, isNewObjectItem: true)
        
        ObjectItemListView(title: "Single Action P8-9: Profiles", listDataType: SingleActionProfiles.self, isNewObjectItem: true)
    }
}

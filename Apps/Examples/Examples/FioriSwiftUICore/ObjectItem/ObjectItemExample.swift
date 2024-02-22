import FioriSwiftUICore
import SwiftUI

struct ObjectItemExample: View {
    var body: some View {
        List {
            NavigationLink("Object Cell_Single Action_May2018.pdf", destination: ObjectItemSingleActionView())
            
            NavigationLink(
                destination: ObjectItemListView(title: "ObjectCell_Spec_Jan2018", listDataType: ObjectCell_Spec_Jan2018.self))
            {
                Text("Object Cell Specifications_Jan2018.pdf")
            }
            
            NavigationLink(
                destination: ObjectItemListView(title: "ObjectCell_Rules_&_Alignment.pdf", listDataType: ObjectCell_Rules_Alignment.self))
            {
                Text("ObjectCell_Rules_&_Alignment.pdf")
            }
            
            NavigationLink(
                destination: ObjectItemListView(title: "Init tests", listDataType: ObjectItemInitExamples.self))
            {
                Text("Init tests")
            }
            
            NavigationLink(
                destination: ObjectItemListView(title: "Avatars and Icons Tests", listDataType: ObjectItemAvatarsExample.self))
            {
                Text("Avatars and Icons Tests")
            }
        }.navigationBarTitle("ObjectItem", displayMode: .inline)
    }
}

struct ObjectItemSingleActionView: View {
    var body: some View {
        List {
            NavigationLink("Single Action P6: Follow Button", destination: ObjectItemListView(title: "Single Action P6: Follow Button", listDataType: SingleActionFollowButton.self))
            
            NavigationLink("Single Action P6: Follow Button LONG TEXT", destination: ObjectItemListView(title: "Single Action P6: Follow Button LONG TEXT", listDataType: SingleActionLongFollowButton.self))
            
            NavigationLink("Single Action P8-9: Profiles", destination: ObjectItemListView(title: "Single Action P8-9: Profiles", listDataType: SingleActionProfiles.self))
            
            NavigationLink("Single Action Collection Example", destination: SingleActionCollectionView())
        }
    }
}

struct ObjectItemExample_Previews: PreviewProvider {
    static var previews: some View {
        ObjectItemExample()
    }
}

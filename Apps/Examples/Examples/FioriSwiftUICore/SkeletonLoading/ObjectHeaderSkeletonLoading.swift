import FioriSwiftUICore
import SwiftUI

struct ObjectHeaderSkeletonLoading: View {
    @State var isLoading: Bool = true
    
    var header: some View {
        ObjectHeader(title: {
            Text("Inspect Electric Pump Motor")
        }, subtitle: {
            Text("Job 819701")
        }, tags: {
            Tag("Selected")
            Tag("Tag1")
            Tag("Tag2")
        }, bodyText: {
            Text("1000-Hamburg, MECHANIK")
        }, footnote: {
            Text("Due on 12/31/16")
        }, status: {
            Text("Status")
        }, substatus: {
            Text("High excel")
        }, detailImage: {
            Image("attachment009").resizable()
        })
        .frame(minHeight: 180)
        .background(Color.preferredColor(.secondaryGroupedBackground))
    }
    
    var skeletonHeader1: some View {
        ObjectHeaderSkeletonLoadingPattern.allField
            .frame(minHeight: 180)
            .background(Color.preferredColor(.secondaryGroupedBackground))
    }
    
    var skeletonHeader2: some View {
        ObjectHeaderSkeletonLoadingPattern.noDetailImage
            .frame(minHeight: 180)
            .background(Color.preferredColor(.secondaryGroupedBackground))
    }
    
    var skeletonHeader3: some View {
        ObjectHeaderSkeletonLoadingPattern.noTag
            .frame(minHeight: 180)
            .background(Color.preferredColor(.secondaryGroupedBackground))
    }
    
    var body: some View {
        List {
            Toggle("Skeleton Loading", isOn: self.$isLoading)
            Section(header: self.isLoading ? self.skeletonHeader1.typeErased : self.header.typeErased) {}
                .listRowBackground(Color.preferredColor(.primaryGroupedBackground))
                .environment(\.isLoading, self.isLoading)
                
            Section(header: self.isLoading ? self.skeletonHeader2.typeErased : self.header.typeErased) {}
                .listRowBackground(Color.preferredColor(.primaryGroupedBackground))
                .environment(\.isLoading, self.isLoading)
            
            Section(header: self.isLoading ? self.skeletonHeader3.typeErased : self.header.typeErased) {}
                .listRowBackground(Color.preferredColor(.primaryGroupedBackground))
                .environment(\.isLoading, self.isLoading)
        }
        .navigationBarTitle("Object Header", displayMode: .inline)
    }
}

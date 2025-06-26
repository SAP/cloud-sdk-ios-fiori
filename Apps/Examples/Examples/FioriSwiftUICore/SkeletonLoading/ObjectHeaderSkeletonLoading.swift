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
        .padding(.horizontal)
        .background(Color.preferredColor(.secondaryGroupedBackground))
    }
    
    var skeletonHeader1: some View {
        VStack {
            ObjectHeaderSkeletonLoadingPattern.allField
                .frame(maxWidth: .infinity, minHeight: 180)
                .padding(.horizontal)
                .background(Color.preferredColor(.secondaryGroupedBackground))
        }
    }

    var skeletonHeader2: some View {
        VStack {
            ObjectHeaderSkeletonLoadingPattern.noDetailImage
                .frame(maxWidth: .infinity, minHeight: 180)
                .padding(.horizontal)
                .background(Color.preferredColor(.secondaryGroupedBackground))
        }
    }

    var skeletonHeader3: some View {
        VStack {
            ObjectHeaderSkeletonLoadingPattern.noTag
                .frame(maxWidth: .infinity, minHeight: 180)
                .padding(.horizontal)
                .background(Color.preferredColor(.secondaryGroupedBackground))
        }
    }
    
    var body: some View {
        List {
            Toggle("Skeleton Loading", isOn: self.$isLoading)
            
            Section(header: self.isLoading ? self.skeletonHeader1.typeErased : self.header.typeErased) {}
                .id(self.isLoading)
                .textCase(nil)
            
            Section(header: self.isLoading ? self.skeletonHeader2.typeErased : self.header.typeErased) {}
                .id(self.isLoading)
                .textCase(nil)
            
            Section(header: self.isLoading ? self.skeletonHeader3.typeErased : self.header.typeErased) {}
                .id(self.isLoading)
                .textCase(nil)
        }
        .listRowBackground(Color.preferredColor(.secondaryGroupedBackground))
        .environment(\.isLoading, self.isLoading)
        .navigationBarTitle("Object Header", displayMode: .inline)
    }
}

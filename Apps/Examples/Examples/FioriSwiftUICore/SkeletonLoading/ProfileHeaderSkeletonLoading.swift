import FioriSwiftUICore
import SwiftUI

struct ProfileHeaderSkeletonLoading: View {
    @State var isLoading: Bool = true
    
    @ViewBuilder var detailContent: some View {
        HStack(spacing: 30) {
            Button(action: {}, label: {
                Image(systemName: "mail")
            })
            Button(action: {}, label: {
                Image(systemName: "message")
            })
                
            Button(action: {}, label: {
                Image(systemName: "phone")
            })
        }
    }

    var profileHeader: some View {
        ProfileHeader(detailImage: {
            Image("ProfilePic").resizable()
        }, title: {
            Text("Title")
        }, subtitle: {
            Text("This is a subtitle.")
        }, description: {
            Text("This is a description.")
        }, detailContent: {
            self.detailContent
        })
    }
    
    var body: some View {
        ScrollView {
            Toggle("Skeleton Loading", isOn: self.$isLoading)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            LazyVStack(alignment: .center, pinnedViews: [.sectionHeaders], content: {
                Section {
                    ForEach(0 ..< 6) { item in
                        Text("List Item \(item)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .cornerRadius(10)
                            .skeletonLoading(isLoading: self.isLoading)
                    }
                } header: {
                    self.profileHeader
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.preferredColor(.secondaryGroupedBackground))
                }
            })
            .environment(\.isLoading, self.isLoading)
        }
        .navigationBarTitle("Profile Header", displayMode: .inline)
    }
}

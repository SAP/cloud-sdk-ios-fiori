import FioriSwiftUICore
import SwiftUI

struct ProfileHeaderStaticExample: View {
    @State var useButtonForDetails = false
    
    @ViewBuilder var detailContent: some View {
        if self.useButtonForDetails {
            FioriButton { _ in
                Text("Label")
            }
        } else {
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
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button(action: {
                        self.useButtonForDetails.toggle()
                    }, label: {
                        Text("Icons / Button")
                    })
                } label: {
                    Text("Styles")
                }
            }
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, pinnedViews: [.sectionHeaders], content: {
                Section {
                    ForEach(0 ..< 30) { item in
                        Text("List Item \(item)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.gray)
                            .cornerRadius(10)
                    }
                } header: {
                    self.profileHeader
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.preferredColor(.secondaryGroupedBackground))
                }
            })
        }
        .navigationTitle("Static Header")
    }
}

#Preview {
    ProfileHeaderStaticExample()
}

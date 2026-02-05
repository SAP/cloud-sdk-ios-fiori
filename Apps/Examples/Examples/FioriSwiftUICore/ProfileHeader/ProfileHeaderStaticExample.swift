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
                        .frame(minWidth: 44, minHeight: 44)
                })
                Button(action: {}, label: {
                    Image(systemName: "message")
                        .frame(minWidth: 44, minHeight: 44)
                })
                
                Button(action: {}, label: {
                    Image(systemName: "phone")
                        .frame(minWidth: 44, minHeight: 44)
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
        if #available(iOS 26, *) {
            list.scrollEdgeEffectStyle(.hard, for: .top)
        } else {
            self.list
        }
    }
    
    var list: some View {
        List {
            Section {
                ForEach(0 ..< 30) { item in
                    Text("List Item \(item)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .cornerRadius(10)
                }
            } header: {
                self.profileHeader
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.preferredColor(.primaryBackground))
            }
        }
        .listStyle(.plain)
        .navigationTitle("Static Header")
    }
}

#Preview {
    ProfileHeaderStaticExample()
}

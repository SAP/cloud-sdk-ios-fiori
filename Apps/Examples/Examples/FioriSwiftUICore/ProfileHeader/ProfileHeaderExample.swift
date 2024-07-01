import FioriSwiftUICore
import SwiftUI

struct ProfileHeaderExample: View {
    var body: some View {
        List {
            NavigationLink {
                ProfileHeaderStaticExample()
            } label: {
                Text("Static Profile Header")
            }

            NavigationLink {
                ProfileHeaderAnimatableExample()
            } label: {
                Text("Animatable Profile Header")
            }
        }
        .navigationTitle("Profile")
    }
}

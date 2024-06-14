import FioriSwiftUICore
import SwiftUI

struct BannerMessageExample: View {
    var body: some View {
        List {
            NavigationLink {
                BannerMessageModifierExample()
            } label: {
                Text("Modifer Example")
            }
            
            NavigationLink {
                BannerMessageCustomInitExample()
            } label: {
                Text("Custom Creation Example")
            }
        }
    }
}

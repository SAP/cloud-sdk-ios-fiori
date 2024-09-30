import FioriSwiftUICore
import SwiftUI

struct BannerMessageExample: View {
    var body: some View {
        List {
            NavigationLink {
                BannerMessageModifierExample()
            } label: {
                Text("Modifier Example")
            }
            
            NavigationLink {
                BannerMessageCustomInitExample()
            } label: {
                Text("Custom Creation Example")
            }
            
            NavigationLink("Multi-Message Handling Banner", destination: BannerMultiMessageExample())
            
            NavigationLink {
                BannerMultiMessageCustomInitExample()
            } label: {
                Text("Multi-Message Handling Banner - customized")
            }
        }
    }
}

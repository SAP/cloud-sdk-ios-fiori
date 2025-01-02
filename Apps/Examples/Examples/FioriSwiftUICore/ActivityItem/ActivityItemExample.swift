import FioriSwiftUICore
import SwiftUI

struct ActivityItemExample: View {
    var body: some View {
        List {
            Section {
                ActivityItem(icon: Image(systemName: "phone"), subtitle: AttributedString("phone"))
                ActivityItem(icon: Image(systemName: "envelope"), subtitle: AttributedString("envelope"))
                ActivityItem(icon: Image(systemName: "message"), subtitle: AttributedString("message"))
                ActivityItem(icon: Image(systemName: "video"), subtitle: AttributedString("video"))
            } header: {
                Text("Normal-Vertical")
            }
            
            Section {
                ActivityItem(icon: Image(systemName: "phone"), subtitle: AttributedString("phone"), layout: .horizontal)
                ActivityItem(icon: Image(systemName: "envelope"), subtitle: AttributedString("envelope"), layout: .horizontal)
                ActivityItem(icon: Image(systemName: "message"), subtitle: AttributedString("message"), layout: .horizontal)
                ActivityItem(icon: Image(systemName: "video"), subtitle: AttributedString("video"), layout: .horizontal)
            } header: {
                Text("Normal-Horizontal")
            }
            
            Section {
                ActivityItem(icon: Image(systemName: "phone"))
                ActivityItem(icon: Image(systemName: "envelope"))
                ActivityItem(icon: Image(systemName: "message"))
                ActivityItem(icon: Image(systemName: "video"))
            } header: {
                Text("Only Icon")
            }
            
            Section {
                ActivityItem(subtitle: AttributedString("phone"))
                ActivityItem(subtitle: AttributedString("envelope"))
                ActivityItem(subtitle: AttributedString("message"))
                ActivityItem(subtitle: AttributedString("video"))
            } header: {
                Text("Only Subtitle")
            }
        }
        .navigationTitle(Text("ActivityItemExample"))
    }
}

#Preview {
    ActivityItemExample()
}

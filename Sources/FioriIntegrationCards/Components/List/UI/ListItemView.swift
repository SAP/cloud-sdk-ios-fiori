import SwiftUI

struct ListItemView: View {
    let icon: Icon?
    let title: String?
    let description: String?
    let actions: [Action] = []
    let highlight: Highlight?
    let info: Info?
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            SafeView(highlight)
            HStack(alignment: .center, spacing: 12) {
                SafeView(self.icon)
                    .frame(width: 45, height: 45, alignment: .center)
                VStack(alignment: .leading, spacing: 3) {
                    SafeText(title)
                    HStack(alignment: .center, spacing: 8) {
                        SafeText(description).lineLimit(1).opacity(0.6)
                        Spacer()
                        SafeView(info)
                    }
                }
            }
            .padding(EdgeInsets(top: 10.5, leading: 0, bottom: 10.5, trailing: 0))
        }
    }
}

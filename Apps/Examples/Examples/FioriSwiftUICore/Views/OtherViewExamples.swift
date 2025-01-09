import SwiftUI

struct OtherViewExamples: View {
    var body: some View {
        List {
            Text("View Examples")
            NavigationLink(
                destination: KeyValueItemExample())
            {
                Text("KeyValueItem Example")
            }
        }
    }
}

#Preview {
    OtherViewExamples()
}

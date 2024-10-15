import FioriSwiftUICore
import SwiftUI

struct ToastMessageExample: View {
    @State var show: Bool = false
    
    var body: some View {
        List {
            ForEach(0 ..< 6) { index in
                Text("cell at index: \(index)")
            }
            Button {
                self.show.toggle()
            } label: {
                Text("Show / Hide")
            }
        }
        .toastMessage(isPresented: self.$show,
                      icon: {
                          Image(systemName: "info.circle")
                      },
                      title: {
                          Text("Toast Message Title")
                      },
                      duration: 5)
        .navigationTitle("Toast Message")
    }
}

import FioriSwiftUICore
import SwiftUI

struct ToastMessageExample: View {
    var body: some View {
        List {
            NavigationLink("Basic Example",
                           destination: ToastMessageBasicExample())
            NavigationLink("Position",
                           destination: ToastMessagePositionExample())
        }
        .navigationTitle("Toast Message")
    }
}

struct ToastMessageBasicExample: View {
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
    }
}

struct ToastMessagePositionExample: View {
    @State var show: Bool = false
    @State var selectedPosition: ToastMessagePosition = .topLeading
    
    var body: some View {
        VStack {
            HStack {}
                .frame(maxWidth: 500, maxHeight: 500)
                .border(.blue, width: 2)
                .toastMessage(isPresented: self.$show,
                              icon: {
                                  Image(systemName: "info.circle")
                              },
                              title: {
                                  Text("Toast Message Title")
                              },
                              duration: .infinity,
                              position: self.selectedPosition)
                .padding(20)
            Button {
                self.show.toggle()
            } label: {
                Text("Show / Hide")
            }
            Picker("Position", selection: self.$selectedPosition) {
                ForEach(ToastMessagePosition.allCases) { position in
                    Text(position.rawValue)
                }
            }
        }
    }
}

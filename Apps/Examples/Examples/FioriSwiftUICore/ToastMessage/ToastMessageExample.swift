import FioriSwiftUICore
import SwiftUI

struct ToastMessageExample: View {
    @State private var showSheetView = false

    var body: some View {
        List {
            NavigationLink("Basic Example",
                           destination: ToastMessageBasicExample())
            NavigationLink("Position",
                           destination: ToastMessagePositionExample())
            NavigationLink("Custom Style",
                           destination: ToastMessageCustomStyleExample())
            Button("Sheet View UI Hang") {
                self.showSheetView.toggle()
            }
            .sheet(isPresented: self.$showSheetView) {
                ToastMessageSheetViewExample()
                    .presentationDetents([.medium, .large])
            }
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
        .navigationTitle("Toast Message")
    }
}

struct ToastMessagePositionExample: View {
    @State var selectedPosition: ToastMessagePosition = .above
    @State var spacing: CGFloat = 0
    @State var parentViewHeight: CGFloat = 100
    @State var showIcon = false

    var body: some View {
        VStack {
            HStack {}
                .frame(maxWidth: 300, maxHeight: self.parentViewHeight)
                .border(.blue, width: 1)
                .toastMessage(isPresented: .constant(true),
                              icon: {
                                  self.showIcon ? Image(systemName: "info.circle") : nil
                              },
                              title: {
                                  Text("Unable to submit request. Please try again later.")
                              },
                              duration: .infinity,
                              position: self.selectedPosition,
                              spacing: self.spacing)
                .padding(30)
            VStack {
                Picker("Position", selection: self.$selectedPosition) {
                    ForEach(ToastMessagePosition.allCases) { position in
                        Text(position.rawValue)
                    }
                }
                Text("Spacing: \(self.spacing)")
                Slider(value: self.$spacing, in: -50.0 ... 50.0, step: 5)
                Text("Parent View Height: \(self.parentViewHeight)")
                Slider(value: self.$parentViewHeight, in: 5 ... 300.0, step: 5)
                Toggle("Show Icon", isOn: self.$showIcon)
            }
            .frame(maxWidth: 300)
        }
        .navigationTitle("Toast Message")
    }
}

struct ToastMessageCustomStyleExample: View {
    var body: some View {
        VStack {
            HStack {}
                .frame(maxWidth: 300, maxHeight: 300)
                .toastMessage(isPresented: .constant(true),
                              icon: {
                                  Image(systemName: "info.circle")
                                      .foregroundStyle(.blue)
                              },
                              title: {
                                  Text("Toast Message Title")
                                      .foregroundStyle(.blue)
                              },
                              duration: .infinity,
                              position: .center,
                              backgroundColor: .cyan,
                              borderWidth: 2,
                              borderColor: .blue,
                              shadow: FioriShadowStyle.smallElement)
                .padding(30)
            HStack {}
                .frame(maxWidth: 300, maxHeight: 300)
                .toastMessage(isPresented: .constant(true),
                              icon: {
                                  Image(systemName: "info.circle")
                                      .foregroundStyle(.blue)
                              },
                              title: {
                                  Text("Toast Message Title")
                                      .foregroundStyle(.blue)
                              },
                              duration: .infinity,
                              position: .center,
                              cornerRadius: 50,
                              borderWidth: 5,
                              borderColor: .blue,
                              shadow: FioriShadowStyle.smallElement)
                .padding(30)
            HStack {}
                .frame(maxWidth: 300, maxHeight: 300)
                .toastMessage(isPresented: .constant(true),
                              icon: {
                                  Image(systemName: "info.circle")
                                      .foregroundStyle(.blue)
                              },
                              title: {
                                  Text("Toast Message Title")
                                      .foregroundStyle(.blue)
                              },
                              duration: .infinity,
                              position: .center,
                              cornerRadius: 50,
                              backgroundColor: .cyan,
                              shadow: FioriShadowStyle.smallElement)
                .padding(30)
            HStack {}
                .frame(maxWidth: 300, maxHeight: 300)
                .toastMessage(isPresented: .constant(true),
                              icon: {
                                  Image(systemName: "info.circle")
                                      .foregroundStyle(.blue)
                              },
                              title: {
                                  Text("Toast Message Title")
                                      .foregroundStyle(.blue)
                              },
                              duration: .infinity,
                              position: .center,
                              cornerRadius: 50,
                              backgroundColor: .cyan,
                              borderWidth: 2,
                              borderColor: .blue)
                .padding(30)
            HStack {}
                .frame(maxWidth: 300, maxHeight: 300)
                .toastMessage(isPresented: .constant(true),
                              icon: {
                                  Image(systemName: "info.circle")
                                      .foregroundStyle(.blue)
                              },
                              title: {
                                  Text("Toast Message Title")
                                      .foregroundStyle(.blue)
                              },
                              duration: .infinity,
                              position: .center,
                              shadow: nil)
                .padding(30)
        }
        .navigationTitle("Toast Message")
    }
}

struct ToastMessageSheetViewExample: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Sample text")
                .frame(width: 200, height: 200)
                .border(Color.blue, width: 1)
        }
        .toastMessage(isPresented: .constant(true), icon: {}, title: "Unable to send message", duration: 6, position: .above, spacing: 0, cornerRadius: 14, backgroundColor: .preferredColor(.tertiaryFill))
    }
}

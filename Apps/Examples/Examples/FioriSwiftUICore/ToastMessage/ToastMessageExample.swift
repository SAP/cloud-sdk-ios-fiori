import FioriSwiftUICore
import SwiftUI

struct ToastMessageExample: View {
    @State private var showSheetView = false

    var body: some View {
        List {
            NavigationLink("Basic Instantiation",
                           destination: ToastMessageBasicInstantiationExample())
            NavigationLink("Instantiation with Data Model",
                           destination: ToastMessageDataModelExample())
            NavigationLink("Position and Spacing Parameters",
                           destination: ToastMessagePositionSpacingExample())
            NavigationLink("Custom Styling",
                           destination: ToastMessageCustomStylingExample())
            NavigationLink("Persistence with Custom Vertical Position",
                           destination: ToastMessagePersistenceExample())
            Button("Sheet View UI Hang Fix") {
                self.showSheetView.toggle()
            }
            .sheet(isPresented: self.$showSheetView) {
                ToastMessageSheetViewUIHangFixExample()
                    .presentationDetents([.medium, .large])
            }
        }
        .navigationTitle("Toast Message")
    }
}

struct ToastMessageBasicInstantiationExample: View {
    @State var show: Bool = false
    @State var duration: Double = 2
    @State var selectedAccessibilityMessage: String?
    @Environment(\.globalToastMessageSettings) var globalToastMessageSettings
    
    var body: some View {
        List {
            Button {
                self.show.toggle()
            } label: {
                Text("Show / Hide")
            }
            ToastMessageAccessibilityMessagePicker(selectedAccessibilityMessage: self.$selectedAccessibilityMessage)
            ToastMessageDurationSlider(duration: self.$duration)
        }
        .toastMessage(isPresented: self.$show,
                      icon: {
                          Image(systemName: "info.circle")
                      },
                      title: {
                          Text("Toast Message Title")
                      },
                      duration: self.duration,
                      accessibilityMessage: self.selectedAccessibilityMessage)
        .navigationTitle("Toast Message")
    }
}

struct ToastMessageDataModelExample: View {
    @State var toast: ToastMessage? = nil
    @State var show: Bool = false
    @State var customizeToastMessageStyle: Bool = false
    @State var duration: Double = 5
    @State var selectedAccessibilityMessage: String?
    let toastMessageCustomStyle = ToastMessageRoundedBorderStyle(cornerRadius: 0, backgroundColor: .mint, borderWidth: 2, borderColor: .purple)
    let title = Text("Unable to submit request. Please try again later.")
    let image = Image(systemName: "info.circle")
    
    var body: some View {
        List {
            Button {
                self.show.toggle()
                self.toast = self.show ? ToastMessage(icon: self.customizeToastMessageStyle ?
                    { self.image.foregroundStyle(.orange) } : { self.image },
                    title: self.customizeToastMessageStyle ?
                        { self.title.foregroundStyle(.green) } : { self.title },
                    duration: self.duration,
                    accessibilityMessage: self.selectedAccessibilityMessage) : nil
            } label: {
                Text("Show / Hide")
            }
            Toggle("Apply custom style", isOn: self.$customizeToastMessageStyle)
            ToastMessageDurationSlider(duration: self.$duration)
            ToastMessageAccessibilityMessagePicker(selectedAccessibilityMessage: self.$selectedAccessibilityMessage)
        }
        .ifApply(!self.customizeToastMessageStyle) {
            $0.toastMessage(toast: self.$toast)
        }
        .ifApply(self.customizeToastMessageStyle) {
            $0.toastMessage(toast: self.$toast, style: self.toastMessageCustomStyle)
        }
        .navigationTitle("Toast Message")
    }
}

struct ToastMessagePositionSpacingExample: View {
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

struct ToastMessageCustomStylingExample: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {}
                    .frame(maxWidth: 300, maxHeight: 300)
                    .toastMessage(isPresented: .constant(true),
                                  icon: {
                                      Image(systemName: "info.circle")
                                  },
                                  title: {
                                      Text("Toast Message Title Toast Message Title Toast Message Title")
                                  },
                                  duration: .infinity,
                                  position: .center,
                                  borderWidthIC: 4,
                                  borderColorIC: .pink)
                    .padding(50)
                HStack {}
                    .frame(maxWidth: 300, maxHeight: 300)
                    .toastMessage(isPresented: .constant(true),
                                  icon: {
                                      Image(systemName: "info.circle")
                                  },
                                  title: {
                                      Text("Toast Message Title Toast Message Title Toast Message Title")
                                  },
                                  style: ToastMessageRoundedBorderStyle(borderWidthIC: 4, borderColorIC: .pink))
                    .padding(50)
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
                                  borderWidthIC: 4,
                                  borderColorIC: .pink,
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
                                  style: ToastMessageRoundedBorderStyle(backgroundColor: .cyan,
                                                                        borderWidth: 2,
                                                                        borderColor: .blue,
                                                                        borderWidthIC: 4,
                                                                        borderColorIC: .pink,
                                                                        shadow: FioriShadowStyle.smallElement))
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
                                  style: ToastMessageRoundedBorderStyle(cornerRadius: 50,
                                                                        borderWidth: 5,
                                                                        borderColor: .blue,
                                                                        shadow: FioriShadowStyle.smallElement))
                    .padding(30)
                HStack {}
                    .frame(maxWidth: 300, maxHeight: 300)
                    .toastMessage(isPresented: .constant(true),
                                  icon: {
                                      Image(systemName: "info.circle")
                                          .font(Font.fiori(forTextStyle: .headline))
                                  },
                                  title: {
                                      Text("Toast Message Title")
                                          .font(Font.fiori(forTextStyle: .headline))
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
                                          .font(Font.fiori(forTextStyle: .headline))
                                  },
                                  title: {
                                      Text("Toast Message Title")
                                          .font(Font.fiori(forTextStyle: .headline))
                                  },
                                  duration: .infinity,
                                  position: .center,
                                  style: ToastMessageRoundedBorderStyle(cornerRadius: 50,
                                                                        backgroundColor: .cyan,
                                                                        shadow: FioriShadowStyle.smallElement))
                    .padding(30)
                HStack {}
                    .frame(maxWidth: 300, maxHeight: 300)
                    .toastMessage(isPresented: .constant(true),
                                  icon: {
                                      Image(systemName: "info.circle")
                                          .foregroundStyle(.purple)
                                  },
                                  title: {
                                      Text("Toast Message Title")
                                          .foregroundStyle(.purple)
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
                                          .foregroundStyle(.purple)
                                  },
                                  title: {
                                      Text("Toast Message Title")
                                          .foregroundStyle(.purple)
                                  },
                                  duration: .infinity,
                                  position: .center,
                                  style: ToastMessageRoundedBorderStyle(cornerRadius: 50,
                                                                        backgroundColor: .cyan,
                                                                        borderWidth: 2,
                                                                        borderColor: .blue))
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
                                  style: ToastMessageRoundedBorderStyle(shadow: nil))
                    .padding(30)
            }
        }
        .navigationTitle("Toast Message")
    }
}

struct ToastMessagePersistenceExample: View {
    @Environment(\.globalToastMessageSettings) var globalToastSettings

    var body: some View {
        List {
            Button {
                self.globalToastSettings.wrappedValue.isPresented.toggle()
            } label: {
                Text("Show / Hide")
            }
            Toggle("Apply custom style", isOn: Binding(
                get: { self.globalToastSettings.wrappedValue.isCustomized },
                set: { self.globalToastSettings.wrappedValue.isCustomized = $0 }
            ))
            ToastMessageDurationSlider(duration: Binding(
                get: { self.globalToastSettings.wrappedValue.duration },
                set: { self.globalToastSettings.wrappedValue.duration = $0 }
            ))
            ToastMessageAccessibilityMessagePicker(selectedAccessibilityMessage: Binding(
                get: { self.globalToastSettings.wrappedValue.accessibilityMessage },
                set: { self.globalToastSettings.wrappedValue.accessibilityMessage = $0 }
            ))
        }
        .navigationTitle("Toast Message")
    }
}

struct ToastMessageSheetViewUIHangFixExample: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Sample text")
                .frame(width: 200, height: 200)
                .border(Color.blue, width: 1)
        }
        .toastMessage(isPresented: .constant(true), icon: {}, title: "Unable to send message", duration: 6, position: .above, spacing: 0, cornerRadius: 14, backgroundColor: .preferredColor(.tertiaryFill))
    }
}

struct ToastMessageAccessibilityMessagePicker: View {
    @Binding var selectedAccessibilityMessage: String?
    let accessibilityMessagePresets: [String?] = [nil, "", "Product saved.", "Unable to submit request. Please try again later."]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Accessibility Message")
            Picker("Accessibility Message", selection: self.$selectedAccessibilityMessage) {
                Text("Unset").tag(self.accessibilityMessagePresets[0])
                Text("Empty").tag(self.accessibilityMessagePresets[1])
                Text("Short").tag(self.accessibilityMessagePresets[2])
                Text("Long").tag(self.accessibilityMessagePresets[3])
            }
            .pickerStyle(.segmented)
        }
    }
}

struct ToastMessageDurationSlider: View {
    @Binding var duration: Double
    var body: some View {
        VStack(alignment: .leading) {
            Text("Duration: \(String(format: "%.0f", self.duration)) second\(self.duration == 1 ? "" : "s")")
            Slider(value: self.$duration, in: 1 ... 10, step: 1)
        }
    }
}

extension EnvironmentValues {
    @Entry var globalToastMessageSettings: Binding<GlobalToastMessageSettings> = .constant(GlobalToastMessageSettings())
}

@Observable
class GlobalToastMessageSettings: ObservableObject {
    var isPresented = false
    var isCustomized = false
    var duration: Double = 5
    var accessibilityMessage: String? = nil
}

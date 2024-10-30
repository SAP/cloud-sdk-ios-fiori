import FioriSwiftUICore
import Foundation
import SwiftUI

struct LoadingIndicatorExample: View {
    @State var isPresented1: Bool = true
    @State var isPresented2: Bool = false
    @State var isPresented3: Bool = true
    @State var isPresented4: Bool = true
    @State var isPresented5: Bool = true
    @State var isPresented6: Bool = true
    @State var isPresented7: Bool = true
    var message: AttributedString {
        var result = AttributedString("bottom indicator")
        result.font = .largeTitle
        result.foregroundColor = .white
        result.backgroundColor = .blue
        return result
    }

    var body: some View {
        List {
            Section("Default Loading Indicator") {
                LoadingIndicatorView(title: "Loading...", isPresented: self.$isPresented1)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding()
            }.headerProminence(.increased)

            Section("Based On The Use Of Overlay") {
                VStack {
                    Rectangle()
                        .fill(Color.preferredColor(.accentBackground10))
                        .frame(height: 150)
                        .overlay(alignment: .center, content: {
                            LoadingIndicatorView(title: {
                                Text(" delay/show/dismiss")
                                    .font(.system(size: 12))
                                    .rainbow()
                            }, duration: 3, isPresented: self.$isPresented2)
                                .indicatorPosition(.top)
                                .indicatorTint(Color.random)
                        })
                    Button("Show/Hide Customized Loading Indicator") {
                        self.isPresented2.toggle()
                    }.buttonStyle(.borderedProminent)
                }
            }.headerProminence(.increased)
            Section("Control Size") {
                VStack(alignment: .leading) {
                    LoadingIndicatorView(title: "mini size indicator", isPresented: self.$isPresented3)
                        .indicatorPosition(.leading)
                        .indicatorControlSize(.mini)
                    LoadingIndicatorView(title: "small size indicator", isPresented: self.$isPresented3)
                        .indicatorPosition(.leading)
                        .indicatorControlSize(.small)
                    LoadingIndicatorView(title: "regular size indicator", isPresented: self.$isPresented3)
                        .indicatorPosition(.leading)
                        .indicatorControlSize(.regular)
                    LoadingIndicatorView(title: "large size indicator", isPresented: self.$isPresented6)
                        .indicatorPosition(.leading)
                        .indicatorControlSize(.large)
                    if #available(iOS 17.0, *) {
                        LoadingIndicatorView(title: "extraLarge size indicator", isPresented: self.$isPresented6)
                            .indicatorPosition(.leading)
                            .indicatorControlSize(.extraLarge)
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }.headerProminence(.increased)
            Section("Position And Custom Text") {
                VStack(alignment: .center) {
                    LoadingIndicatorView(title: "leading indicator", isPresented: self.$isPresented3)
                        .indicatorPosition(.leading)
                        .indicatorTint(Color.random)
                    Spacer()
                    if #available(iOS 17.0, *) {
                        LoadingIndicatorView(title: {
                            Text("top indicator")
                                .font(.system(size: 8))
                                .foregroundStyle(Color.red)
                        }, isPresented: self.$isPresented5)
                            .indicatorPosition(.top)
                            .indicatorTint(Color.random)
                    } else {
                        // Fallback on earlier versions
                    }
                    Spacer()
                    LoadingIndicatorView(title: {
                        Text("trailing indicator")
                            .font(.largeTitle)
                            .foregroundStyle(Color.green)
                    }, isPresented: self.$isPresented4)
                        .indicatorPosition(.trailing)
                        .indicatorTint(Color.random)
                    Spacer()
                    LoadingIndicatorView(title: self.message, isPresented: self.$isPresented6)
                        .indicatorPosition(.bottom)
                        .indicatorTint(Color.random)
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding()
            }
            .headerProminence(.increased)

            Section("Delay 10 Seconds Dismiss") {
                VStack {
                    LoadingIndicatorView(title: "Loading...", duration: 10, isPresented: self.$isPresented7)
                        .indicatorTint(Color.random)
                        .indicatorControlSize(.large)
                    Button("Show") {
                        self.isPresented7 = true
                    }.buttonStyle(.borderedProminent)
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding()
            }
            .headerProminence(.increased)
        }
    }
}

struct Rainbow: ViewModifier {
    let hueColors = stride(from: 0, to: 1, by: 0.01).map {
        Color(hue: $0, saturation: 1, brightness: 1)
    }

    func body(content: Content) -> some View {
        content
            .overlay(GeometryReader { (proxy: GeometryProxy) in
                ZStack {
                    LinearGradient(gradient: Gradient(colors: self.hueColors),
                                   startPoint: .leading,
                                   endPoint: .trailing)
                        .frame(width: proxy.size.width)
                }
            })
            .mask(content)
    }
}

extension View {
    func rainbow() -> some View {
        self.modifier(Rainbow())
    }
}

#Preview {
    LoadingIndicatorExample()
}

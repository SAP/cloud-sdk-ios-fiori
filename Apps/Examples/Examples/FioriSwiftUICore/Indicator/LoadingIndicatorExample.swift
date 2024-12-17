import FioriSwiftUICore
import Foundation
import SwiftUI

struct LoadingIndicatorExample: View {
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
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
                Section {
                    LoadingIndicator(title: "Loading...", isPresented: .constant(true))
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding()
                } header: {
                    Text("Default Loading Indicator")
                        .padding(.leading, 20)
                        .fontWeight(.bold)
                }.padding(.bottom, 10)
                
                Section {
                    LoadingIndicator(title: "Loading...", isPresented: .constant(true))
                        .loadingIndicatorStyle(.nss(.file("FioriLoadingIndicatorView")))
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding()
                } header: {
                    Text("NSS Style Loading Indicator")
                        .padding(.leading, 20)
                        .fontWeight(.bold)
                }.padding(.bottom, 10)
                
                Section {
                    VStack {
                        Rectangle()
                            .fill(Color.preferredColor(.accentBackground10))
                            .frame(height: 150)
                            .overlay(alignment: .center, content: {
                                LoadingIndicator(title: {
                                    Text(" delay/show/dismiss")
                                        .font(.system(size: 12))
                                        .rainbow()
                                }, progress: {
                                    Progress()
                                }, duration: 3, isPresented: self.$isPresented2)
                                    .indicatorPosition(.top)
                                    .indicatorTint(Color.random)
                            })
                        Button("Show/Hide Customized Loading Indicator") {
                            self.isPresented2.toggle()
                        }.buttonStyle(.borderedProminent)
                    }
                } header: {
                    Text("Based On The Use Of Overlay")
                        .padding(.leading, 20)
                        .fontWeight(.bold)
                }.padding(.bottom, 10)

                Section {
                    VStack(alignment: .leading) {
                        LoadingIndicator(title: "mini size indicator", isPresented: self.$isPresented3)
                            .indicatorPosition(.leading)
                            .indicatorControlSize(.mini)
                        LoadingIndicator(title: "small size indicator", isPresented: self.$isPresented3)
                            .indicatorPosition(.leading)
                            .indicatorControlSize(.small)
                        LoadingIndicator(title: "regular size indicator", isPresented: self.$isPresented3)
                            .indicatorPosition(.leading)
                            .indicatorControlSize(.regular)
                        LoadingIndicator(title: "large size indicator", isPresented: self.$isPresented3)
                            .indicatorPosition(.leading)
                            .indicatorControlSize(.large)
                        if #available(iOS 17.0, *) {
                            LoadingIndicator(title: "extraLarge size indicator", isPresented: self.$isPresented3)
                                .indicatorPosition(.leading)
                                .indicatorControlSize(.extraLarge)
                        } else {
                            // Fallback on earlier versions
                        }
                    }
                    .padding(.leading, 20)
                } header: {
                    Text("Control Size")
                        .padding(.leading, 20)
                        .fontWeight(.bold)
                }.padding(.bottom, 10)

                Section {
                    VStack(alignment: .center) {
                        LoadingIndicator(title: "leading indicator", isPresented: self.$isPresented3)
                            .indicatorPosition(.leading)
                            .indicatorTint(Color.random)
                        Spacer()
                        if #available(iOS 17.0, *) {
                            LoadingIndicator(title: {
                                Text("top indicator")
                                    .font(.system(size: 8))
                                    .foregroundStyle(Color.red)
                            }, progress: {
                                Progress()
                            }, isPresented: self.$isPresented5)
                                .indicatorPosition(.top)
                                .indicatorTint(Color.random)
                        } else {
                            // Fallback on earlier versions
                        }
                        Spacer()
                        LoadingIndicator(title: {
                            Text("trailing indicator")
                                .font(.largeTitle)
                                .foregroundStyle(Color.green)
                        }, progress: {
                            Progress()
                        }, isPresented: self.$isPresented4)
                            .indicatorPosition(.trailing)
                            .indicatorTint(Color.random)
                        Spacer()
                        LoadingIndicator(title: self.message, isPresented: self.$isPresented6)
                            .indicatorPosition(.bottom)
                            .indicatorTint(Color.random)
                    }
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding()
                } header: {
                    Text("Position And Custom Text")
                        .padding(.leading, 20)
                        .fontWeight(.bold)
                }.padding(.bottom, 10)
                
                Section {
                    VStack {
                        LoadingIndicator(title: "Loading...", duration: 10, isPresented: self.$isPresented7)
                            .indicatorTint(Color.random)
                            .indicatorControlSize(.large)
                        Button("Show") {
                            self.isPresented7 = true
                        }.buttonStyle(.borderedProminent)
                    }
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding()
                } header: {
                    Text("Delay 10 Seconds Dismiss")
                        .padding(.leading, 20)
                        .fontWeight(.bold)
                }
            }
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

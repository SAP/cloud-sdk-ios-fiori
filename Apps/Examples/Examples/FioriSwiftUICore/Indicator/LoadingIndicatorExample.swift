import FioriSwiftUICore
import Foundation
import SwiftUI

struct LoadingIndicatorExample: View {
    @State var isPresented1: Bool = true
    @State var isPresented2: Bool = false
    @State var isPresented3: Bool = true
    @State var isPresented4: Bool = true
    @State var isPresented5: Bool = true
    
    var body: some View {
        Spacer()
        Section {
            LoadingIndicatorView(title: "will dismiss after 3 second", duration: 3, isPresented: self.$isPresented1)
                .indicatorPosition(.top)
                .indicatorTint(Color.random)
                .indicatorScaleEffect(1.5)
        }
        Spacer()
        Section {
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
                            .indicatorScaleEffect(1)
                    })
                Button("show Loading Indicator") {
                    self.isPresented2.toggle()
                }
            }
        }
        Spacer()
        Section {
            LoadingIndicatorView(title: "Loading...", isPresented: self.$isPresented3)
                .indicatorPosition(.trailing)
                .indicatorTint(Color.random)
                .indicatorScaleEffect(1.2)
        }
        Spacer()
        Section {
            LoadingIndicatorView(title: "Loading...", isPresented: self.$isPresented4)
                .indicatorPosition(.top)
                .indicatorTint(Color.random)
                .indicatorScaleEffect(1.4)
        }
        Spacer()
        Section {
            LoadingIndicatorView(title: "Loading...", isPresented: self.$isPresented5)
                .indicatorPosition(.bottom)
                .indicatorTint(Color.random)
                .indicatorScaleEffect(1.6)
        }
        Spacer()
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

import Foundation
import SwiftUI

struct ShadowModifier: ViewModifier {
    let isVertical: Bool
    let show: Bool
    
    func body(content: Content) -> some View {
        content
            .shadow(color: self.show ? .black : .clear, radius: 1, x: self.isVertical ? 1 : 0, y: self.isVertical ? 0 : 1)
    }
}

extension View {
    func dropShadow(isVertical: Bool, show: Bool) -> some View {
        self.modifier(ShadowModifier(isVertical: isVertical, show: show))
    }
}

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {}
}

// struct DummyBackground: View {
//    let index: Int
//    let width: CGFloat
//    let height: CGFloat
//    @EnvironmentObject var layoutManager: TableLayoutManager
//    @Environment(\.backgroundColor) var backgroundColor
//
//    init(index: Int, width: CGFloat, height: CGFloat) {
//        self.index = index
//        self.width = width
//        self.height = height
//    }
//
//    var body: some View {
//        Group {
//            let zIndex = self.index == 0 ? 700 : 550 - self.index
//            Rectangle()
//                .fill(self.backgroundColor)
//                .frame(width: width, height: height * self.layoutManager.scaleY, alignment: .topLeading)
//                .zIndex(Double(zIndex))
//        }
//    }
// }

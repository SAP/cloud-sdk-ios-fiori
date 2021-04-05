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

import SwiftUI

extension View {
    func popover(_ presented: Binding<Bool>,
                 @ViewBuilder popView: @escaping () -> some View) -> some View
    {
        modifier(PopoverModifier(isPresented: presented, popView: popView))
    }
}

extension View {
    func frameReader(in coordinateSpace: CoordinateSpace = .global, rect: @escaping (CGRect) -> Void) -> some View {
        onGeometryChange(for: CGRect.self) { proxy in
            proxy.frame(in: coordinateSpace)
        } action: { newValue in
            rect(newValue)
        }
    }
    
    func sizeReader(size: @escaping (CGSize) -> Void) -> some View {
        onGeometryChange(for: CGSize.self) { proxy in
            proxy.size
        } action: { newValue in
            size(newValue)
        }
    }
}

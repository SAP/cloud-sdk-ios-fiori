import SwiftUI

extension View {
    func popover<PopView: View>(_ presented: Binding<Bool>,
                                @ViewBuilder popView: @escaping () -> PopView) -> some View
    {
        modifier(PopoverModifier(isPresented: presented, popView: popView))
    }
}

extension View {
    func frameReader(in coordinateSpace: CoordinateSpace = .global, rect: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader { geometry in
                let frame = geometry.frame(in: coordinateSpace)
                Color.clear
                    .preference(key: ContentFrameReaderPreferenceKey.self, value: frame)
                    .onPreferenceChange(ContentFrameReaderPreferenceKey.self) { newValue in
                        rect(newValue)
                    }
            }
            .hidden()
        )
    }
}

struct ContentFrameReaderPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect { CGRect() }
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) { value = nextValue() }
}

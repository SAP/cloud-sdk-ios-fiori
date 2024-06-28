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
        modifier(FrameReaderModifier(coordinateSpace: coordinateSpace, rect: rect))
    }
    
    func sizeReader(in coordinateSpace: CoordinateSpace = .global, size: @escaping (CGSize) -> Void) -> some View {
        modifier(SizeReaderModifier(coordinateSpace: coordinateSpace, size: size))
    }
}

struct ContentFrameReaderPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect { CGRect() }
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) { value = nextValue() }
}

struct ContentSizeReaderPreferenceKey: PreferenceKey {
    static var defaultValue: CGSize { .zero }
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) { value = nextValue() }
}

struct FrameReaderModifier: ViewModifier {
    let coordinateSpace: CoordinateSpace
    let rect: (CGRect) -> Void
    @State private var lastFrame: CGRect = .zero

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    let frame = geometry.frame(in: self.coordinateSpace)
                    Color.clear
                        .preference(key: ContentFrameReaderPreferenceKey.self, value: frame)
                        .onPreferenceChange(ContentFrameReaderPreferenceKey.self) { newValue in
                            if abs(newValue.width - self.lastFrame.width) > 0.001 ||
                                abs(newValue.height - self.lastFrame.height) > 0.001 ||
                                abs(newValue.origin.x - self.lastFrame.origin.x) > 0.001 ||
                                abs(newValue.origin.y - self.lastFrame.origin.y) > 0.001
                            {
                                self.rect(newValue)
                            }
                        }
                }
                .hidden()
            )
    }
}

struct SizeReaderModifier: ViewModifier {
    let coordinateSpace: CoordinateSpace
    let size: (CGSize) -> Void
    @State private var lastSize: CGSize = .zero

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    let frame = geometry.frame(in: self.coordinateSpace)
                    Color.clear
                        .preference(key: ContentSizeReaderPreferenceKey.self, value: frame.size)
                        .onPreferenceChange(ContentSizeReaderPreferenceKey.self) { newValue in
                            if abs(newValue.width - self.lastSize.width) > 0.001 || abs(newValue.height - self.lastSize.height) > 0.001 {
                                self.lastSize = newValue
                                self.size(newValue)
                            }
                        }
                }
                .hidden()
            )
    }
}

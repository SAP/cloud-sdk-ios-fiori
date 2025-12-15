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
    
    func sizeReader(in coordinateSpace: CoordinateSpace = .global, size: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometry in
                let frame = geometry.frame(in: coordinateSpace)
                Color.clear
                    .preference(key: ContentSizeReaderPreferenceKey.self, value: frame.size)
                    .onPreferenceChange(ContentSizeReaderPreferenceKey.self) { newValue in
                        size(newValue)
                    }
            }
            .hidden()
        )
    }
    
    func fioriSizeReader(in coordinateSpace: CoordinateSpace = .global, size: @escaping (CGSize) -> Void) -> some View {
        onGeometryChange(for: CGSize.self, of: { geometry in
            geometry.frame(in: coordinateSpace).size
        }, action: { newValue in
            size(newValue)
        })
    }
    
    func fioriScrollOffsetReader(_ offset: @escaping (CGPoint) -> Void) -> some View {
        if #available(iOS 18.0, visionOS 2.0, *) {
            onScrollGeometryChange(for: CGPoint.self) { geometry in
                geometry.contentOffset
            } action: { _, newValue in
                offset(newValue)
            }
            .typeErased
        } else {
            typeErased
        }
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

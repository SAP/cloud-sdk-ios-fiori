import Foundation
import SwiftUI

struct OffsetScrollView<Content>: View where Content: View {
    var content: Content

    var axes: Axis.Set

    var showsIndicators: Bool

    @State private var initialOffset: CGPoint? = nil

    @Binding var offset: CGPoint
        
    struct Run: View {
        let block: () -> Void
        
        var body: some View {
            DispatchQueue.main.async(execute: block)
            return AnyView(EmptyView())
        }
    }

    public init(_ axes: Axis.Set = .vertical,
                showsIndicators: Bool = true,
                offset: Binding<CGPoint> = .constant(.zero),
                @ViewBuilder content: () -> Content)
    {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self._offset = offset
        self.content = content()
    }

    public var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
            VStack(alignment: .leading, spacing: 0) {
                GeometryReader { geometry in
                    Run {
                        let globalOrigin = geometry.frame(in: .global).origin
                        self.initialOffset = self.initialOffset ?? globalOrigin
                        let initialOffset = (self.initialOffset ?? .zero)
                        let offset = CGPoint(x: globalOrigin.x - initialOffset.x, y: globalOrigin.y - initialOffset.y)
                        self.offset = offset
                    }
                }.frame(width: 0, height: 0)

                content
            }
        }
    }
}

struct ScrolContentView: View {
    @State var contentOffset = CGPoint()
    @State var contentOffsetUpper = CGPoint()
    @State var contentOffsetLeft = CGPoint()
    
    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            VStack {
                ForEach(0 ..< 100) { _ in
//                    TableRowView(data: ["title","title","title","title","title", "title","title","title","title","title", "title","title","title","title","title", "title","title","title","title","title", "title","title","title","title","title"])
                }
            }
        }
        
//        HStack {
//            VStack {
//                ZStack {
//                    Text("[0, 0]")
//                        .zIndex(900)
//                    Rectangle()
//                        .fill(Color.red)
//                        .frame(width: 100, height: 100)
//                        .zIndex(800)
//                }
//                .zIndex(999)
//
//                OffsetScrollView(
//                    offset: $contentOffsetLeft) {
//                    LazyVStack {
//                        ForEach(0 ..< 100) { i in
//                            Text("[\(i + 1), 0]")
//                                .background(Color.green)
//                        }
//                        .padding()
//                    }
//                    .offset(x: 0, y: contentOffset.y)
//                }
//                .background(Color.orange)
//                .frame(width: 100)
//            }
//
//            VStack(alignment: .leading) {
//                OffsetScrollView(
//                    .horizontal,
//                    offset: $contentOffsetUpper) {
//                    TableRowView(data: ["title","title","title","title","title", "title","title","title","title","title", "title","title","title","title","title", "title","title","title","title","title", "title","title","title","title","title"])
//                        .offset(x: contentOffset.x, y: 0)
//                }
//                .background(Color.yellow)
//                .frame(height: 100)
//
//                OffsetScrollView(
//                    [.horizontal, .vertical],
//                    showsIndicators: true,
//                    offset: $contentOffset
//                ){
//                    LazyVStack {
//                        ForEach(0 ..< 100) { i in
//                            TableRowView(data: ["title","title","title","title","title", "title","title","title","title","title", "title","title","title","title","title", "title","title","title","title","title", "title","title","title","title","title"])
//                        }
//                    }
//                    .offset(x: contentOffsetUpper
//                                .x, y: contentOffsetLeft.y)
//                }
//                .background(Color.gray)
//            }
//        }
//        .padding()
    }
}

struct ScrollView_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScrolContentView()
        }
    }
}

import SwiftUI

@resultBuilder
public enum ListItemsBuilder {
    public static func buildBlock<Content>(_ content: Content) -> [AnyView] where Content: View {
        [content.typeErased]
    }

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> [AnyView] where C0: View, C1: View {
        [c0.typeErased, c1.typeErased]
    }

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> [AnyView] where C0: View, C1: View, C2: View {
        [c0.typeErased, c1.typeErased, c2.typeErased]
    }

    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> [AnyView] where C0: View, C1: View, C2: View, C3: View {
        [c0.typeErased, c1.typeErased, c2.typeErased, c3.typeErased]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> [AnyView] where C0: View, C1: View, C2: View, C3: View, C4: View {
        [c0.typeErased, c1.typeErased, c2.typeErased, c3.typeErased, c4.typeErased]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> [AnyView] where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View {
        [c0.typeErased, c1.typeErased, c2.typeErased, c3.typeErased, c4.typeErased, c5.typeErased]
    }

    public static func buildIf<Content>(_ content: Content?) -> [AnyView] where Content: View {
        [content == nil ? AnyView(EmptyView()) : AnyView(content!)]
    }

    public static func buildEither<TrueContent>(trueC: TrueContent) -> [AnyView] where TrueContent: View {
        [trueC.typeErased]
    }
}

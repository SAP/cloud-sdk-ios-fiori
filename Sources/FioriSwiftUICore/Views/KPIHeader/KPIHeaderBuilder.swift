import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@_functionBuilder
/// `KPIHeader` items builder
public enum KPIHeaderBuilder {
    /// :nodoc:
    public static func buildBlock<Content>(_ content: Content) -> some View where Content: View {
        KPIHeaderContent(list: SingleView(view: content))
    }

    /// :nodoc:
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some View where C0: View, C1: View {
        KPIHeaderContent(list: PairView(first: c0, remainder: SingleView(view: c1)))
    }

    /// :nodoc:
    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some View where C0: View, C1: View, C2: View {
        KPIHeaderContent(list: PairView(first: c0, remainder: PairView(first: c1, remainder: SingleView(view: c2))))
    }

    /// :nodoc:
    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some View where C0: View, C1: View, C2: View, C3: View {
        KPIHeaderContent(list: PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: SingleView(view: c3)))))
    }

    /// :nodoc:
    public static func buildIf<Content>(_ content: Content?) -> some View where Content: View {
        KPIHeaderContent(list: SingleView(view: content == nil ? AnyView(EmptyView()) : AnyView(content!)))
    }

    /// :nodoc:
    public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> some View where TrueContent: View, FalseContent: View {
        KPIHeaderContent(list: ConditionalSingleView<TrueContent, FalseContent>(first: first, second: nil))
    }

    /// :nodoc:
    public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> some View where TrueContent: View, FalseContent: View {
        KPIHeaderContent(list: ConditionalSingleView<TrueContent, FalseContent>(first: nil, second: second))
    }
}

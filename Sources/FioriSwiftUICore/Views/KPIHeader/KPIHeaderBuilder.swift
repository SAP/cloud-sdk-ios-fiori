import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@_functionBuilder
/// `KPIHeader` items builder
public enum KPIHeaderBuilder {
    /// :nodoc:
    public static func buildBlock(_ content: some View) -> some View {
        KPIHeaderContent(list: SingleView(view: content))
    }

    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View) -> some View {
        KPIHeaderContent(list: PairView(first: c0, remainder: SingleView(view: c1)))
    }

    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View) -> some View {
        KPIHeaderContent(list: PairView(first: c0, remainder: PairView(first: c1, remainder: SingleView(view: c2))))
    }

    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View) -> some View {
        KPIHeaderContent(list: PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: SingleView(view: c3)))))
    }

    /// :nodoc:
    public static func buildIf(_ content: (some View)?) -> some View {
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

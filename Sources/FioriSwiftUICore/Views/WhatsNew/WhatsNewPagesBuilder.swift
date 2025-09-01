import SwiftUI

/// Protocol for WhatsNewPageList
public protocol WhatsNewPageList: View, _ViewEmptyChecking {
    associatedtype V: View
    
    /// Number of views in the WhatsNewPageList
    var count: Int { get }
    
    /// The view at the given index in the WhatsNewPageList
    func view(at index: Int) -> V
}

public extension WhatsNewPageList {
    /// :nodoc:
    var body: some View {
        WhatsNewInnerView(pageList: self)
    }
}

public extension WhatsNewPageList {
    /// :nodoc:
    var isEmpty: Bool {
        count == 0
    }
}

public struct WhatsNewInnerView<PageList: WhatsNewPageList>: View {
    let pageList: PageList
    @State var actionButtonTitle: AttributedString = "Next"
    @State private var buttonHeight: CGFloat = 0
    @State private var isCompactMode: Bool = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.whatsNewPageIndex) var whatsNewPageIndex
    @Environment(\.whatsNewPageDidFinish) var whatsNewPageDidFinish

    init(pageList: PageList) {
        self.pageList = pageList
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.preferredColor(.primaryLabel))
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.preferredColor(.quaternaryLabel))
    }
    
    public var body: some View {
        ZStack {
            TabView(selection: self.whatsNewPageIndex) {
                ForEach(0 ..< self.pageList.count, id: \.self) { index in
                    ScrollView {
                        VStack {
                            self.pageList.view(at: index).typeErased
                            Spacer()
                        }
                        .padding(.top, 52)
                        .padding(.bottom, self.buttonHeight + 50)
                    }
                    .padding(.horizontal, self.isCompactMode ? 32 : 72)
                    .tag(index)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .animation(.easeInOut(duration: 1.0), value: self.whatsNewPageIndex.wrappedValue)
            VStack {
                Spacer()
                FioriButton(title: self.actionButtonTitle, action: { _ in
                    if (self.whatsNewPageIndex.wrappedValue ?? 0) < self.pageList.count - 1 {
                        withAnimation {
                            self.whatsNewPageIndex.wrappedValue = (self.whatsNewPageIndex.wrappedValue ?? 0) + 1
                        }
                    } else {
                        self.whatsNewPageDidFinish?()
                    }
                })
                .fioriButtonStyle(FioriPrimaryButtonStyle(201))
                .padding(.bottom, 34)
                .sizeReader { size in
                    self.buttonHeight = size.height
                }
            }
        }
        .sizeReader { size in
            self.isCompactMode = size.width < 540
        }
        .onChange(of: self.whatsNewPageIndex.wrappedValue) {
            withAnimation(.linear(duration: 0)) {
                self.actionButtonTitle = (self.whatsNewPageIndex.wrappedValue ?? 0) < self.pageList.count - 1 ? "Next" : "Start"
            }
        }
    }
}

public struct SingleWhatsNewPage<Content: View>: WhatsNewPageList {
    let view: Content
    
    public var count: Int {
        self.view.isEmpty ? 0 : 1
    }
    
    public func view(at index: Int) -> some View {
        self.view
    }
}

/// Conditional single view
public struct ConditionalSingleWhatsNewPage<TrueContent: View, FalseContent: View>: WhatsNewPageList {
    let first: TrueContent?
    let second: FalseContent?
    
    public var count: Int {
        if let first, !first.isEmpty {
            return 1
        }
        
        if let second, !second.isEmpty {
            return 1
        }
        
        return 0
    }
    
    public func view(at index: Int) -> some View {
        Group {
            if self.first == nil {
                self.second
            } else {
                self.first
            }
        }
    }
}

/// Pair of views
public struct WhatsNewPagePair<First: View, Second: WhatsNewPageList>: WhatsNewPageList {
    let first: First
    let remainder: Second
    
    public var count: Int {
        let firstCount = self.first.isEmpty ? 0 : 1
        return self.remainder.count + firstCount
    }
    
    public func view(at index: Int) -> some View {
        Group {
            if index == 0 {
                self.first
            } else {
                self.remainder.view(at: index - 1)
            }
        }
    }
}

/// Returns an instance of a view that is used internally by the WhatsNewPageView.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@resultBuilder
public enum WhatsNewPagesBuilder {
    /// Builds an empty view from a block containing no statements.
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`
    public static func buildBlock(_ content: some View) -> some WhatsNewPageList {
        SingleWhatsNewPage(view: content)
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View) -> some WhatsNewPageList {
        WhatsNewPagePair(first: c0, remainder: SingleWhatsNewPage(view: c1))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View) -> some WhatsNewPageList {
        WhatsNewPagePair(first: c0, remainder: WhatsNewPagePair(first: c1, remainder: SingleWhatsNewPage(view: c2)))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View) -> some WhatsNewPageList {
        WhatsNewPagePair(first: c0, remainder: WhatsNewPagePair(first: c1, remainder: WhatsNewPagePair(first: c2, remainder: SingleWhatsNewPage(view: c3))))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View) -> some WhatsNewPageList {
        WhatsNewPagePair(first: c0, remainder: WhatsNewPagePair(first: c1, remainder: WhatsNewPagePair(first: c2, remainder: WhatsNewPagePair(first: c3, remainder: SingleWhatsNewPage(view: c4)))))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View) -> some WhatsNewPageList {
        WhatsNewPagePair(first: c0, remainder: WhatsNewPagePair(first: c1, remainder: WhatsNewPagePair(first: c2, remainder: WhatsNewPagePair(first: c3, remainder: WhatsNewPagePair(first: c4, remainder: SingleWhatsNewPage(view: c5))))))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View) -> some WhatsNewPageList {
        WhatsNewPagePair(first: c0, remainder: WhatsNewPagePair(first: c1, remainder: WhatsNewPagePair(first: c2, remainder: WhatsNewPagePair(first: c3, remainder: WhatsNewPagePair(first: c4, remainder: WhatsNewPagePair(first: c5, remainder: SingleWhatsNewPage(view: c6)))))))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View) -> some WhatsNewPageList {
        WhatsNewPagePair(first: c0, remainder: WhatsNewPagePair(first: c1, remainder: WhatsNewPagePair(first: c2, remainder: WhatsNewPagePair(first: c3, remainder: WhatsNewPagePair(first: c4, remainder: WhatsNewPagePair(first: c5, remainder: WhatsNewPagePair(first: c6, remainder: SingleWhatsNewPage(view: c7))))))))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View, _ c8: some View) -> some WhatsNewPageList {
        WhatsNewPagePair(first: c0, remainder: WhatsNewPagePair(first: c1, remainder: WhatsNewPagePair(first: c2, remainder: WhatsNewPagePair(first: c3, remainder: WhatsNewPagePair(first: c4, remainder: WhatsNewPagePair(first: c5, remainder: WhatsNewPagePair(first: c6, remainder: WhatsNewPagePair(first: c7, remainder: SingleWhatsNewPage(view: c8)))))))))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View, _ c8: some View, _ c9: some View) -> some WhatsNewPageList {
        WhatsNewPagePair(first: c0, remainder: WhatsNewPagePair(first: c1, remainder: WhatsNewPagePair(first: c2, remainder: WhatsNewPagePair(first: c3, remainder: WhatsNewPagePair(first: c4, remainder: WhatsNewPagePair(first: c5, remainder: WhatsNewPagePair(first: c6, remainder: WhatsNewPagePair(first: c7, remainder: WhatsNewPagePair(first: c8, remainder: SingleWhatsNewPage(view: c9))))))))))
    }
    
    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    public static func buildIf(_ content: (some View)?) -> some WhatsNewPageList {
        SingleWhatsNewPage(view: content == nil ? AnyView(EmptyView()) : AnyView(content!))
    }

    /// Provides support for "if" statements in multi-statement closures,
    /// producing conditional content for the "then" branch.
    public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> ConditionalSingleTag<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        ConditionalSingleTag(first: first, second: nil)
    }

    /// Provides support for "if-else" statements in multi-statement closures,
    /// producing conditional content for the "else" branch.
    public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> ConditionalSingleTag<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        ConditionalSingleTag(first: nil, second: second)
    }
}

import SwiftUI

public extension View {
    /// A toolbar modifier for fiori style.
    /// - Parameters:
    ///   - items: Indexed views for toolbar items
    /// - Returns: A new view with a bottom tool bar.
    func fioriToolbar<Items: IndexedViewContainer>(@IndexedViewBuilder items: () -> Items) -> some View {
        self.modifier(FioriToolbar<Items>(moreActionOverflow: { EmptyView() }, items: items))
    }
    
    /// A toolbar modifier for fiori style.
    /// - Parameters:
    ///   - helperText: A string for helper text displayed in toolbar stack view.
    ///   - items: Indexed views for toolbar items
    /// - Returns: A new view with a bottom tool bar.
    func fioriToolbar<Items: IndexedViewContainer>(helperText: String? = nil,
                                                   @IndexedViewBuilder items: () -> Items) -> some View
    {
        if let text = helperText, !text.isEmpty {
            self.modifier(FioriToolbar<Items>(helperText: text, moreActionOverflow: { EmptyView() }, items: items))
        } else {
            self.modifier(FioriToolbar<Items>(moreActionOverflow: { EmptyView() }, items: items))
        }
    }
    
    /// A toolbar modifier for fiori style.
    /// - Parameters:
    ///   - helperText: A string for helper text displayed in toolbar stack view.
    ///   - moreActionOverflow: A custom overflow label for wrapped items menu.
    ///   - items: Indexed views for toolbar items
    /// - Returns: A new view with a bottom tool bar.
    func fioriToolbar<Items: IndexedViewContainer>(helperText: String? = nil,
                                                   @ViewBuilder moreActionOverflow: () -> any View = { EmptyView() },
                                                   @IndexedViewBuilder items: () -> Items) -> some View
    {
        if let text = helperText, !text.isEmpty {
            self.modifier(FioriToolbar<Items>(helperText: text, moreActionOverflow: moreActionOverflow, items: items))
        } else {
            self.modifier(FioriToolbar<Items>(moreActionOverflow: moreActionOverflow, items: items))
        }
    }
    
    /// A toolbar modifier for fiori style.
    /// - Parameters:
    ///   - helperText: A helper text container displayed in toolbar stack view.
    ///   - moreActionOverflow: A custom overflow label for wrapped items menu.
    ///   - items: Indexed views for toolbar items
    /// - Returns: A new view with a bottom tool bar.
    func fioriToolbar<Items: IndexedViewContainer>(@ViewBuilder helperText: () -> any View = { EmptyView() },
                                                   @ViewBuilder moreActionOverflow: () -> any View = { EmptyView() },
                                                   @IndexedViewBuilder items: () -> Items) -> some View
    {
        self.modifier(FioriToolbar<Items>(helperText: helperText, moreActionOverflow: moreActionOverflow, items: items))
    }
}

import SwiftUI

public extension View {
    /// A toolbar modifier for fiori style.
    /// - Parameters:
    ///   - helperText: A string for helper text displayed in toolbar stack view.
    ///   - customOverflow: A custom overflow label for wrapped items menu.
    ///   - items: Indexed views for toolbar items
    /// - Returns: A new view with a bottom tool bar.
    func fioriToolbar<Items: IndexedViewContainer>(helperText: String? = nil, customOverflow: (any View)? = nil, @IndexedViewBuilder items: () -> Items) -> some View {
        if let text = helperText, !text.isEmpty {
            self.modifier(FioriToolbar<Items>(helperText: text, customOverflow: customOverflow, items: items))
        } else {
            self.modifier(FioriToolbar<Items>(customOverflow: customOverflow, items: items))
        }
    }
    
    /// A toolbar modifier for fiori style.
    /// - Parameters:
    ///   - helperText: A helper text container displayed in toolbar stack view.
    ///   - customOverflow: A custom overflow label for wrapped items menu.
    ///   - items: Indexed views for toolbar items
    /// - Returns: A new view with a bottom tool bar.
    func fioriToolbar<Items: IndexedViewContainer>(helperText: (any View)?, customOverflow: (any View)? = nil, @IndexedViewBuilder items: () -> Items) -> some View {
        self.modifier(FioriToolbar<Items>(helperText: helperText, customOverflow: customOverflow, items: items))
    }
    
    /// A toolbar modifier for fiori style.
    /// - Parameters:
    ///   - customOverflow: A custom overflow label for wrapped items menu.
    ///   - items: Indexed views for toolbar items
    /// - Returns: A new view with a bottom tool bar.
    func fioriToolbar<Items: IndexedViewContainer>(customOverflow: (any View)? = nil, @IndexedViewBuilder items: () -> Items) -> some View {
        self.modifier(FioriToolbar<Items>(customOverflow: customOverflow, items: items))
    }
}

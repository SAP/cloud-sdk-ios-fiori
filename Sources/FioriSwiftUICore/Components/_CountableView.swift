import Foundation
import SwiftUI

// A view that returns children based on the `maxNumberOfItems` environment value.
// You can get total number of children from ItemCountPreferenceKey.
struct _CountableView<Content: View>: View {
    let content: Content
    let maxNumberOfItems: Int
    
    init(maxNumberOfItems: Int = 0, @ViewBuilder content: () -> Content) {
        self.maxNumberOfItems = maxNumberOfItems
        self.content = content()
    }
    
    var body: some View {
        _VariadicView.Tree(_CountableViewLayout(maxNumberOfItems: self.maxNumberOfItems)) {
            self.content
        }
    }
}

struct _CountableViewLayout: _VariadicView_MultiViewRoot {
    let maxNumberOfItems: Int
    
    func body(children: _VariadicView.Children) -> some View {
        self.makeBody(children)
            .preference(key: ItemCountPreferenceKey.self, value: children.count)
    }
    
    @ViewBuilder
    func makeBody(_ children: _VariadicView.Children) -> some View {
        if self.maxNumberOfItems <= 0 {
            children
        } else {
            ForEach(0 ..< min(self.maxNumberOfItems, children.count), id: \.self) {
                children[$0]
            }
        }
    }
}

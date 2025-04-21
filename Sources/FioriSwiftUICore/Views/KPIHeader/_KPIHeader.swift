import Combine
import SwiftUI

public struct _KPIHeader<Content: View>: View {
    private let content: Content
    
    public init(@KPIHeaderBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        self.content
    }
}

public extension _KPIHeader {
    /// KPIHeader initialization by data
    /// - Parameter data: An collection by `_KPIHeaderItemModel`, maximum 4 items can be rendered.
    init<Data: RandomAccessCollection>(_ data: Data)
        where Content == AnyView, Data.Element == _KPIHeaderItemModel, Data.Index == Int
    {
        func makeItem(_ item: _KPIHeaderItemModel) -> some View {
            Group {
                if let model = item as? _KPIItemModel {
                    _KPIItem(model: model)
                } else if let model = item as? _KPIProgressItemModel {
                    _KPIProgressItem(model: model)
                } else {
                    EmptyView()
                }
            }
        }
        @KPIHeaderBuilder
        func createContent() -> some View {
            ForEach(0 ..< min(data.count, 4), id: \.self) {
                makeItem(data[$0])
            }
        }
        
        self.content = createContent().typeErased
    }
}

import Combine
import SwiftUI

public struct KPIHeader<Content: View>: View {
    private let items: Content
    
    public init(@KPIHeaderBuilder items: @escaping () -> Content) {
        self.items = items()
    }
    
    public var body: some View {
        items
    }
}

public extension KPIHeader {
    /// KPIHeader initialization by data
    /// - Parameter data: An collection by `KPIHeaderItemModel`
    init<Data: RandomAccessCollection>(_ data: Data)
        where Content == AnyView, Data.Element == KPIHeaderItemModel, Data.Index == Int
    {
        func makeItem(_ item: KPIHeaderItemModel) -> some View {
            Group {
                if let model = item as? KPIItemModel {
                    KPIItem(model: model)
                } else if let model = item as? KPIProgressItemModel {
                    KPIProgressItem(model: model)
                } else {
                    EmptyView()
                }
            }
        }
        
        @KPIHeaderBuilder
        func createOneItems() -> some View {
            makeItem(data[0])
        }
        
        @KPIHeaderBuilder
        func createTwoItems() -> some View {
            makeItem(data[0])
            makeItem(data[1])
        }
        
        @KPIHeaderBuilder
        func createThreeItems() -> some View {
            makeItem(data[0])
            makeItem(data[1])
            makeItem(data[2])
        }
        
        @KPIHeaderBuilder
        func createFourItems() -> some View {
            makeItem(data[0])
            makeItem(data[1])
            makeItem(data[2])
            makeItem(data[3])
        }
        
        if data.count == 1 {
            self.items = createOneItems().typeErased
        } else if data.count == 2 {
            self.items = createTwoItems().typeErased
        } else if data.count == 3 {
            self.items = createThreeItems().typeErased
        } else if data.count >= 4 {
            self.items = createFourItems().typeErased
        } else {
            self.items = EmptyView().typeErased
        }
    }
}

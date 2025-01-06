import SwiftUI

/// :nodoc:
public protocol ActivityItemsList: View, _ViewEmptyChecking {
    associatedtype V: View
    var count: Int { get }
    func view(at index: Int) -> V
}

struct ActivityItemsListStack: ActivityItemsList {
    let activityItems: [any View]
    
    init(_ activityItemsData: [ActivityItemDataType]) {
        var temp: [any View] = []
        for element in activityItemsData {
            let item = Button {
                element.didSelectActivityItem?()
            } label: {
                element.icon
                    .imageScale(.large)
                    .frame(width: 44, height: 44, alignment: .center)
            }
            .buttonStyle(BorderlessButtonStyle())
            .typeErased
            
            temp.append(item.typeErased)
        }
        
        self.activityItems = temp
    }
    
    init(activityItems: [any View]) {
        self.activityItems = activityItems
    }
    
    public var count: Int {
        self.activityItems.count
    }
    
    var isEmpty: Bool {
        self.activityItems.isEmpty
    }
    
    public func view(at index: Int) -> some View {
        self.activityItems[index].typeErased
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< self.activityItems.count, id: \.self) { index in
                self.activityItems[index].typeErased
            }
        }
    }
}

/// A custom parameter attribute that constructs views from closures.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@resultBuilder
public enum ActivityItemsBuilder {
    /// :nodoc:
    public static func buildBlock(_ components: any View...) -> some ActivityItemsList {
        let flatAvatars = components.flatMap { component -> [any View] in
            if let c = component as? ActivityItemsListStack {
                return c.activityItems
            } else {
                return [component]
            }
        }
        return ActivityItemsListStack(activityItems: flatAvatars)
    }
    
    /// :nodoc:
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
    /// :nodoc:
    public static func buildExpression(_ expression: some View) -> some View {
        expression
    }
    
    /// :nodoc:
    public static func buildExpression<Data: RandomAccessCollection>(
        _ expression: ForEach<Data, Data.Element, some View>
    ) -> some ActivityItemsList {
        ActivityItemsListStack(activityItems: expression.data.map { item in
            expression.content(item)
        })
    }
    
    /// :nodoc:
    public static func buildEither(first: any View) -> some ActivityItemsList {
        ActivityItemsListStack(activityItems: [first])
    }
    
    /// :nodoc:
    public static func buildEither(second: any View) -> some ActivityItemsList {
        ActivityItemsListStack(activityItems: [second])
    }
    
    /// :nodoc:
    public static func buildOptional(_ component: (any View)?) -> some ActivityItemsList {
        ActivityItemsListStack(activityItems: component.map { [$0] } ?? [])
    }
    
    /// :nodoc:
    public static func buildArray(_ components: [any View]) -> some ActivityItemsList {
        ActivityItemsListStack(activityItems: components)
    }
}

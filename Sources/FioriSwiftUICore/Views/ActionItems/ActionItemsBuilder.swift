import SwiftUI

/// :nodoc:
public protocol ActionItemsList: View, _ViewEmptyChecking {
    associatedtype V: View
    var count: Int { get }
    func view(at index: Int) -> V
}

struct ActionItemsListStack: ActionItemsList {
    let actionItems: [any View]
    
    init(_ actionItemsData: [ActivityItemDataType]) {
        var temp: [any View] = []
        for element in actionItemsData {
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
        
        self.actionItems = temp
    }
    
    init(actionItems: [any View]) {
        self.actionItems = actionItems
    }
    
    public var count: Int {
        self.actionItems.count
    }
    
    var isEmpty: Bool {
        self.actionItems.isEmpty
    }
    
    public func view(at index: Int) -> some View {
        self.actionItems[index].typeErased
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< self.actionItems.count, id: \.self) { index in
                self.actionItems[index].typeErased
            }
        }
    }
}

/// A custom parameter attribute that constructs views from closures.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@resultBuilder
public enum ActionItemsBuilder {
    /// :nodoc:
    public static func buildBlock(_ components: any View...) -> some ActionItemsList {
        let flatAvatars = components.flatMap { component -> [any View] in
            if let c = component as? ActionItemsListStack {
                return c.actionItems
            } else {
                return [component]
            }
        }
        return ActionItemsListStack(actionItems: flatAvatars)
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
    ) -> some ActionItemsList {
        ActionItemsListStack(actionItems: expression.data.map { item in
            expression.content(item)
        })
    }
    
    /// :nodoc:
    public static func buildEither(first: any View) -> some ActionItemsList {
        ActionItemsListStack(actionItems: [first])
    }
    
    /// :nodoc:
    public static func buildEither(second: any View) -> some ActionItemsList {
        ActionItemsListStack(actionItems: [second])
    }
    
    /// :nodoc:
    public static func buildOptional(_ component: (any View)?) -> some ActionItemsList {
        ActionItemsListStack(actionItems: component.map { [$0] } ?? [])
    }
    
    /// :nodoc:
    public static func buildArray(_ components: [any View]) -> some ActionItemsList {
        ActionItemsListStack(actionItems: components)
    }
}

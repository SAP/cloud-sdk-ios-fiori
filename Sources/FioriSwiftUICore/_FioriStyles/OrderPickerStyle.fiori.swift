import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct OrderPickerBaseStyle: OrderPickerStyle {
    @EnvironmentObject private var modelObject: OrderPickerModelObject
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
        
    public func makeBody(_ configuration: OrderPickerConfiguration) -> some View {
        List {
            Section(header: self.getOrderPickerTitle(configuration)) {
                ForEach(self.$modelObject.items) { item in
                    VStack(spacing: 0) {
                        SortCriterion(title: item.wrappedValue.criterion, data: item)
                            .typeErased
                            .contentShape(Rectangle())
                            .ifApply(item.wrappedValue.customStyle != nil) {
                                $0.sortCriterionStyle(AnySortCriterionStyle(customStyle: item.wrappedValue.customStyle))
                            }
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel(item.wrappedValue.description)
                    .accessibilityAddTraits(.isButton)
                    .listRowBackground(item.wrappedValue.customListRowBackground ?? Color.clear)
                }.onMove(perform: self.moveItems)
            }
        }
        .listStyle(.plain)
        .environment(\.editMode, .constant(.active))
    }
    
    func getOrderPickerTitle(_ configuration: OrderPickerConfiguration) -> some View {
        HStack {
            if configuration.optionalTitle.isEmpty {
                OptionalTitle(optionalTitle: AttributedString(NSLocalizedString("Sort by", comment: "")))
            } else {
                configuration.optionalTitle
            }
        }
    }
    
    private func moveItems(from source: IndexSet, to destination: Int) {
        self.modelObject.items.move(fromOffsets: source, toOffset: destination)

        if let onChanged = self.modelObject.configuration.onChangeHandler, let sourceIndex = source.first {
            var destinationIndex = destination - 1
            if sourceIndex > destinationIndex || destinationIndex < 1 {
                destinationIndex = destination
            }
            if sourceIndex != destinationIndex {
                onChanged(OrderPickerItemModel.Change.order(sourceIndex: sourceIndex, destinationIndex: destinationIndex), self.modelObject.items)
            }
        }
    }
}

// Default fiori styles
extension OrderPickerFioriStyle {
    struct ContentFioriStyle: OrderPickerStyle {
        func makeBody(_ configuration: OrderPickerConfiguration) -> some View {
            OrderPicker(configuration)
                .disabled((configuration.controlState == .disabled || configuration.controlState == .readOnly) ? true : false)
                .environmentObject(OrderPickerModelObject(items: configuration.$data, configuration: configuration))
        }
    }

    struct OptionalTitleFioriStyle: OptionalTitleStyle {
        let orderPickerConfiguration: OrderPickerConfiguration
    
        func makeBody(_ configuration: OptionalTitleConfiguration) -> some View {
            OptionalTitle(configuration)
                .font(.fiori(forTextStyle: .headline, weight: .semibold))
                .foregroundStyle(Color.preferredColor(self.orderPickerConfiguration.controlState == .disabled ? .quaternaryLabel : .primaryLabel))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

extension AnySortCriterionStyle {
    init(customStyle: (any SortCriterionStyle)?) {
        if let c = customStyle {
            self.content = {
                c.makeBody($0)
            }
        } else {
            self.content = { _ in
                EmptyView()
            }
        }
    }
}

/**
 The `OrderPickerItemModel` struct is a data model that represents a Order Picker item . It conforms to the `Identifiable`, `Hashable`, `Equatable` and `CustomStringConvertible` protocols, which allow it to be used in collections and compared for equality.
 */
public struct OrderPickerItemModel: Identifiable, Hashable, Equatable, CustomStringConvertible {
    /// A unique identifier for each `OrderPickerItemModel` instance, generated using `UUID()`
    public var id = UUID()
    /// An optional `Image` that represents a icon of the order picker item when it was selected.
    public var selectedIcon: Image?
    /// A `String` representing the criterion of the order picker item.
    public var criterion: AttributedString
    
    /// A boolean value that determines the selected state of the criterion.
    public var isSelected: Bool = false
    /// A boolean value that determines the order direction of the criterion.
    public var isAscending: Bool = true
    /// The text displayed when the criterion is ascending, such as "Ascending".
    public var ascendingText: AttributedString
    /// The text displayed when the criterion is descending, such as "Descending".
    public var descendingText: AttributedString
    
    /// An optional `customStyle`
    public var customStyle: (any SortCriterionStyle)?
    /// An optional color that determins the background color of the custom list row.
    public var customListRowBackground: Color?
    
    /// Public initializer for OrderPickerItemModel.
    /// - Parameters:
    ///   - selectedIcon: An optional `Image` that represents a icon of the order picker item when it was selected.
    ///   - criterion: A `String` representing the criterion of the order picker item.
    ///   - isSelected: A boolean value that determines the selected state of the criterion.
    ///   - isAscending: A boolean value that determines the order direction of the criterion.
    ///   - ascendingText: The text displayed when the criterion is ascending, such as "Ascending".
    ///   - descendingText: The text displayed when the criterion is descending, such as "Descending"
    ///   - customStyle: An optional `customStyle`
    ///   - customListRowBackground: An optional color that determins the background color of the custom list row.

    public init(id: UUID = UUID(), selectedIcon: Image? = nil, criterion: AttributedString, isSelected: Bool = false, isAscending: Bool = true, ascendingText: AttributedString, descendingText: AttributedString, customStyle: (any SortCriterionStyle)? = nil, customListRowBackground: Color? = nil) {
        self.selectedIcon = selectedIcon
        self.criterion = criterion
        self.isSelected = isSelected
        self.isAscending = isAscending
        self.ascendingText = ascendingText
        self.descendingText = descendingText
        self.customStyle = customStyle
        self.customListRowBackground = customListRowBackground
    }
    
    public var description: String {
        let orderDirection = self.isAscending ? "↑" : "↓"
        let criterionText = (NSAttributedString(criterion).string)
        let orderText = self.isAscending ? (NSAttributedString(self.ascendingText).string) : (NSAttributedString(self.descendingText).string)
        if self.isSelected {
            return "\(criterionText): \(orderDirection) \(orderText)"
        } else {
            return "\(criterionText)"
        }
    }
    
    /**
     Immediate change for a criterion
     */
    public enum Change: CustomStringConvertible {
        /// the change of selected state for a criterion
        case selected(index: Int, isSelected: Bool)
        /// the change of order direction of a criterion
        case ascending(index: Int, isAscending: Bool)
        /// the change of order in the array of criterions
        case order(sourceIndex: Int, destinationIndex: Int)
        
        /**
         Description
         */
        public var description: String {
            switch self {
            case .selected(let index, let isSelected):
                return "Selected changed: index = \(index), isSelected = \(isSelected)"
            case .ascending(let index, let isAscending):
                return "asceding changed: index = \(index), isAscending = \(isAscending)"
            case .order(let sourceIndex, let destinationIndex):
                return "Order changed: sourceIndex = \(sourceIndex), destinationIndex = \(destinationIndex)"
            }
        }
    }
    
    /// A method that allows the `OrderPickerItemModel` instances to be used in hash-based collections. It combines the `id` and `criterion` properties to generate a hash value.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.criterion)
    }
    
    /// An equality operator method that compares two `OrderPickerItemModel` instances based on their `id`, `isSelected`' and `isAscending` properties.
    public static func == (lhs: OrderPickerItemModel, rhs: OrderPickerItemModel) -> Bool {
        lhs.id == rhs.id && lhs.isSelected == rhs.isSelected && lhs.isAscending == rhs.isAscending
    }
}

class OrderPickerModelObject: ObservableObject {
    @Binding var items: [OrderPickerItemModel]
    @Published var highlightedItemID: UUID?
    var configuration: OrderPickerConfiguration
    
    public init(items: Binding<[OrderPickerItemModel]>, configuration: OrderPickerConfiguration) {
        self.configuration = configuration
        self._items = items
    }
}

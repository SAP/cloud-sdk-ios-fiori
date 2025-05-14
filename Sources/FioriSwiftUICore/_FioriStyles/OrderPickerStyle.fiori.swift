import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct OrderPickerBaseStyle: OrderPickerStyle {
    @EnvironmentObject private var modelObject: OrderPickerModelObject
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
        
    public func makeBody(_ configuration: OrderPickerConfiguration) -> some View {
        VStack {
            HStack {
                if configuration.optionalTitle.isEmpty {
                    OptionalTitle(optionalTitle: AttributedString(NSLocalizedString("Sort by", comment: "")))
                } else {
                    configuration.optionalTitle
                }
            }.padding(.leading, self.horizontalSizeClass == .regular ? 20 : 16)
            
            Divider()
            
            VStack(spacing: 0) {
                self.buildOrderPickerList(configuration)
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    func buildOrderPickerList(_ configuration: OrderPickerConfiguration) -> some View {
        ForEach(self.$modelObject.items) { item in
            VStack(spacing: 0) {
                SortCriterion(title: item.wrappedValue.criterion, data: item)
                    .typeErased
                    .contentShape(Rectangle())
                    .ifApply(item.wrappedValue.customStyle != nil) {
                        $0.sortCriterionStyle(AnySortCriterionStyle(customStyle: item.wrappedValue.customStyle))
                    }
            }
            .scaleEffect((self.modelObject.isDragging && self.modelObject.draggingItem?.id == item.id) ? 1.08 : 1)
            .shadow(color: self.modelObject.isDragging ? .black.opacity(0.3) : Color.clear, radius: self.modelObject.isDragging ? 8 : 0, y: self.modelObject.isDragging ? 2 : 0)
            .animation(.spring(), value: self.modelObject.isDragging)
        }
    }
}

// Default fiori styles
extension OrderPickerFioriStyle {
    struct ContentFioriStyle: OrderPickerStyle {
        func makeBody(_ configuration: OrderPickerConfiguration) -> some View {
            OrderPicker(configuration)
                .disabled((configuration.controlState == .disabled || configuration.controlState == .readOnly) ? true : false)
                .environmentObject(OrderPickerModelObject(items: configuration.data, configuration: configuration))
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
    /// An optional `Image` that represents an drop/drag icon for the order picker item.
    public var accessoryIcon: Image?
    
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
    
    /// Public initializer for OrderPickerItemModel.
    /// - Parameters:
    ///   - selectedIcon: An optional `Image` that represents a icon of the order picker item when it was selected.
    ///   - criterion: A `String` representing the criterion of the order picker item.
    ///   - accessoryIcon: An optional `Image` that represents an drop/drag icon for the order picker item.
    ///   - isSelected: A boolean value that determines the selected state of the criterion.
    ///   - isAscending: A boolean value that determines the order direction of the criterion.
    ///   - ascendingText: The text displayed when the criterion is ascending, such as "Ascending".
    ///   - descendingText: The text displayed when the criterion is descending, such as "Descending"
    ///   - customStyle: An optional `customStyle`

    public init(id: UUID = UUID(), selectedIcon: Image? = nil, criterion: AttributedString, accessoryIcon: Image? = nil, isSelected: Bool = false, isAscending: Bool = true, ascendingText: AttributedString, descendingText: AttributedString, customStyle: (any SortCriterionStyle)? = nil) {
        self.selectedIcon = selectedIcon
        self.criterion = criterion
        self.accessoryIcon = accessoryIcon
        self.isSelected = isSelected
        self.isAscending = isAscending
        self.ascendingText = ascendingText
        self.descendingText = descendingText
        self.customStyle = customStyle
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
    
    /// An equality operator method that compares two `OrderPickerItemModel` instances based on their `id` property.
    public static func == (lhs: OrderPickerItemModel, rhs: OrderPickerItemModel) -> Bool {
        lhs.id == rhs.id
    }
}

class OrderPickerModelObject: ObservableObject {
    @Published var items: [OrderPickerItemModel] = []
    @Published var isDragging = false
    @Published var highlightedItemID: UUID?
    var draggingItem: OrderPickerItemModel?
    var configuration: OrderPickerConfiguration
    
    public init(items: [OrderPickerItemModel], configuration: OrderPickerConfiguration) {
        self.configuration = configuration
        self.items = items
    }
}

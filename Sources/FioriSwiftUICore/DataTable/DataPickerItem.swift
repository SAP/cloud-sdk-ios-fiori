import Foundation
import SwiftUI

/// Picker item for `DataTable`
/// Each picker item can contain multiple pickers.
public class DataPickerItem: DataItem {
    /// Type.
    public var type: DataItemType
    /// `Label` for each picker, the type is `String`.
    public typealias Label = String
    /// `Entry` for each picker, the type is `String`.
    public typealias Entry = String
    /// An array of pickers.
    var data: [(Label, [Entry])]
    /// Selections for each picker in an array.
    var selections: [Int]
    /// Displaying item for picker, it could be other `DataItem` types.
    /// Optional, by default a text item will be shown.
    public var displayingItem: (([Int]) -> DataItem)?
    /// Value did change handler for pickers.
    public var valueDidChange: (([Int]) -> Void)?
    
    var _displayingItem: DataItem?
    
    /// Public initializer for `DataPickerItem`
    /// - Parameters:
    ///   - pickers: An array of pickers.
    ///   - selections: Selections for each picker in an array.
    ///   - displayingItem: Item to display. Optional, by default a text item will be shown.
    ///   - valueDidChange: Value did change handler.
    public init(pickers: [(Label, [Entry])],
                selections: [Int] = [],
                displayingItem: (([Int]) -> DataItem)? = nil,
                valueDidChange: (([Int]) -> Void)? = nil)
    {
        self.data = pickers
        self.type = .picker
        self.selections = selections
        self.displayingItem = displayingItem ?? self.defaultDisplayingItem(pickers)
        self.valueDidChange = valueDidChange
    }
    
    private func defaultDisplayingItem(_ data: [(Label, [Entry])]) -> (([Int]) -> DataItem) {
        let d: (([Int]) -> DataItem) = { _ in
            let strings = self.selections.enumerated().map { (index, c) -> String in
                let s = data[index].1[c] + " " + data[index].0
                return s
            }
            let textString = strings.joined(separator: " ")
            return DataTextItem(textString)
        }
        return d
    }
}

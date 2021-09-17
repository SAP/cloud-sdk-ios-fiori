import Foundation
import SwiftUI

public class DataPickerItem: DataItem {
    public var type: DataItemType

    public typealias Label = String
    public typealias Entry = String
    var data: [(Label, [Entry])]
    var selections: [Int]

    public var textColor: Color?

    public var displayingItem: (([Int]) -> DataItem)?
    
    public var valueDidChange: (([Int]) -> Void)?
    
    var _displayingItem: DataItem?

    public init(_ pickers: [(Label, [Entry])],
                _ selections: [Int] = [],
                _ displayingItem: (([Int]) -> DataItem)? = nil,
                _ valueDidChange: (([Int]) -> Void)? = nil)
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

import Combine
import SwiftUI

public class TableModel: ObservableObject, Identifiable, NSCopying {
    @Published var headerData: [String] = []
        
    @Published var rowData: [TableRowItem] = []
    
    @Published var isFirstRowSticky: Bool = false
    
    @Published var isFirstColumnSticky: Bool = false
    
    @Published var horizontalScrolling: Bool = true
    
    @Published var showListView: Bool = true
    
    @Published var columnWidths: [CGFloat] = []
    
    @Published var rowHeights: [CGFloat] = []
    
    var didSelectRowAt: ((_ index: Int) -> Void)?

    var selectedIndex: [Int] {
        get {
            self._selectedIndex
        }
        
        set {
            self._selectedIndex = newValue
        }
    }
    
    @Published var _selectedIndex: [Int] = []

    public init(headerTitles: [String] = [],
                rowData: [TableRowItem] = [],
                isFirstRowSticky: Bool = false,
                isFirstColumnSticky: Bool = false,
                showListView: Bool = true)
    {
        self._headerData = Published(initialValue: headerTitles)
        self.rowData = rowData
        self.isFirstRowSticky = isFirstRowSticky
        self.isFirstColumnSticky = isFirstColumnSticky
        self.showListView = showListView
        
        let headers = self.generateHeaderItems()
        if !headers.isEmpty {
            self.rowData.insert(TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: headers), at: 0)
        }
    }
    
    func generateHeaderItems() -> [DataItem] {
        self.headerData.map { (title) -> DataItem in
            DataTextItem(title, .subheadline)
        }
    }

    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = TableModel(headerTitles: self.headerData,
                              isFirstRowSticky: self.isFirstRowSticky,
                              isFirstColumnSticky: self.isFirstColumnSticky)
        return copy
    }
}

class TableDataManager: ObservableObject {
    @Published var selectedIndexes: [Int] = []
    @Published var rowData: [TableRowItem] = []

    init(selectedIndexes: [Int], rowData: [TableRowItem]) {
        self._selectedIndexes = Published(initialValue: selectedIndexes)
        self._rowData = Published(initialValue: rowData)
    }
}

import Combine
import SwiftUI

open class TableModel: ObservableObject, Identifiable, NSCopying {
    @Published public var headerData: TableRowItem?
    
    @Published public var rowData: [TableRowItem] = []
    
    @Published public var isHeaderSticky: Bool = false
    
    @Published public var isFirstColumnSticky: Bool = false
    
    @Published public var horizontalScrolling: Bool = true
    
    @Published public var showListView: Bool = true
        
    @Published public var columnAttributes: [ColumnAttribute] = []
    
    public var didSelectRowAt: ((_ index: Int) -> Void)?
    
    @Published public var selectedIndexes: [Int] = []
    
    internal var centerPosition: CGPoint?
    
    public init(headerData: TableRowItem? = nil,
                rowData: [TableRowItem] = [],
                isFirstRowSticky: Bool = false,
                isFirstColumnSticky: Bool = false,
                columnAttributes: [ColumnAttribute] = [],
                showListView: Bool = true)
    {
        self.headerData = headerData
        self.rowData = rowData
        self.isHeaderSticky = isFirstRowSticky
        self.isFirstColumnSticky = isFirstColumnSticky
        self.columnAttributes = columnAttributes
        self.showListView = showListView
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = TableModel(headerData: self.headerData,
                              isFirstRowSticky: self.isHeaderSticky,
                              isFirstColumnSticky: self.isFirstColumnSticky)
        return copy
    }
}

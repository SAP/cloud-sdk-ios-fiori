import Combine
import SwiftUI

public class TableModel: ObservableObject, Identifiable, NSCopying {
    @Published var headerData: TableRowItem?
    
    @Published var rowData: [TableRowItem] = []
    
    @Published var firstRowSticky: Bool = false
    
    @Published var firstColumnSticky: Bool = false
    
    @Published var horizontalScrolling: Bool = true
    
    @Published var showListView: Bool = true
    
    @Published var columnWidths: [CGFloat] = []
    
    @Published var columnAttributes: [ColumnAttribute] = []
    
    var didSelectRowAt: ((_ index: Int) -> Void)?
    
    @Published var selectedIndexes: [Int] = []
    
    internal var centerPosition: CGPoint?
    
    public init(headerData: TableRowItem? = nil,
                rowData: [TableRowItem] = [],
                isFirstRowSticky: Bool = false,
                isFirstColumnSticky: Bool = false,
                showListView: Bool = true)
    {
        self.headerData = headerData
        self.rowData = rowData
        self.firstRowSticky = isFirstRowSticky
        self.firstColumnSticky = isFirstColumnSticky
        self.showListView = showListView
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = TableModel(headerData: self.headerData,
                              isFirstRowSticky: self.firstRowSticky,
                              isFirstColumnSticky: self.firstColumnSticky)
        return copy
    }
}

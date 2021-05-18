import Combine
import SwiftUI

/**
 TableModel is the data structure being used in DataTable View.
 ## Code Usage:
 ```
 let header = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: titles)
 let model = TableModel(headerData: header, rowData: res, isFirstRowSticky: true, isFirstColumnSticky: true, showListView: true)
 model.columnAttributes = ...
 model.didSelectRowAt = { _ in
 print(model.selectedIndexes)
 }
 ```
 */

public class TableModel: ObservableObject {
    /// `TableRowItem`, header data for displaying.
    @Published public var headerData: TableRowItem?
    
    /// Data for each row.
    @Published public var rowData: [TableRowItem] = [] {
        didSet {
            self.objectViewBindings = self.rowData.map { rowItem in
                self.getMappings(for: rowItem)
            }
        }
    }
    
    /// Set header to be sticky.
    @Published public var isHeaderSticky: Bool = false
    
    /// Set first column to be sticky.
    @Published public var isFirstColumnSticky: Bool = false
    
    /// Set horizontal scrolling.
    @Published public var horizontalScrolling: Bool = true
    
    /// Show list view in iPhone protrait mode.
    @Published public var showListView: Bool = true
    
    /// Column attribute for each column.
    @Published public var columnAttributes: [ColumnAttribute] = []
    
    /// Switching between normal and editing mode.
    @Published public var isEditing: Bool = false
    
    /// Enable or disable pinch and zoom.
    @Published public var isPinchZoomEnable: Bool = false
    
    /// Selection did change handler.
    public var didSelectRowAt: ((_ index: Int) -> Void)?
    
    /// Selected Indexes.
    @Published public var selectedIndexes: [Int] = []
    
    internal var centerPosition: CGPoint?
    
    internal var objectViewBindings: [(Image?, [Int: AnyView], [IconStackItem])]?
    
    /// Public initializer for TableModel.
    /// - Parameters:
    ///   - headerData: Header data for displaying.
    ///   - rowData: Data for each row.
    ///   - isHeaderSticky: Set header to be sticky.
    ///   - isFirstColumnSticky: Set first column to be sticky.
    ///   - columnAttributes: Column attribute for each column.
    ///   - isPinchZoomEnable: Set if pinch and zoom enble, the default is false.
    ///   - showListView: Show list view in iPhone protrait mode.
    public init(headerData: TableRowItem? = nil,
                rowData: [TableRowItem] = [],
                isHeaderSticky: Bool = false,
                isFirstColumnSticky: Bool = false,
                columnAttributes: [ColumnAttribute] = [],
                isPinchZoomEnable: Bool = false,
                showListView: Bool = true)
    {
        self.headerData = headerData
        self.rowData = rowData
        self.isHeaderSticky = isHeaderSticky
        self.isFirstColumnSticky = isFirstColumnSticky
        self.columnAttributes = columnAttributes
        self.isPinchZoomEnable = isPinchZoomEnable
        self.showListView = showListView
    }
    
    func getMappings(for row: TableRowItem) -> (detailImage: Image?, bindings: [Int: AnyView], icons: [IconStackItem]) {
        let imageItems: [DataImageItem] = row.data.compactMap { (item) -> DataImageItem? in
            item as? DataImageItem
        }
        let textItems: [DataTextItem] = row.data.compactMap { (item) -> DataTextItem? in
            item as? DataTextItem
        }
        
        var detailImage: Image?
        var statusImage: Image?
        var bindings: [Int: AnyView] = [:]
        
        if let _image = imageItems.filter({ (item) -> Bool in
            item.mapping == ObjectViewProperty.Image.detailImage
        }).first {
            detailImage = _image.image
        } else {
            detailImage = imageItems.first?.image
        }
        
        if let _image = imageItems.filter({ (item) -> Bool in
            item.mapping == ObjectViewProperty.Image.statusImage
        }).first {
            statusImage = _image.image
        }
        
        let hasMappings = textItems.filter { item in
            item.mapping != nil
        }
        
        if !hasMappings.isEmpty {
            if let title = hasMappings.filter({ (item) -> Bool in
                item.mapping == ObjectViewProperty.Text.title
            }).first {
                bindings[0] = AnyView(title.toTextView())
            }
            if let subtitle = hasMappings.filter({ (item) -> Bool in
                item.mapping == ObjectViewProperty.Text.subtitle
            }).first {
                bindings[1] = AnyView(subtitle.toTextView())
            }
            if let footnote = hasMappings.filter({ (item) -> Bool in
                item.mapping == ObjectViewProperty.Text.footnote
            }).first {
                bindings[2] = AnyView(footnote.toTextView())
            }
            if let status = hasMappings.filter({ (item) -> Bool in
                item.mapping == ObjectViewProperty.Text.status
            }).first {
                bindings[3] = AnyView(status.toTextView())
            }
            if let substatus = hasMappings.filter({ (item) -> Bool in
                item.mapping == ObjectViewProperty.Text.substatus
            }).first {
                bindings[4] = AnyView(substatus.toTextView())
                statusImage = nil
            }
        } else {
            for i in 0 ..< min(textItems.count, 5) {
                bindings[i] = AnyView(textItems[i].toTextView())
            }
        }
        if bindings.keys.contains(4), statusImage != nil {
            bindings[4] = AnyView(statusImage)
        }
        let icons: [IconStackItem] = row.leadingAccessories.compactMap { (item) -> IconStackItem? in
            switch item {
            case .icon(let value):
                return .icon(value)
            case .text(let value):
                return .text(value)
            default:
                return nil
            }
        }
        return (detailImage, bindings, icons)
    }
}

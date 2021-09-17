import Foundation
import SwiftUI

class TableLayoutManager: ObservableObject {
    @ObservedObject var model: TableModel
    @Environment(\.backgroundColor) var backgroundColor
    
    var horizontalScrolling: Bool {
        get {
            self._horizontalScrolling
        }
        
        set {
            self._horizontalScrolling = newValue
        }
    }
    
    @Published var _horizontalScrolling = true
    
    var isEditing: Bool {
        get {
            self._isEditing
        }
        set {
            self._isEditing = newValue
        }
    }
    
    @Published var _isEditing: Bool = false
    
    var sizeClass: UserInterfaceSizeClass {
        get {
            self._sizeClass
        }
        
        set {
            if self._sizeClass != newValue {
                self._sizeClass = newValue
            }
        }
    }
    
    @Published var _sizeClass: UserInterfaceSizeClass = .compact
    
    var rect: CGRect {
        get {
            self._rect
        }
        
        set {
            if newValue != self.rect {
                self.actualTableViewSize = .zero
                self._rect = newValue
            }
        }
    }
    
    @Published private var _rect: CGRect = .zero
    
    /// private: X direction scale factor, scale is not allowed to be less than 1.0
    @Published private var _scaleX: CGFloat = 1.0
    
    /// X direction scale factor, scale is not allowed to be less than 1.0
    public var scaleX: CGFloat {
        get {
            self._scaleX
        }
        
        set {
            if newValue > 1024 {
                self._scaleX = 1024
            } else {
                self._scaleX = newValue
            }
        }
    }
    
    /// private: Y direction scale factor, scale is not allowed to be less than 1.0
    @Published private var _scaleY: CGFloat = 1.0
    
    /// Y direction scale factor, scale is not allowed to be less than 1.0
    public var scaleY: CGFloat {
        get {
            self._scaleY
        }
        
        set {
            if newValue > 1024 {
                self._scaleY = 1024
            } else {
                self._scaleY = newValue
            }
        }
    }
    
    @Published var centerPosition: CGPoint? = nil
    
    var rowData: [TableRowItem] = []
    
    var allDataItems: [[DataTableItem]] = []
    
    var displayingItems: [[DataTableItem]] = []
    
    public func numberOfColumns() -> Int {
        self.rowData.first?.data.count ?? 0
    }
    
    public func numberOfRows() -> Int {
        self.rowData.count
    }
    
    var columnWidths: [CGFloat] {
        get {
            self._columnWidths
        }
        set {
            self._columnWidths = newValue
        }
    }
    
    @Published var _columnWidths: [CGFloat] = []
    
    var rowHeights: [CGFloat] {
        get {
            self._rowHeights
        }
        set {
            self._rowHeights = newValue
        }
    }
    
    @Published var _rowHeights: [CGFloat] = []
    
    var actualTableViewSize: CGSize {
        get {
            self._actualTableViewSize
        }
        
        set {
            if self.actualTableViewSize != newValue {
                self._actualTableViewSize = newValue
            }
        }
    }
    
    @Published var _actualTableViewSize: CGSize = .zero
    
    @Published var isPinchZoomEnable: Bool = false
    
    var contentInset: CGFloat = 0
    
    var leadingAccessoryViewWidth: CGFloat = 0
    var trailingAccessoryViewWidth: CGFloat = 0
    
    var tableLeadingLayoutMargin: CGFloat = 0
    var tableTrailingLayoutMargin: CGFloat = 0
    
    var leadingAccessoryMargin: CGFloat = 0
    
    var leadingItemsWidths: [CGFloat] = []
    
    init(model: TableModel) {
        self.model = model
        self.initRowData(model: self.model)
        self.isEditing = self.model.isEditing
        self.horizontalScrolling = self.model.horizontalScrolling
        self.centerPosition = self.model.centerPosition
        self.isPinchZoomEnable = self.model.isPinchZoomEnable
        self.allDataItems = self.initItems(self.model)
    }
}

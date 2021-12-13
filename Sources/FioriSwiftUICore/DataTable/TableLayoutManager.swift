import Foundation
import SwiftUI

class TableLayoutManager: ObservableObject {
    @Published var model: TableModel {
        didSet {
            self.numOfColumns = -1
        }
    }
    
    var horizontalScrolling: Bool {
        get {
            self._horizontalScrolling
        }
        
        set {
            self._horizontalScrolling = newValue
        }
    }
    
    @Published var _horizontalScrolling = true
    
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
    
    @Published var sizeCategory: ContentSizeCategory = .medium {
        didSet {
            if !self.model.needsCalculateLayout {
                self.model.needsCalculateLayout = true
            }
        }
    }
    
    @Published var _sizeClass: UserInterfaceSizeClass = .compact
    
    var size: CGSize {
        get {
            self._size
        }
        
        set {
            self._size = newValue
        }
    }
    
    @Published var _size: CGSize = .zero
    
    /// private: X direction scale factor; the minimum scale is to display all data in the view
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
    
    /// private: Y direction scale factor; the minimum scale is to display all data in the view
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
    
    @Published var isPinchZoomEnable: Bool = false
    
    @Published var selectedIndexes: [Int] = []
    
    @Published var showRowDivider: Bool = true
    
    @Published var showColoumnDivider: Bool = true
    
    // custom header cell's padding; if set it overwrites default value
    @Published var headerCellPadding: EdgeInsets? = nil
    
    // custom header cell's padding; if set it overwrites default value
    @Published var dataCellPadding: EdgeInsets? = nil
    
    @Published var minRowHeight: CGFloat = 48
    
    @Published var minColumnWidth: CGFloat = 48
    
    /// whether allows to display partial row; For Table Card, set this to false
    @Published var allowsPartialRowDisplay: Bool = true
    
    var layoutWorkItem: DispatchWorkItem?
    
    ///
    var cacheLayoutData: LayoutData?
    
    /// it will not be nil after layout process is completed
    @Published var layoutData: LayoutData? = nil
    
    /// cache the result
    var numOfColumns: Int = -1
    
    public func numberOfColumns() -> Int {
        guard let ld = layoutData else { return 0 }
        
        return ld.numberOfColumns()
    }
    
    public func numberOfRows() -> Int {
        guard let ld = layoutData else { return 0 }
        
        return ld.numberOfRows()
    }
    
    init(model: TableModel) {
        self.model = model
        self.horizontalScrolling = model.horizontalScrolling
        self.centerPosition = model.centerPosition
        self.isPinchZoomEnable = model.isPinchZoomEnable
        self.selectedIndexes = model.selectedIndexes
    }
    
    func resetPosition() {
        self.scaleX = 1.0
        self.scaleY = 1.0
        
        self.centerPosition = nil
    }
}

import Foundation
import SwiftUI

class TableLayoutManager: ObservableObject {
    var model: TableModel {
        didSet {
            self.numOfColumns = -1
        }
    }
    
    var horizontalScrolling: Bool = true

    var sizeClass: UserInterfaceSizeClass = .compact
    
    var sizeCategory: ContentSizeCategory? {
        didSet {
            if !self.model.needsCalculateLayout && oldValue != nil {
                DispatchQueue.main.async {
                    self.model.needsCalculateLayout = true
                }
            }
        }
    }
       
    var size: CGSize = .zero
    
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
    
    @Published var selectedIndexes: [Int] = []
    
    var layoutWorkItem: DispatchWorkItem?
    
    /// cached LayoutData for DataTable size measurement giving by View's Width
    var cacheLayoutDataForMeasurement: LayoutData?
    
    /// cached LayoutData for display
    var cacheLayoutData: LayoutData?
    
    /// it will not be nil after layout process is completed
    @Published var layoutData: LayoutData? = nil
    
    /// cache the result
    var numOfColumns: Int = -1
    
    /// check if layout process is finished
    func isLayoutFinished(_ size: CGSize) -> Bool {
        self.size.width == size.width && !self.model.needsCalculateLayout && self.layoutData != nil && self.layoutWorkItem == nil
    }
    
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
        self.selectedIndexes = model.selectedIndexes
    }
    
    func resetPosition() {
        self.scaleX = 1.0
        self.scaleY = 1.0

        self.centerPosition = nil
    }
}

import Combine
import SwiftUI

public class TableModel: ObservableObject, Identifiable, NSCopying {
    @Published var headerData: [String]?
    @Published var titlesForColumn: [String]?
    
    /// the center postion of a chart in relative coordinate system, both x and y are range from 0 to 1
    @Published public var centerPosition: CGPoint? = nil
    
    /// private: X direction scale factor, scale is not allowed to be less than 1.0
    @Published private var _scaleX: CGFloat = 1.0
    
    @Published var data: [[DataItem]]?
    
    @Published var isFirstRowSticky: Bool = false
    
    @Published var isFirstColumnSticky: Bool = false
    
    @Published var showListView: Bool = true
        
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

    private var _rect: CGRect = .zero
    
    /// X direction scale factor, scale is not allowed to be less than 1.0
    public var scaleX: CGFloat {
        get {
            self._scaleX
        }
        
        set {
            if newValue < 1 {
                self._scaleX = 1.0
            } else if newValue > 1024 {
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
            if newValue < 1 {
                self._scaleY = 1.0
            } else if newValue > 1024 {
                self._scaleY = 1024
            } else {
                self._scaleY = newValue
            }
        }
    }
    
    @Published var posForSeperationLine: [(CGPoint, CGPoint)]?
    
    var allDataItems: [[TableDataItem]] = []
    
    var displayingItems: [[TableDataItem]] = []
    
    public func numberOfDataInRow() -> Int {
        self.data?.first?.count ?? 0
    }
    
    public func numberOfDataInColumn() -> Int {
        self.data?.count ?? 0
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
    
    var weightForColumns: [CGFloat] {
        get {
            self._weightForColumns
        }
        set {
            self._weightForColumns = newValue
        }
    }
    
    @Published var _weightForColumns: [CGFloat] = []
    
    var maxItemSize: CGSize {
        get {
            self._maxItemSize
        }
        
        set {
            if self._maxItemSize == .zero {
                self._maxItemSize = newValue
            }
        }
    }
    
    @Published var _maxItemSize: CGSize = .zero
    
    var displayingItemSize: CGSize {
        get {
            self._displayingItemSize
        }
        
        set {
            if self._displayingItemSize == .zero {
                self._displayingItemSize = newValue
            }
        }
    }
    
    @Published var _displayingItemSize: CGSize = .zero
    
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
    
    var deviceMode: DeviceMode {
        get {
            self._deviceMode
        }
        set {
            if self._deviceMode != newValue {
                self.allDataItems = []
                self.columnWidths = []
                self.actualTableViewSize = .zero
                self._deviceMode = newValue
            }
        }
    }
    
    @Published var _deviceMode: DeviceMode = .iphonePortraitOrIpadSplit
    
    public init(headerTitles: [String]? = nil,
                titlesForColumn: [String]? = nil,
                centerPosition: CGPoint? = nil,
                data: [[DataItem]]? = nil,
                scaleX: CGFloat = 1.0,
                scaleY: CGFloat = 1.0,
                isFirstRowSticky: Bool = false,
                isFirstColumnSticky: Bool = false,
                showListView: Bool = true)
    {
        self._headerData = Published(initialValue: headerTitles)
        self._titlesForColumn = Published(initialValue: titlesForColumn)
        self._centerPosition = Published(initialValue: centerPosition)
        self._centerPosition = Published(initialValue: centerPosition)
        self.scaleX = scaleX
        self.scaleY = scaleY
        self.data = data
        self.isFirstRowSticky = isFirstRowSticky
        self.isFirstColumnSticky = isFirstColumnSticky
        self.showListView = showListView
        
        let headers = self.generateHeaderItems()
        if !headers.isEmpty {
            self.data?.insert(headers, at: 0)
        }
    }
    
    func generateHeaderItems() -> [DataItem] {
        guard let titles = self.headerData else {
            return []
        }
        return titles.map { (title) -> DataItem in
            DataTextItem(title)
        }
    }
    
//    func getFirstColumn() -> [DataItem] {
//        var res: [DataItem] = []
//        for i in 0 ..< numberOfRows() {
//            if let item = self.data?[i].first {
//                res.append(item)
//            }
//        }
//        return res
//    }
//
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = TableModel(headerTitles: self.headerData,
                              titlesForColumn: self.titlesForColumn,
                              centerPosition: self.centerPosition,
                              data: self.data, scaleX: self.scaleX,
                              scaleY: self.scaleY,
                              isFirstRowSticky: self.isFirstRowSticky,
                              isFirstColumnSticky: self.isFirstColumnSticky)
        return copy
    }
}

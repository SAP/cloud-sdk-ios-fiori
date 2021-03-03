import Foundation
import SwiftUI

public class ItemModel: ObservableObject, Identifiable, NSCopying {
    var title: String
    
    /// the center postion of a chart in relative coordinate system, both x and y are range from 0 to 1
    @Published public var centerPosition: CGPoint? = nil
    
    /// private: X direction scale factor, scale is not allowed to be less than 1.0
    @Published private var _scaleX: CGFloat = 1.0
    
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
    
    init(title: String) {
        self.title = title
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = ItemModel(title: self.title)
        
        return copy
    }
}

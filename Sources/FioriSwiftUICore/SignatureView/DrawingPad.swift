import Foundation
import SwiftUI
import UIKit

/// Drawing struct used to capture user signature
struct Drawing {
    /// array of points used to track signature
    public var points = [CGPoint]()
    
    /// maximum X value of signature
    public var maxX: CGFloat {
        guard let max = points.max(by: { $0.x < $1.x }) else { return CGFloat.nan }
        return max.x
    }
    
    /// maximum Y value of signature
    public var maxY: CGFloat {
        guard let max = points.max(by: { $0.y < $1.y }) else { return CGFloat.nan }
        return max.y
    }
    
    /// minimum X value of signature
    public var minX: CGFloat {
        guard let min = points.min(by: { $0.x < $1.x }) else { return CGFloat.nan }
        return min.x
    }
    
    /// minimum Y value of signature
    public var minY: CGFloat {
        guard let min = points.min(by: { $0.y < $1.y }) else { return CGFloat.nan }
        return min.y
    }
}

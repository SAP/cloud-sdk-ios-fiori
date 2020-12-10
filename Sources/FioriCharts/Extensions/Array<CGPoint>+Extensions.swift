import Foundation
import SwiftUI

extension Array where Element == CGPoint {
    var maxX: CGFloat { reduce(CGFloat.leastNormalMagnitude) { Swift.max($0, $1.x) } }
    var minX: CGFloat { reduce(CGFloat.greatestFiniteMagnitude) { Swift.min($0, $1.x) } }
    var maxY: CGFloat { reduce(CGFloat.leastNormalMagnitude) { Swift.max($0, $1.y) } }
    var minY: CGFloat { reduce(CGFloat.greatestFiniteMagnitude) { Swift.min($0, $1.y) } }
    
    func boundingBox() -> CGRect {
        if isEmpty {
            return .zero
        }
        return CGRect(origin: CGPoint(x: self.minX, y: self.minY), size: CGSize(width: self.maxX - self.minX, height: self.maxY - self.minY))
    }
    
    func normalized(in size: CGSize, boundingBox: CGRect? = nil) -> [CGPoint] {
        let box: CGRect
        if let boundingBox = boundingBox, boundingBox != .zero {
            box = boundingBox
        } else {
            box = self.boundingBox()
        }
        
        let normalized: [CGPoint] = self
            .map { CGPoint(x: $0.x / box.width * size.width, y: $0.y / box.height * size.height) }
            .map { $0.applying(.inverted(in: size.height)) }
        return normalized
    }
    
    func path(in size: CGSize, chartItemType: Path.ChartItemType, boundingBox: CGRect? = nil) -> Path {
        let normalized = self.normalized(in: size, boundingBox: boundingBox)
        guard !normalized.isEmpty else { return Path() }
        return Path { p in
            p.move(to: normalized[0])
            p.addLines(normalized)
            
            switch chartItemType {
            case .maxFill, .innerMaxFill:
                p.addLine(to: CGPoint(x: size.width, y: 0)) // top right
                p.addLine(to: .zero) // top left
                p.closeSubpath()
            case .minFill, .innerMinFill:
                p.addLine(to: CGPoint(x: size.width, y: size.height)) // bottom right
                p.addLine(to: CGPoint(x: 0, y: size.height)) // bottom left
                p.closeSubpath()
            default:
                break
            }
        }
    }
}

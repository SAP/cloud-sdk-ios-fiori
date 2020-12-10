import Foundation

extension Array where Element: FloatingPoint {
    func normalized(in maxValue: Element) -> [Element] {
        self.map { $0 / maxValue }
    }
    
    func normalized(in range: ClosedRange<Element>) -> [Element] {
        let breadth = range.upperBound - range.lowerBound
        return self.normalized(in: breadth).map { $0 + range.lowerBound }
    }
}

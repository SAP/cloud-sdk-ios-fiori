import Foundation
import SwiftUI

struct ButtonOverlayView: View {
    var isSelected: Bool
    var isEnable: Bool
    var segmentAttributes: [ControlState: SegmentAttributes]
    
    var body: some View {
        ButtonOverlayShape(cornerRadius: 4)
            .stroke(isEnable ? (self.isSelected ? segmentAttributes[.selected]!.borderColor! : segmentAttributes[.normal]!.borderColor!) : (segmentAttributes[.disabled]!.borderColor!),
                    style: StrokeStyle(lineWidth: 0.6, lineCap: .round, lineJoin: .round, miterLimit: 0, dash: [], dashPhase: 0))
    }
}

struct ButtonOverlayShape: Shape {
    let cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let leftTop = CGPoint(x: rect.minX + self.cornerRadius, y: rect.minY + self.cornerRadius)
        let rightTop = CGPoint(x: rect.maxX - self.cornerRadius, y: rect.minY + self.cornerRadius)
        let rightBottom = CGPoint(x: rect.maxX - self.cornerRadius, y: rect.maxY - self.cornerRadius)
        let leftBottom = CGPoint(x: rect.minX + self.cornerRadius, y: rect.maxY - self.cornerRadius)
        
        // draw rounded rect6angle, closewise
        path.addArc(center: leftTop, radius: self.cornerRadius, startAngle: .radians(.pi), endAngle: .radians(-.pi / 2), clockwise: false)
        path.addArc(center: rightTop, radius: self.cornerRadius, startAngle: .radians(-.pi / 2), endAngle: .radians(0), clockwise: false)
        path.addArc(center: rightBottom, radius: self.cornerRadius, startAngle: .radians(0), endAngle: .radians(.pi / 2), clockwise: false)
        path.addArc(center: leftBottom, radius: self.cornerRadius, startAngle: .radians(.pi / 2), endAngle: .radians(.pi), clockwise: false)
        
        path.closeSubpath()
        
        return path
    }
}

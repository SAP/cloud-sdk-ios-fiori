import SwiftUI

struct ArcShape: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = true
    var insetAmount: CGFloat = 0
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        
        return arc
    }
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = self.startAngle - rotationAdjustment
        let modifiedEnd = self.endAngle - rotationAdjustment
        let radius = min(rect.size.width, rect.size.height) / 2 - self.insetAmount
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: radius, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !self.clockwise)
        
        return path
    }
}

struct ArcShape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArcShape(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), insetAmount: 0.5)
                .stroke(Color.red, lineWidth: 1)
                .frame(width: 200, height: 200)
                .previewLayout(.sizeThatFits)
            
            ArcShape(startAngle: Angle(degrees: 20), endAngle: Angle(degrees: 360), insetAmount: 20)
                .stroke(Color.red, lineWidth: 40)
                .frame(width: 200, height: 200)
                .previewLayout(.sizeThatFits)
              
            ArcShape(startAngle: Angle(degrees: 20), endAngle: Angle(degrees: 270), clockwise: false, insetAmount: 50)
                .stroke(Color.red, lineWidth: 100)
                .frame(width: 200, height: 200)
                .previewLayout(.sizeThatFits)
            
            ArcShape(startAngle: Angle(degrees: 20), endAngle: Angle(degrees: 21), insetAmount: 20)
                .stroke(Color.red, lineWidth: 40)
                .frame(width: 200, height: 200)
                .previewLayout(.sizeThatFits)
        }
    }
}

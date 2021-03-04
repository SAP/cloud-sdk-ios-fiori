import SwiftUI

struct TimelineItemView: View {
    var model: TimelineItem
    
    let isLast: Bool
        
    @State private var lineHeight: CGFloat = 100.0
    
    private let iconWidth: CGFloat = 24.0
    
    init(model: TimelineItem, isLast: Bool) {
        self.model = model
        self.isLast = isLast
        self.model.icon?.size = self.iconWidth
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                SafeView(self.model.icon)
                    .padding(.bottom, -30)
                    .frame(width: iconWidth, height: iconWidth, alignment: .top)
                if !self.isLast {
                    VerticalLine()
                        .stroke(Color.darkGray, lineWidth: 0.6)
                        .frame(height: self.lineHeight)
                }
            }
            .frame(width: iconWidth)
            .padding(EdgeInsets(top: 6, leading: 6, bottom: 0, trailing: 12))

            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    VStack(alignment: .leading) {
                        AsyncImageView(url: self.model.ownerImage?.value).frame(width: 45, height: 45, alignment: .center)
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        self.SafeText(self.model.owner?.value)
                            .font(Font.body.bold())
                            .padding(.bottom, 4)
                        self.SafeText(self.model.title?.value).font(.body)
                            .padding(.bottom, 4)
                        self.SafeText(self.model.dateTime?.value).font(.footnote).foregroundColor(.gray)
                            .padding(.bottom, 8)
                    }
                }
                self.SafeText(self.model.description?.value).font(.body)
            }
            .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
            .padding(8)
            .overlay(Bubble(borderColor: Color.lightGray))
            .alignmentGuide(.center) { (dimension) -> CGFloat in
                DispatchQueue.main.async {
                    self.lineHeight = dimension.height
                }
                return dimension[.leading]
            }
        }
    }
}

struct VerticalLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let startPoint = CGPoint(x: (rect.minX + rect.maxX) / 2, y: rect.minY)
        let endPoint = CGPoint(x: (rect.minX + rect.maxX) / 2, y: rect.maxY)
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        return path
    }
}

struct Bubble: View {
    let borderColor: Color
    
    var body: some View {
        BubbleShape(cornerRadius: 3)
            .stroke(borderColor, style: StrokeStyle(lineWidth: 0.6, lineCap: .round, lineJoin: .round, miterLimit: 0, dash: [], dashPhase: 0))
    }
}

struct BubbleShape: Shape {
    let cornerRadius: CGFloat
    let triangleSide: CGFloat
    
    init(cornerRadius: CGFloat = 3, sideLength: CGFloat = 10) {
        self.cornerRadius = cornerRadius
        self.triangleSide = sideLength
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let leftTop = CGPoint(x: rect.minX + self.cornerRadius, y: rect.minY + self.cornerRadius)
        let rightTop = CGPoint(x: rect.maxX - self.cornerRadius, y: rect.minY + self.cornerRadius)
        let rightBottom = CGPoint(x: rect.maxX - self.cornerRadius, y: rect.maxY - self.cornerRadius)
        let leftBottom = CGPoint(x: rect.minX + self.cornerRadius, y: rect.maxY - self.cornerRadius)
        
        let triangleTop = CGPoint(x: rect.minX, y: rect.minY + self.cornerRadius + self.triangleSide)
        let triangleBottom = CGPoint(x: rect.minX, y: rect.minY + self.cornerRadius + self.triangleSide * 3)
        let triangleLeft = CGPoint(x: rect.minX - self.triangleSide, y: rect.minY + self.cornerRadius + self.triangleSide * 2)
        
        // draw rounded rectangle, closewise
        path.addArc(center: leftTop, radius: self.cornerRadius, startAngle: .radians(.pi), endAngle: .radians(-.pi / 2), clockwise: false)
        path.addArc(center: rightTop, radius: self.cornerRadius, startAngle: .radians(-.pi / 2), endAngle: .radians(0), clockwise: false)
        path.addArc(center: rightBottom, radius: self.cornerRadius, startAngle: .radians(0), endAngle: .radians(.pi / 2), clockwise: false)
        path.addArc(center: leftBottom, radius: self.cornerRadius, startAngle: .radians(.pi / 2), endAngle: .radians(.pi), clockwise: false)
        
        // draw triangle
        path.addLine(to: triangleBottom)
        path.addLine(to: triangleLeft)
        path.addLine(to: triangleTop)
        
        path.closeSubpath()
        
        return path
    }
}

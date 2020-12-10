import SwiftUI

struct SelectionAnchorShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        var path = Path()
        path.move(to: CGPoint(x: width / 2.0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.closeSubpath()
        
        return path
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SelectionAnchorShape()
                .fill(Color.black)
                .frame(width: 9, height: 4)
                .previewLayout(.sizeThatFits)
            
            SelectionAnchorShape()
                .rotation(Angle(degrees: 180))
                .fill(Color.black)
                .frame(width: 9, height: 4)
                .previewLayout(.sizeThatFits)
        }
    }
}

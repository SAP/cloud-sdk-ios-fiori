import SwiftUI

/// A page dot indicator
public struct PageIndicator: View {
    let numberOfPages: Int
    @Binding var currentPage: Int
    
    let currentPageIndicatorTintColor = Color.preferredColor(.primaryLabel)
    let pageIndicatorTintColor = Color.preferredColor(.quaternaryLabel)
    let circleSize: CGFloat = 8
    let circleSpacing: CGFloat = 10
    
    public var body: some View {
        HStack(spacing: self.circleSpacing) {
            ForEach(0 ..< self.numberOfPages, id: \.self) { index in
                ZStack {
                    Circle()
                        .fill(self.currentPage == index ? self.currentPageIndicatorTintColor : self.pageIndicatorTintColor)
                        .frame(width: self.circleSize, height: self.circleSize)
                    
                    Circle()
                        .fill(Color.clear)
                        .frame(width: self.circleSize + self.circleSpacing, height: self.circleSize + self.circleSpacing)
                }
                .contentShape(Circle())
                .id(index)
                .onTapGesture {
                    withAnimation {
                        self.currentPage = index
                    }
                }
            }
        }
    }
}

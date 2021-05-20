import SwiftUI

/// A page dot indicator
public struct PageIndicator: View {
    let numberOfPages: Int
    @Binding var currentPage: Int
    
    let currentPageIndicatorTintColor = Color.preferredColor(.primary2)
    let pageIndicatorTintColor = Color.preferredColor(.primary4)
    let circleSize: CGFloat = 8
    let circleSpacing: CGFloat = 10
    
    public var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0 ..< numberOfPages) { index in
                ZStack {
                    Circle()
                        .fill(currentPage == index ? currentPageIndicatorTintColor : pageIndicatorTintColor)
                        .frame(width: circleSize, height: circleSize)
                    
                    Circle()
                        .fill(Color.clear)
                        .frame(width: circleSize + circleSpacing, height: circleSize + circleSpacing)
                }
                .contentShape(Circle())
                .id(index)
                .onTapGesture {
                    withAnimation {
                        currentPage = index
                    }
                }
            }
        }
    }
}

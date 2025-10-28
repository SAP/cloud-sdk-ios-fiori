import SwiftUI

struct CalendarDragView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.preferredColor(.separator))
                .frame(height: 0.33)
                .frame(maxWidth: .infinity)
            
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.preferredColor(.separator))
                .frame(width: 36, height: 5)
                .padding(.top, 6)
                .padding(.bottom, 21)
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    CalendarDragView()
}

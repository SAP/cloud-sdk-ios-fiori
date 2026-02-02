import FioriSwiftUICore
import SwiftUI

struct CheckoutIndicatorExample: View {
    @State var displayState: DisplayState = .inProgress
    var size = CGSize(width: 130, height: 130)
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                CheckoutIndicator(displayState: self.$displayState)
                    .frame(width: self.size.width, height: self.size.height)
                Text(self.title(state: self.displayState))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                    .font(.title)
            }
            Picker("Display State", selection: self.$displayState) {
                Text(String("inProgress"))
                    .tag(DisplayState.inProgress)
                Text(String("completed"))
                    .tag(DisplayState.completed)
                Text(String("failed"))
                    .tag(DisplayState.failed)
                Text(String("AI processing"))
                    .tag(DisplayState.aiProgress)
            }
            .pickerStyle(.segmented)
            .padding(.top, 20)
        }
    }
    
    func title(state: DisplayState) -> String {
        switch state {
        case .inProgress:
            return "processing"
        case .completed:
            return "completed"
        case .failed:
            return "failed"
        case .aiProgress:
            return "AI processing"
        }
    }
}

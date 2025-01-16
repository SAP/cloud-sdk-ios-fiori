import FioriSwiftUICore
import SwiftUI

struct CheckoutIndicatorExample: View {
    @State var displayState: DisplayState = .inProgress
    var size = CGSize(width: 130, height: 130)
    
    var body: some View {
        VStack {
            CheckoutIndicator(displayState: self.$displayState)
                .frame(width: self.size.width, height: self.size.height)
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
            .frame(maxWidth: 300)
        }
    }
}

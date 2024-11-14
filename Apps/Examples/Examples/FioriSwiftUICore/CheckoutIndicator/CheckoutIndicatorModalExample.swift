import FioriSwiftUICore
import SwiftUI

struct CheckoutIndicatorModalExample: View {
    @State private var showModal = false

    var body: some View {
        Button("Show Modal") {
            self.showModal.toggle()
        }
        .sheet(isPresented: self.$showModal) {
            ModalView()
        }
    }
}

struct ModalView: View {
    @Environment(\.dismiss) var dismiss
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
            }
            .pickerStyle(.segmented)
            .padding(.top, 20)
            .frame(maxWidth: 300)

            Button("Dismiss Modal") {
                self.dismiss()
            }
            .padding(.top, 20)
        }
    }
}

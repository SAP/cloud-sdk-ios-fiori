import FioriSwiftUICore
import SwiftUI

struct Sandbox: View {
    @State private var on: Bool = true
    var colors = ["Red", "Green", "Blue"]
    @State private var favoriteColor: String = "Red"
    
    @State private var state: ControlState = .normal
    
    var body: some View {
        VStack {
            Picker("State", selection: self.$state) {
                Text("Normal").tag(ControlState.normal)
                Text("Disabled").tag(ControlState.disabled)
                Text("Readonly").tag(ControlState.readOnly)
            }
            .pickerStyle(.segmented)

            Toggle("Information View \(self.on)", isOn: self.$on)
                .padding()
        }
        .informationView(isPresented: self.$on, description: self.info)
        .border(Color.blue)
    }
    
    var info: AttributedString {
        switch self.state {
        case .disabled:
            var result = AttributedString("Disabled")
            result.font = .largeTitle
            result.backgroundColor = .gray
            return result
        case .readOnly:
            var result = AttributedString("Readonly")
            result.font = .largeTitle
            result.backgroundColor = .yellow
            return result
        default:
            var result = AttributedString("Normal")
            result.font = .largeTitle
            result.backgroundColor = .green
            return result
        }
    }
}

#Preview {
    Sandbox()
}

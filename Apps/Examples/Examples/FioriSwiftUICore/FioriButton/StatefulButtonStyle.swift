import FioriSwiftUICore
import Foundation
import SwiftUI

struct FioriButtonExample: View {
    @State private var _withCustomStyle = false
    @State private var _isSelectionPersistent = false
    @State private var _isEnabled = true
    @State private var _showSettings = false
    
    var body: some View {
        Group {
            if _withCustomStyle {
                makeBody()
                    .fioriButtonStyle(CustomFioriButtonStyle())
            } else {
                makeBody()
            }
        }
        .navigationBarItems(trailing: Button("Config") {
            self._showSettings.toggle()
        })
        .sheet(isPresented: self.$_showSettings) {
            Form {
                Toggle("isEnabled", isOn: self.$_isEnabled)
                Toggle("isSelectionPersistent", isOn: self.$_isSelectionPersistent)
                Toggle("custom style", isOn: self.$_withCustomStyle)
            }
        }
    }
    
    func makeBody() -> some View {
        FioriButton(isSelectionPersistent: self._isSelectionPersistent,
                    action: { state in
                        print("Button tapped with state: \(state)")
                    },
                    label: { state in
                        switch state {
                        case .normal:
                            Text("Normal")
                        case .highlighted:
                            HStack {
                                Image(systemName: "checkmark")
                                Text("Highlighted")
                            }
                        case .selected:
                            HStack {
                                Image(systemName: "checkmark")
                                Text("Selected")
                            }
                        default:
                            Text("Disabled")
                        }
                    })
            .disabled(!self._isEnabled)
    }
}

struct StatefulButtonStyleExample: View {
    var body: some View {
        Button(action: { print("add tapped") }, label: {
            HStack {
                Image(systemName: "plus")
                Text("Add")
            }
        })
            .buttonStyle(StatefulButtonStyle())
            //            .disabled(true)
            .padding()
    }
}

struct CustomFioriButtonStyle: FioriButtonStyle {
    func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
        let color: Color
        switch configuration.state {
        case .normal:
            color = Color.preferredColor(.tintColor)
        case .highlighted, .selected:
            color = .red
        default:
            color = Color.preferredColor(.primary3)
        }
        
        return configuration.label
            .foregroundColor(.white)
            .padding(50)
            .frame(width: 500)
            .background(Circle().fill(color))
    }
}

struct PreviewView: PreviewProvider {
    static var previews: some View {
        FioriButtonExample()
        
        StatefulButtonStyleExample()
    }
}

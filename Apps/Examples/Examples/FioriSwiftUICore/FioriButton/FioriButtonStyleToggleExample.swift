import FioriSwiftUICore
import SwiftUI

enum ToggleFioriButtonStyle: Int {
    case primary
    case secondary
    case tertiary
}

struct FioriButtonStyleToggleExample: View {
    @State private var _buttonStyle = ToggleFioriButtonStyle.primary
    @State private var _colorStyle = FioriButtonColorStyle.normal
    @State private var _isSelectionPersistent = false
    
    init(_buttonStyle: ToggleFioriButtonStyle = ToggleFioriButtonStyle.primary, _colorStyle: FioriButtonColorStyle = FioriButtonColorStyle.normal, _isSelectionPersistent: Bool = false) {
        self._buttonStyle = _buttonStyle
        self._colorStyle = _colorStyle
        self._isSelectionPersistent = _isSelectionPersistent
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20, content: {
                FioriButton(isSelectionPersistent: self._isSelectionPersistent, label: { state in
                    HStack(spacing: 8.0, content: {
                        Image(fioriName: "fiori.paper.plane").fontWeight(.bold).font(.fiori(forTextStyle: .subheadline))
                        Text(self.titleForState(state: state))
                    })
                })
                .fioriButtonStyle(self.fioriButtonStyle().eraseToAnyFioriButtonStyle())
                
                Picker("Button Style", selection: self.$_buttonStyle) {
                    Text("primary").tag(ToggleFioriButtonStyle.primary)
                    Text("secondary").tag(ToggleFioriButtonStyle.secondary)
                    Text("tertiary").tag(ToggleFioriButtonStyle.tertiary)
                }
                .pickerStyle(.segmented)
                .controlSize(.large)
                .frame(height: 51)
                
                Picker("Color Style", selection: self.$_colorStyle) {
                    Text("normal").tag(FioriButtonColorStyle.normal)
                    Text("tint").tag(FioriButtonColorStyle.tint)
                    Text("negative").tag(FioriButtonColorStyle.negative)
                }
                .pickerStyle(.segmented) // realized by UISegmentedControl
                .controlSize(.large)
                .frame(height: 51)
                
                HStack(alignment: .center, spacing: 20, content: {
                    Toggle("", isOn: self.$_isSelectionPersistent).labelsHidden()
                    Text("isSelectionPersistent")
                    Spacer()
                })
            })
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        }
        .navigationTitle("Button Style Toggle")
    }
    
    func fioriButtonStyle() -> any FioriButtonStyle {
        switch self._buttonStyle {
        case .primary:
            return FioriPrimaryButtonStyle()
        case .secondary:
            return FioriSecondaryButtonStyle(colorStyle: self._colorStyle)
        case .tertiary:
            return FioriTertiaryButtonStyle(colorStyle: self._colorStyle)
        }
    }
    
    func titleForState(state: UIControl.State) -> String {
        var title = ""
        switch state {
        case .disabled:
            title = "Disabled"
        case .highlighted:
            title = "Highlighted"
        case [.selected, .highlighted]:
            title = "Selected Highlighted"
        case .selected:
            title = "Selected"
        default:
            title = "Normal"
        }
        return title
    }
}

#Preview {
    FioriButtonStyleToggleExample()
}

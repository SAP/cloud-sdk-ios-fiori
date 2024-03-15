import FioriSwiftUICore
import Foundation
import SwiftUI

struct FioriButtonExample: View {
    @State private var _withCustomStyle = false
    @State private var _isSelectionPersistent = false
    @State private var _buttonStyle = "Primary"
    @State private var _colorStyle = FioriButtonColorStyle.tint
    @State private var _isEnabled = true
    @State private var _showSettings = false
    
    var fioriButtonStyle: AnyFioriButtonStyle {
        switch self._buttonStyle {
        case "Primary":
            return FioriPrimaryButtonStyle().eraseToAnyFioriButtonStyle()
        case "Secondary":
            return FioriSecondaryButtonStyle(colorStyle: self._colorStyle).eraseToAnyFioriButtonStyle()
        default:
            return FioriTertiaryButtonStyle(colorStyle: self._colorStyle).eraseToAnyFioriButtonStyle()
        }
    }
    
    var body: some View {
        Group {
            if self._withCustomStyle {
                self.makeBody()
                    .fioriButtonStyle(CustomFioriButtonStyle())
            } else {
                self.makeBody()
                    .fioriButtonStyle(self.fioriButtonStyle)
            }
        }
        .settingsSheet(isPresented: self.$_showSettings) {
            Toggle("isEnabled", isOn: self.$_isEnabled)
            Toggle("isSelectionPersistent", isOn: self.$_isSelectionPersistent)
            if !self._withCustomStyle {
                Picker(selection: self.$_buttonStyle) {
                    Text("Primary Button").tag("Primary")
                    Text("Secondary Button").tag("Secondary")
                    Text("Tertiary Button").tag("Tertiary")
                } label: {
                    Text("button style")
                }
                if self._buttonStyle != "Primary" {
                    Picker(selection: self.$_colorStyle) {
                        Text("tint").tag(FioriButtonColorStyle.tint)
                        Text("normal").tag(FioriButtonColorStyle.normal)
                        Text("negative").tag(FioriButtonColorStyle.negative)
                    } label: {
                        Text("color style")
                    }
                }
            }
            Toggle("custom style", isOn: self.$_withCustomStyle)
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

struct CustomFioriButtonStyle: FioriButtonStyle {
    func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
        let color: Color
        switch configuration.state {
        case .normal:
            color = Color.preferredColor(.tintColor)
        case .highlighted, .selected:
            color = .red
        default:
            color = Color.preferredColor(.tertiaryLabel)
        }
        
        return configuration.label
            .foregroundColor(.white)
            .padding(50)
            .background(Circle().fill(color))
    }
}

struct StatefulButtonStyleExample: View {
    @State var _showSettings = false
    @State private var _isSelectionPersistent = false
    @State private var _buttonStyle = "Primary"
    @State private var _colorStyle = FioriButtonColorStyle.tint
    @State private var _isEnabled = true
    
    var primitiveButtonStyle: AnyPrimitiveButtonStyle {
        switch self._buttonStyle {
        case "Primary":
            return PrimaryButtonStyle(isSelectionPersistent: self._isSelectionPersistent).eraseToAnyPrimitiveButtonStyle()
        case "Secondary":
            return SecondaryButtonStyle(colorStyle: self._colorStyle, isSelectionPersistent: self._isSelectionPersistent).eraseToAnyPrimitiveButtonStyle()
        default:
            return TertiaryButtonStyle(colorStyle: self._colorStyle, isSelectionPersistent: self._isSelectionPersistent).eraseToAnyPrimitiveButtonStyle()
        }
    }
    
    var body: some View {
        Button(action: { print("add tapped") }, label: {
            HStack {
                Image(systemName: "plus")
                Text("Add")
            }
        })
        .buttonStyle(self.primitiveButtonStyle)
        .disabled(!self._isEnabled)
        .settingsSheet(isPresented: self.$_showSettings) {
            Toggle("isEnabled", isOn: self.$_isEnabled)
            Toggle("isSelectionPersistent", isOn: self.$_isSelectionPersistent)
            Picker(selection: self.$_buttonStyle) {
                Text("Primary Button").tag("Primary")
                Text("Secondary Button").tag("Secondary")
                Text("Tertiary Button").tag("Tertiary")
            } label: {
                Text("button style")
            }
            if self._buttonStyle != "Primary" {
                Picker(selection: self.$_colorStyle) {
                    Text("tint").tag(FioriButtonColorStyle.tint)
                    Text("normal").tag(FioriButtonColorStyle.normal)
                    Text("negative").tag(FioriButtonColorStyle.negative)
                } label: {
                    Text("color style")
                }
            }
        }
    }
}

/// A type-erased button style.
struct AnyPrimitiveButtonStyle: PrimitiveButtonStyle {
    let view: (PrimitiveButtonStyleConfiguration) -> AnyView
    
    public init(_ style: some PrimitiveButtonStyle) {
        self.view = {
            AnyView(style.makeBody(configuration: $0))
        }
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        self.view(configuration)
    }
}

extension PrimitiveButtonStyle {
    /// Return a type-erased button style.
    /// - Returns: An `AnyPrimitiveButtonStyle` wrapping this button style.
    func eraseToAnyPrimitiveButtonStyle() -> AnyPrimitiveButtonStyle {
        AnyPrimitiveButtonStyle(self)
    }
}

struct PreviewView: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FioriButtonExample()
        }
        
        NavigationView {
            StatefulButtonStyleExample()
        }
    }
}

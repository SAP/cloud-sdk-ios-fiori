import FioriSwiftUICore
import Foundation
import SwiftUI

struct FioriButtonTestsExample: View {
    @State private var _showSettings = false
    @State private var _isEnabled = true
    @State private var _isSelectionPersistent = false
    @State private var _colorStyle = FioriButtonColorStyle.normal
    
    var types: [any FioriButtonStyle] {
        [FioriPrimaryButtonStyle(), FioriSecondaryButtonStyle(colorStyle: self._colorStyle), FioriTertiaryButtonStyle(colorStyle: self._colorStyle)]
    }

    let ButtonImage: some View = Image(fioriName: "fiori.action.settings.fill").fontWeight(.bold).font(.fiori(forTextStyle: .subheadline))
    
    var imageTitlePadding = 10.0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10.0, content: {
                ForEach(0 ..< self.types.count, id: \.self) { index in
                    FioriButton(isSelectionPersistent: self._isSelectionPersistent, label: { _ in
                        self.ButtonImage
                    })
                    .fioriButtonStyle(self.types[index].eraseToAnyFioriButtonStyle())
                    .disabled(!self._isEnabled)
                    
                    FioriButton(isSelectionPersistent: self._isSelectionPersistent, label: { _ in
                        Text("Button Long Long Long Long Title Long Long Long Long Title \(self.styleName(style: self.types[index]))")
                            .multilineTextAlignment(.center)
                    })
                    .fioriButtonStyle(self.types[index].eraseToAnyFioriButtonStyle())
                    .disabled(!self._isEnabled)
                    
                    FioriButton(isSelectionPersistent: self._isSelectionPersistent, label: { _ in
                        HStack(spacing: self.imageTitlePadding, content: {
                            self.ButtonImage
                            Text("Button \(self.styleName(style: self.types[index]))")
                                .font(.fiori(forTextStyle: .footnote, isItalic: false))
                        })
                    })
                    .fioriButtonStyle(self.types[index].eraseToAnyFioriButtonStyle())
                    .disabled(!self._isEnabled)
                    
                    FioriButton(isSelectionPersistent: self._isSelectionPersistent, label: { _ in
                        VStack(spacing: self.imageTitlePadding, content: {
                            self.ButtonImage
                            Text("Button \(self.styleName(style: self.types[index]))")
                        })
                    })
                    .fioriButtonStyle(self.types[index].eraseToAnyFioriButtonStyle())
                    .disabled(!self._isEnabled)
                    
                    FioriButton(isSelectionPersistent: self._isSelectionPersistent, label: { _ in
                        HStack(spacing: self.imageTitlePadding, content: {
                            Text("Button \(self.styleName(style: self.types[index]))")
                            self.ButtonImage
                        })
                    })
                    .fioriButtonStyle(self.types[index].eraseToAnyFioriButtonStyle())
                    .disabled(!self._isEnabled)
                    
                    FioriButton(isSelectionPersistent: self._isSelectionPersistent, label: { _ in
                        VStack(spacing: self.imageTitlePadding, content: {
                            Text("Button \(self.styleName(style: self.types[index]))")
                            self.ButtonImage
                        })
                    })
                    .fioriButtonStyle(self.types[index].eraseToAnyFioriButtonStyle())
                    .disabled(!self._isEnabled)
                }
            })
            .frame(maxWidth: .infinity)
        }
        .listStyle(.grouped)
        .navigationTitle("Button Tests")
        .settingsSheet(isPresented: self.$_showSettings) {
            Toggle(isOn: self.$_isEnabled) {
                Text("isEnabled")
            }
            Toggle(isOn: self.$_isSelectionPersistent) {
                Text("isSelectionPersistent")
            }
            Picker(selection: self.$_colorStyle) {
                Text("normal").tag(FioriButtonColorStyle.normal)
                Text("tint").tag(FioriButtonColorStyle.tint)
                Text("negative").tag(FioriButtonColorStyle.negative)
            } label: {
                Text("color style")
            }
        }
    }
    
    func styleName(style: any FioriButtonStyle) -> String {
        switch style {
        case is FioriPrimaryButtonStyle:
            return "Primary"
        case is FioriSecondaryButtonStyle:
            return "Secondary"
        case is FioriTertiaryButtonStyle:
            return "Tertiary"
        default:
            return "Plain"
        }
    }
}

#Preview {
    FioriButtonTestsExample()
}

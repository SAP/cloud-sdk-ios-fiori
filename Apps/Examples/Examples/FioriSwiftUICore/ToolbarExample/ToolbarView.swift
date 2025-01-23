import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

enum ItemStyle {
    case fiori
    case button
    case icon
}

struct ToolbarView: View {
    @Binding var numberOfButtons: Int
    @Binding var useFioriToolbar: Bool
    @Binding var helperText: String
    @Binding var customHelperText: Bool
    @Binding var moreActionOverflowIcon: Bool
    @Binding var primaryButtonText: String
    @Binding var secondaryButtonText: String
    @Binding var thirdButtonText: String
    @Binding var buttonType: ItemStyle

    var body: some View {
        if !self.useFioriToolbar {
            Color.preferredColor(.grey7)
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Text("\(self.helperText)")
                        ForEach(0 ..< self.numberOfButtons, id: \.self) { index in
                            self.createButton(at: index)
                        }
                    }
                }
        } else {
            Group {
                switch self.numberOfButtons {
                case 1:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText) {
                            self.createButton(at: 0)
                        }
                case 2:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText) {
                            self.createButton(at: 0)
                            self.createButton(at: 1)
                        }
                case 3:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText) {
                            self.createButton(at: 0)
                            self.createButton(at: 1)
                            self.createButton(at: 2)
                        }
                case 4:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText) {
                            self.createButton(at: 0)
                            self.createButton(at: 1)
                            self.createButton(at: 2)
                            self.createButton(at: 3)
                        }
                case 5:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText) {
                            self.createButton(at: 0)
                            self.createButton(at: 1)
                            self.createButton(at: 2)
                            self.createButton(at: 3)
                            self.createButton(at: 4)
                        }
                case 6:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText) {
                            self.createButton(at: 0)
                            self.createButton(at: 1)
                            self.createButton(at: 2)
                            self.createButton(at: 3)
                            self.createButton(at: 4)
                            self.createButton(at: 5)
                        }
                case 7:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText) {
                            self.createButton(at: 0)
                            self.createButton(at: 1)
                            self.createButton(at: 2)
                            self.createButton(at: 3)
                            self.createButton(at: 4)
                            self.createButton(at: 5)
                            self.createButton(at: 6)
                        }
                case 8:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText) {
                            self.createButton(at: 0)
                            self.createButton(at: 1)
                            self.createButton(at: 2)
                            self.createButton(at: 3)
                            self.createButton(at: 4)
                            self.createButton(at: 5)
                            self.createButton(at: 6)
                            self.createButton(at: 7)
                        }
                default:
                    Color.preferredColor(.grey7)
                }
            }
            .helperTextStyle { config in
                if self.customHelperText {
                    config.helperText.foregroundStyle(Color.red)
                } else {
                    config.helperText
                }
            }
            .moreActionOverflowStyle { config in
                if self.moreActionOverflowIcon {
                    Image(systemName: "person").foregroundStyle(Color.green)
                } else {
                    config.moreActionOverflow
                }
            }
        }
    }
    
    var buttonTexts = ["Save", "Submit", "Long Long Long Button Title",
                       "Extra Long Long Long Long Long Long Long LongLong Long Long Button Title",
                       "Button 5", "Button 6", "Button 7", "Button 8"]
    var iconNames = ["square.and.arrow.up", "square.and.arrow.down",
                     "pencil", "paperclip", "delete.left", "plus.app",
                     "trash", "phone"]
    
    @ViewBuilder
    func createButton(at index: Int = 0) -> some View {
        switch self.buttonType {
        case .fiori, .button:
            let button = self.buttons()[index]
            if button.type == 1 {
                FioriButton { _ in
                    Text(button.title)
                }
                .fioriButtonStyle(FioriPrimaryButtonStyle().eraseToAnyFioriButtonStyle())
            } else if button.type == 2 {
                FioriButton { _ in
                    Text(button.title)
                }
                .fioriButtonStyle(FioriSecondaryButtonStyle().eraseToAnyFioriButtonStyle())
            } else if button.type == 3 {
                FioriButton { _ in
                    Text(button.title)
                }
                .fioriButtonStyle(FioriTertiaryButtonStyle().eraseToAnyFioriButtonStyle())
            } else {
                if self.buttonType == .fiori {
                    FioriButton { _ in
                        Text(button.title)
                    }
                    .fioriButtonStyle(FioriSecondaryButtonStyle().eraseToAnyFioriButtonStyle())
                } else {
                    Button(action: {}, label: {
                        Text(button.title)
                    })
                }
            }
        case .icon:
            Image(systemName: self.iconNames[index])
                .foregroundStyle(Color.preferredColor(.tintColor))
                .fontWeight(.semibold)
        }
    }
    
    func buttons() -> [(type: Int, title: String)] {
        var mergedButtons = [(Int, String)]()
        if !self.primaryButtonText.isEmpty {
            mergedButtons.append((1, self.primaryButtonText))
        }
        if !self.secondaryButtonText.isEmpty {
            mergedButtons.append((2, self.secondaryButtonText))
        }
        if !self.thirdButtonText.isEmpty {
            mergedButtons.append((3, self.thirdButtonText))
        }
        mergedButtons.append(contentsOf: self.buttonTexts.map { (0, $0) })
        return mergedButtons
    }
    
    @ViewBuilder
    func createHelperText() -> some View {
        if self.helperText.isEmpty {
            EmptyView()
        } else {
            Text(self.helperText)
        }
    }
}

#Preview {
    NavigationStack {
        ToolbarView(numberOfButtons: .constant(2), useFioriToolbar: .constant(true), helperText: .constant("6768"), customHelperText: .constant(true), moreActionOverflowIcon: .constant(false), primaryButtonText: .constant(""), secondaryButtonText: .constant(""), thirdButtonText: .constant(""), buttonType: .constant(.fiori))
    }
}

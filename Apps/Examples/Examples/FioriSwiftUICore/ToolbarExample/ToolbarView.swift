import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

enum ItemStyle {
    case fiori
    case button
    case icon
}

enum IconItem: String, CaseIterable {
    case arrowUp = "Up"
    case arrowDown = "Down"
    case pencil = "Pencil"
    case paperclip = "Paper"
    case deleteLeft = "Delete"
    case plus = "Plus"
    case trash = "Trash"
    case phone = "Phone"
    
    var text: String {
        self.rawValue.localizedFioriString()
    }
    
    var iconName: String {
        switch self {
        case .arrowUp:
            "square.and.arrow.up"
        case .arrowDown:
            "square.and.arrow.down"
        case .pencil:
            "pencil"
        case .paperclip:
            "paperclip"
        case .deleteLeft:
            "delete.left"
        case .plus:
            "plus.app"
        case .trash:
            "trash"
        case .phone:
            "phone"
        }
    }
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
    
    var displayItemsCount: Int {
        if self.buttonType == .icon {
            return 4
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 3
        } else {
            return 2
        }
    }

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
                        .fioriToolbar(helperText: self.helperText,
                                      defaultDisplayItemsCount: self.displayItemsCount)
                    {
                        self.createButton(at: 0)
                    }
                case 2:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText,
                                      defaultDisplayItemsCount: self.displayItemsCount)
                    {
                        self.createButton(at: 0)
                        self.createButton(at: 1)
                    }
                case 3:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText,
                                      defaultDisplayItemsCount: self.displayItemsCount)
                    {
                        self.createButton(at: 0)
                        self.createButton(at: 1)
                        self.createButton(at: 2)
                    }
                case 4:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText,
                                      defaultDisplayItemsCount: self.displayItemsCount)
                    {
                        self.createButton(at: 0)
                        self.createButton(at: 1)
                        self.createButton(at: 2)
                        self.createButton(at: 3)
                    }
                case 5:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText,
                                      defaultDisplayItemsCount: self.displayItemsCount)
                    {
                        self.createButton(at: 0)
                        self.createButton(at: 1)
                        self.createButton(at: 2)
                        self.createButton(at: 3)
                        self.createButton(at: 4)
                    }
                case 6:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(
                            helperText: self.helperText,
                            defaultDisplayItemsCount: self.displayItemsCount
                        ) {
                            self.createButton(at: 0)
                            self.createButton(at: 1)
                            self.createButton(at: 2)
                            self.createButton(at: 3)
                            self.createButton(at: 4)
                            self.createButton(at: 5)
                        }
                case 7:
                    Color.preferredColor(.grey7)
                        .fioriToolbar(helperText: self.helperText,
                                      defaultDisplayItemsCount: self.displayItemsCount)
                    {
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
                        .fioriToolbar(helperText: self.helperText,
                                      defaultDisplayItemsCount: self.displayItemsCount)
                    {
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
    
    var buttonTexts = ["Transfer", "Submit", "Long Long Long Button Title",
                       "Extra Long Long Long Long Long Long Long LongLong Long Long Button Title",
                       "Button 5", "Button 6", "Button 7", "Button 8"]
    
    @ViewBuilder
    func createButton(at index: Int = 0) -> some View {
        switch self.buttonType {
        case .fiori, .button:
            let button = self.buttons()[index]
            if button.type == 1 {
                FioriButton { _ in
                    Text(button.title)
                }
                .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity).eraseToAnyFioriButtonStyle())
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
            } else if button.type == 2 {
                FioriButton { _ in
                    Text(button.title)
                }
                .background(.yellow)
                .fioriButtonStyle(FioriSecondaryButtonStyle(maxWidth: .infinity).eraseToAnyFioriButtonStyle())
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
            } else if button.type == 3 {
                FioriButton { _ in
                    Text(button.title)
                }
                .fioriButtonStyle(FioriTertiaryButtonStyle(maxWidth: .infinity).eraseToAnyFioriButtonStyle())
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
            } else {
                if self.buttonType == .fiori {
                    FioriButton { _ in
                        Text(button.title)
                    }
                    .fioriButtonStyle(FioriSecondaryButtonStyle(maxWidth: .infinity).eraseToAnyFioriButtonStyle())
                } else {
                    Button(action: {}, label: {
                        Text(button.title)
                    })
                }
            }
        case .icon:
            let icons = IconItem.allCases
            Button(action: {
                print("Clicked on index: \(index)")
            }) {
                HStack {
                    if index > 3 {
                        Text(icons[index].text)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Image(systemName: icons[index].iconName)
                        .foregroundStyle(Color.preferredColor(.tintColor))
                        .padding(.leading, index > 3 ? 8 : 0)
                        .accessibilityLabel(
                            icons[index].text
                        )
                }
                .frame(maxWidth: .infinity)
                .padding()
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
        }
    }
    
    func buttons() -> [(type: Int, title: String)] {
        var mergedButtons = [(Int, String)]()
        mergedButtons.append(contentsOf: self.buttonTexts.map { (0, $0) })
        if !self.secondaryButtonText.isEmpty {
            mergedButtons.insert((2, self.secondaryButtonText), at: 0)
        }
        if !self.thirdButtonText.isEmpty {
            mergedButtons.insert((3, self.thirdButtonText), at: 0)
        }
        if !self.primaryButtonText.isEmpty {
            mergedButtons.insert((1, self.primaryButtonText), at: 1)
        }
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

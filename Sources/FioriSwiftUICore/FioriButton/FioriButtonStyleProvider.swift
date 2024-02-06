import Foundation
import SwiftUI

struct FioriButtonStyleProvider {
    static func getPlainButtonStyle(state: UIControl.State) -> FioriButtonConfiguration {
        let backgroundColor: Color = .preferredColor(.primaryBackground)
        let foregroundColor: Color
        switch state {
        case .normal:
            foregroundColor = Color.preferredColor(.tintColor)
        case .highlighted, .selected:
            foregroundColor = Color.preferredColor(.tintColorTapState)
        default:
            foregroundColor = Color.preferredColor(.separator)
        }
        
        return FioriButtonConfiguration(foregroundColor: foregroundColor, backgroundColor: backgroundColor, font: .fiori(forTextStyle: .callout), padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
    
    static func getPrimaryButtonStyle(state: UIControl.State) -> FioriButtonConfiguration {
        let backgroundColor: Color
        let foregroundColor: Color
        switch state {
        case .normal:
            foregroundColor = Color.preferredColor(.base2)
            backgroundColor = Color.preferredColor(.tintColor)
        case .highlighted, .selected:
            foregroundColor = Color.preferredColor(.base2)
            backgroundColor = Color.preferredColor(.tintColorTapState)
        default:
            foregroundColor = Color.preferredColor(.separator)
            backgroundColor = Color.preferredColor(.tertiaryFill)
        }
        
        return FioriButtonConfiguration(foregroundColor: foregroundColor, backgroundColor: backgroundColor)
    }
    
    static func getSecondaryButtonStyle(colorStyle: FioriButtonColorStyle, for state: UIControl.State) -> FioriButtonConfiguration {
        let backgroundColor: Color
        let foregroundColor: Color
        switch colorStyle {
        case .tint:
            switch state {
            case .normal:
                foregroundColor = Color.preferredColor(.tintColor2)
                backgroundColor = Color.preferredColor(.informationBackground)
            case .highlighted, .selected:
                foregroundColor = Color.preferredColor(.tintColorTapState)
                backgroundColor = Color.preferredColor(.informationBackground)
            default:
                foregroundColor = Color.preferredColor(.separator)
                backgroundColor = Color.preferredColor(.tertiaryFill)
            }
        case .normal:
            switch state {
            case .normal:
                foregroundColor = Color.preferredColor(.secondaryLabel)
                backgroundColor = Color.preferredColor(.secondaryFill)
            case .highlighted, .selected:
                foregroundColor = Color.preferredColor(.secondaryLabel)
                backgroundColor = Color.preferredColor(.secondaryFill)
            default:
                foregroundColor = Color.preferredColor(.separator)
                backgroundColor = Color.preferredColor(.tertiaryFill)
            }
        case .negative:
            switch state {
            case .normal:
                foregroundColor = Color.preferredColor(.negativeLabel)
                backgroundColor = Color.preferredColor(.negativeBackground)
            case .highlighted, .selected:
                foregroundColor = Color.preferredColor(.negativeLabelTapState)
                backgroundColor = Color.preferredColor(.negativeBackgroundTapState)
            default:
                foregroundColor = Color.preferredColor(.separator)
                backgroundColor = Color.preferredColor(.tertiaryFill)
            }
        }
        
        return FioriButtonConfiguration(foregroundColor: foregroundColor, backgroundColor: backgroundColor)
    }
    
    static func getTertiaryButtonStyle(colorStyle: FioriButtonColorStyle, for state: UIControl.State) -> FioriButtonConfiguration {
        let backgroundColor: Color
        let foregroundColor: Color
        switch colorStyle {
        case .tint:
            switch state {
            case .normal:
                foregroundColor = Color.preferredColor(.tintColor2)
                backgroundColor = .clear
            case .highlighted, .selected:
                foregroundColor = Color.preferredColor(.tintColorTapState)
                backgroundColor = Color.preferredColor(.secondaryFill)
            default:
                foregroundColor = Color.preferredColor(.separator)
                backgroundColor = .clear
            }
        case .normal:
            switch state {
            case .normal:
                foregroundColor = Color.preferredColor(.primaryLabel)
                backgroundColor = .clear
            case .highlighted, .selected:
                foregroundColor = Color.preferredColor(.secondaryLabel)
                backgroundColor = Color.preferredColor(.secondaryFill)
            default:
                foregroundColor = Color.preferredColor(.separator)
                backgroundColor = .clear
            }
        case .negative:
            switch state {
            case .normal:
                foregroundColor = Color.preferredColor(.negativeLabel)
                backgroundColor = .clear
            case .highlighted, .selected:
                foregroundColor = Color.preferredColor(.negativeLabel)
                backgroundColor = Color.preferredColor(.secondaryFill)
            default:
                foregroundColor = Color.preferredColor(.separator)
                backgroundColor = Color.preferredColor(.tertiaryFill)
            }
        }
        
        return FioriButtonConfiguration(foregroundColor: foregroundColor, backgroundColor: backgroundColor)
    }
}

struct FioriButtonConfiguration {
    let foregroundColor: Color
    let backgroundColor: Color
    let font: Font
    let padding: EdgeInsets
    
    init(foregroundColor: Color, backgroundColor: Color, font: Font = .fiori(forTextStyle: .body).weight(.bold), padding: EdgeInsets = EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.font = font
        self.padding = padding
    }
}

extension View {
    func fioriButtonConfiguration(_ config: FioriButtonConfiguration) -> some View {
        self
            .font(config.font)
            .foregroundColor(config.foregroundColor)
            .padding(config.padding)
            .background(RoundedRectangle(cornerRadius: 5).fill(config.backgroundColor))
            .frame(minWidth: 44, minHeight: 44)
            .contentShape(Rectangle())
    }
}

import Foundation
import SwiftUI

enum FioriButtonStyleProvider {
    static func getPlainButtonStyle(state: UIControl.State) -> FioriButtonConfiguration {
        let backgroundColor: Color = .preferredColor(.primaryBackground)
        let foregroundColor: Color
        switch state {
        case .normal:
            foregroundColor = .preferredColor(.tintColor)
        case .highlighted, .selected:
            foregroundColor = .preferredColor(.tintColorTapState)
        default:
            foregroundColor = .preferredColor(.separator)
        }
        
        return FioriButtonConfiguration(foregroundColor: foregroundColor, backgroundColor: backgroundColor, font: .fiori(forTextStyle: .callout), padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
    
    static func getPrimaryButtonStyle(state: UIControl.State, loadingState: FioriButtonLoadingState = .unspecified) -> FioriButtonConfiguration {
        let backgroundColor: Color
        let foregroundColor: Color
        
        switch loadingState {
        case .processing, .success:
            foregroundColor = .preferredColor(.baseWhite)
            backgroundColor = .preferredColor(.tintColorTapState)
        default:
            switch state {
            case .normal:
                foregroundColor = .preferredColor(.base2)
                backgroundColor = .preferredColor(.tintColor)
            case .highlighted, .selected:
                foregroundColor = .preferredColor(.base2)
                backgroundColor = .preferredColor(.tintColorTapState)
            default:
                foregroundColor = .preferredColor(.separator)
                backgroundColor = .preferredColor(.tertiaryFill)
            }
        }
        
        return FioriButtonConfiguration(foregroundColor: foregroundColor, backgroundColor: backgroundColor)
    }
    
    static func getSecondaryButtonStyle(colorStyle: FioriButtonColorStyle, for state: UIControl.State, loadingState: FioriButtonLoadingState = .unspecified) -> FioriButtonConfiguration {
        let backgroundColor: Color
        let foregroundColor: Color
        switch colorStyle {
        case .tint:
            switch loadingState {
            case .processing, .success:
                foregroundColor = .preferredColor(.tintColorTapState)
                backgroundColor = .preferredColor(.secondaryFill)
            default:
                switch state {
                case .normal:
                    foregroundColor = .preferredColor(.tintColor2)
                    backgroundColor = .preferredColor(.informationBackground)
                case .highlighted, .selected:
                    foregroundColor = .preferredColor(.tintColorTapState)
                    backgroundColor = .preferredColor(.informationBackground)
                default:
                    foregroundColor = .preferredColor(.separator)
                    backgroundColor = .preferredColor(.tertiaryFill)
                }
            }
        case .normal:
            switch loadingState {
            case .processing, .success:
                foregroundColor = .preferredColor(.secondaryLabel)
                backgroundColor = .preferredColor(.secondaryFill)
            default:
                switch state {
                case .normal:
                    foregroundColor = .preferredColor(.secondaryLabel)
                    backgroundColor = .preferredColor(.secondaryFill)
                case .highlighted, .selected:
                    foregroundColor = .preferredColor(.secondaryLabel)
                    backgroundColor = .preferredColor(.secondaryFill)
                default:
                    foregroundColor = .preferredColor(.separator)
                    backgroundColor = .preferredColor(.tertiaryFill)
                }
            }
        case .negative:
            switch loadingState {
            case .processing, .success:
                foregroundColor = .preferredColor(.negativeLabelTapState)
                backgroundColor = .preferredColor(.secondaryFill)
            default:
                switch state {
                case .normal:
                    foregroundColor = .preferredColor(.negativeLabel)
                    backgroundColor = .preferredColor(.negativeBackground)
                case .highlighted, .selected:
                    foregroundColor = .preferredColor(.negativeLabelTapState)
                    backgroundColor = .preferredColor(.negativeBackgroundTapState)
                default:
                    foregroundColor = .preferredColor(.separator)
                    backgroundColor = .preferredColor(.tertiaryFill)
                }
            }
        }
        
        return FioriButtonConfiguration(foregroundColor: foregroundColor, backgroundColor: backgroundColor)
    }
    
    static func getTertiaryButtonStyle(colorStyle: FioriButtonColorStyle, for state: UIControl.State, loadingState: FioriButtonLoadingState = .unspecified) -> FioriButtonConfiguration {
        let backgroundColor: Color
        let foregroundColor: Color
        switch colorStyle {
        case .tint:
            switch loadingState {
            case .processing, .success:
                foregroundColor = .preferredColor(.tintColorTapState)
                backgroundColor = .preferredColor(.secondaryFill)
            default:
                switch state {
                case .normal:
                    foregroundColor = .preferredColor(.tintColor2)
                    backgroundColor = .clear
                case .highlighted, .selected:
                    foregroundColor = .preferredColor(.tintColorTapState)
                    backgroundColor = .preferredColor(.secondaryFill)
                default:
                    foregroundColor = .preferredColor(.separator)
                    backgroundColor = .clear
                }
            }
        case .normal:
            switch loadingState {
            case .processing, .success:
                foregroundColor = .preferredColor(.primaryLabel)
                backgroundColor = .preferredColor(.secondaryFill)
            default:
                switch state {
                case .normal:
                    foregroundColor = .preferredColor(.primaryLabel)
                    backgroundColor = .clear
                case .highlighted, .selected:
                    foregroundColor = .preferredColor(.secondaryLabel)
                    backgroundColor = .preferredColor(.secondaryFill)
                default:
                    foregroundColor = .preferredColor(.separator)
                    backgroundColor = .clear
                }
            }
        case .negative:
            switch loadingState {
            case .processing, .success:
                foregroundColor = .preferredColor(.negativeLabelTapState)
                backgroundColor = .preferredColor(.secondaryFill)
            default:
                switch state {
                case .normal:
                    foregroundColor = .preferredColor(.negativeLabel)
                    backgroundColor = .clear
                case .highlighted, .selected:
                    foregroundColor = .preferredColor(.negativeLabel)
                    backgroundColor = .preferredColor(.secondaryFill)
                default:
                    foregroundColor = .preferredColor(.separator)
                    backgroundColor = .preferredColor(.tertiaryFill)
                }
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
    let maxWidth: CGFloat?
    let loadingState: FioriButtonLoadingState
    
    init(foregroundColor: Color, backgroundColor: Color, font: Font = .fiori(forTextStyle: .body, weight: .semibold), padding: EdgeInsets = EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16), maxWidth: CGFloat? = nil, loadingState: FioriButtonLoadingState = .unspecified) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.font = font
        self.padding = padding
        self.maxWidth = maxWidth
        self.loadingState = loadingState
    }
    
    func withMaxWidth(_ maxWidth: CGFloat?) -> FioriButtonConfiguration {
        FioriButtonConfiguration(foregroundColor: self.foregroundColor, backgroundColor: self.backgroundColor, font: self.font, padding: self.padding, maxWidth: maxWidth, loadingState: self.loadingState)
    }
}

extension View {
    func fioriButtonConfiguration(_ config: FioriButtonConfiguration) -> some View {
        self
            .font(config.font)
            .foregroundColor(config.foregroundColor)
            .tint(config.foregroundColor)
            .padding(config.padding)
            .frame(minWidth: 44, maxWidth: config.maxWidth, minHeight: 44)
            .background(RoundedRectangle(cornerRadius: 8).fill(config.backgroundColor))
            .contentShape(Rectangle())
    }
}

/// loading state of `FioriButton`
public enum FioriButtonLoadingState {
    /// FioriButton loading state is not specified by developer
    case unspecified
    /// FioriButton  with activity indicator
    case processing
    /// FioriButton with success icon
    case success
}

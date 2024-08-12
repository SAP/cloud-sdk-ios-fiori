import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

public extension IllustratedMessage {
    enum DetailImageSize {
        case extraSmall
        case small
        case medium
        case large
        case extraLarge
    }
}

// Base Layout style
public struct IllustratedMessageBaseStyle: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                getResizedDetailImage(detailImage: configuration.detailImage, size: configuration.detailImageSize ?? IllustratedMessage.DetailImageSize.medium)
                    .padding(.bottom, 16)
                configuration.title
                    .padding(.bottom, 4)
                    .multilineTextAlignment(.center)
                configuration.description
                    .multilineTextAlignment(.center)
                
                if configuration.isActionVerticalAligned {
                    VStack(spacing: 8) {
                        configuration.action
                            .fioriButtonStyle(FioriPrimaryButtonStyle())
                        configuration.secondaryAction
                            .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .tint))
                    }
                    .padding(.top, 16)
                } else {
                    HStack {
                        configuration.secondaryAction
                            .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .tint, maxWidth: .infinity))
                        configuration.action
                            .fioriButtonStyle(FioriPrimaryButtonStyle()) // .infinity))
                    }
                    .padding(.top, 16)
                }
            }
            .padding(.horizontal, 16)
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}
    
// Default fiori styles
extension IllustratedMessageFioriStyle {
    struct ContentFioriStyle: IllustratedMessageStyle {
        func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
            IllustratedMessage(configuration)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    struct DetailImageFioriStyle: DetailImageStyle {
        let illustratedMessageConfiguration: IllustratedMessageConfiguration
        
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let illustratedMessageConfiguration: IllustratedMessageConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .headline, weight: .bold))
                .padding(.bottom, 4)
        }
    }

    struct DescriptionFioriStyle: DescriptionStyle {
        let illustratedMessageConfiguration: IllustratedMessageConfiguration
        
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
        }
    }

    struct ActionFioriStyle: ActionStyle {
        let illustratedMessageConfiguration: IllustratedMessageConfiguration
        
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
                .font(.fiori(forTextStyle: .body, weight: .bold))
                .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity))
        }
    }
    
    struct SecondaryActionFioriStyle: SecondaryActionStyle {
        let illustratedMessageConfiguration: IllustratedMessageConfiguration
        
        func makeBody(_ configuration: SecondaryActionConfiguration) -> some View {
            SecondaryAction(configuration)
                .font(.fiori(forTextStyle: .body, weight: .bold))
                .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .tint, maxWidth: .infinity))
        }
    }
}

/// Vertical layout style of the Illustrated Message. All content is displayed in one column. This is the default layout style
public struct IllustratedMessageVerticalLayoutStyle: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .illustratedMessageStyle(.fixedWidthButton)
    }
}

/// Horizontal layout style of the Illustrated Message. Shows content in two columns, with an image on the left and a vertical stack of the other content on the right
public struct IllustratedMessageHorizontalLayoutStyle: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        GeometryReader { stackGeometry in
            HStack(spacing: 16) {
                getResizedDetailImage(detailImage: configuration.detailImage, size: configuration.detailImageSize ?? IllustratedMessage.DetailImageSize.medium)
                GeometryReader { geometry in
                    VStack(alignment: configuration.contentAlignment, spacing: 0) {
                        configuration.title
                            .multilineTextAlignment(getTextAlignment(configuration.contentAlignment))
                        configuration.description
                            .multilineTextAlignment(getTextAlignment(configuration.contentAlignment))
                        if configuration.isActionVerticalAligned {
                            VStack(alignment: configuration.contentAlignment) {
                                configuration.action
                                    .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity))
                                configuration.secondaryAction
                                    .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .tint, maxWidth: .infinity))
                            }
                            .padding(.top, 16)
                        } else {
                            HStack(spacing: 8) {
                                configuration.secondaryAction
                                    .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .tint, maxWidth: .infinity))
                                configuration.action
                                    .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity))
                            }
                            .padding(.top, 16)
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }
            }
            .padding(.horizontal, 16)
            .frame(width: stackGeometry.size.width, height: stackGeometry.size.height, alignment: .center)
        }
    }
}

/// Mixed layout style of the Illustrated Message. Shows content in two columns, with an image on the left, a vertical stack of the title and descrition contents on the right, and the action button stack on the bottom.
public struct IllustratedMessageMixedLayoutStyle: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                HStack(spacing: 16) {
                    getResizedDetailImage(detailImage: configuration.detailImage, size: configuration.detailImageSize ?? IllustratedMessage.DetailImageSize.medium)
                    VStack(alignment: configuration.contentAlignment, spacing: 0) {
                        configuration.title
                            .multilineTextAlignment(getTextAlignment(configuration.contentAlignment))
                        configuration.description
                            .multilineTextAlignment(getTextAlignment(configuration.contentAlignment))
                    }
                }
                
                if configuration.isActionVerticalAligned {
                    VStack(alignment: .center) {
                        configuration.action
                            .frame(width: geometry.size.width * 0.6)
                            .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity))
                        configuration.secondaryAction
                            .frame(width: geometry.size.width * 0.6)
                            .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .tint, maxWidth: .infinity))
                    }
                    .padding(.top, 16)
                } else {
                    HStack {
                        configuration.secondaryAction
                            .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .tint, maxWidth: .infinity))
                        configuration.action
                            .fioriButtonStyle(FioriPrimaryButtonStyle())
                    }
                    .padding(.top, 16)
                }
            }
            .padding(.horizontal, 16)
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}

extension IllustratedMessageStyle {
    func getTextAlignment(_ alignment: HorizontalAlignment) -> TextAlignment {
        switch alignment {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        default:
            return .leading
        }
    }
}

/// Flexible action button style of the Illustrated Message. The width of the primary action button is hugged and the secondary action button will take the rest of the container width.
public struct IllustratedMessageFlexibleButtonStyle: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .actionStyle(content: { actionConfiguration in
                actionConfiguration.action
                    .fioriButtonStyle(FioriPrimaryButtonStyle().eraseToAnyFioriButtonStyle())
            })
            .secondaryActionStyle(content: { secondaryActionConfiguration in
                secondaryActionConfiguration.secondaryAction
                    .fioriButtonStyle((configuration.isActionVerticalAligned ? FioriSecondaryButtonStyle(colorStyle: .tint) : FioriSecondaryButtonStyle(colorStyle: .tint, maxWidth: .infinity)).eraseToAnyFioriButtonStyle())
            })
    }
}

/// Full width action button style of the Illustrated Message. The width of both action buttons will take the width of the container.
public struct IllustratedMessageFullWidthButtonStyle: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        GeometryReader { geometry in
            let splitMode = !configuration.isActionVerticalAligned && configuration.secondaryAction != nil
            IllustratedMessage(configuration)
                .actionStyle(content: { actionConfiguration in
                    actionConfiguration.action
                        .frame(width: splitMode ? (geometry.size.width - 24) / 2 : (geometry.size.width - 16))
                        .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity).eraseToAnyFioriButtonStyle())
                })
                .secondaryActionStyle(content: { secondaryActionConfiguration in
                    secondaryActionConfiguration.secondaryAction
                        .frame(width: splitMode ? (geometry.size.width - 24) / 2 : (geometry.size.width - 16))
                        .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .tint, maxWidth: .infinity).eraseToAnyFioriButtonStyle())
                })
        }
    }
}

/// Fixed width action button style of the Illustrated Message. The width of both action buttons will take the width of the container.
public struct IllustratedMessageFixedWidthButtonStyle: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        GeometryReader { geometry in
            let splitMode = !configuration.isActionVerticalAligned && configuration.secondaryAction != nil
            IllustratedMessage(configuration)
                .actionStyle(content: { actionConfiguration in
                    actionConfiguration.action
                        .frame(width: splitMode ? (geometry.size.width - 24) / 2 : (geometry.size.width - 16) * 0.6)
                        .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity).eraseToAnyFioriButtonStyle())
                })
                .secondaryActionStyle(content: { secondaryActionConfiguration in
                    secondaryActionConfiguration.secondaryAction
                        .frame(width: splitMode ? (geometry.size.width - 24) / 2 : (geometry.size.width - 16) * 0.6)
                        .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .tint, maxWidth: .infinity).eraseToAnyFioriButtonStyle())
                })
        }
    }
}

/// Vertical layout style of the Illustrated Message. All content is displayed in one column. This is the default layout style
public extension IllustratedMessageStyle where Self == IllustratedMessageVerticalLayoutStyle {
    static var vertical: some IllustratedMessageStyle {
        IllustratedMessageVerticalLayoutStyle().concat(.fiori)
    }
}

/// Horizontal layout style of the Illustrated Message. Shows content in two columns, with an image on the left and a vertical stack of the other content on the right
public extension IllustratedMessageStyle where Self == IllustratedMessageHorizontalLayoutStyle {
    static var horizontal: some IllustratedMessageStyle {
        IllustratedMessageHorizontalLayoutStyle().concat(.fiori)
    }
}

/// Mixed layout style of the Illustrated Message. Shows content in two columns, with an image on the left, a vertical stack of the title and descrition contents on the right, and the action button stack on the bottom.
public extension IllustratedMessageStyle where Self == IllustratedMessageMixedLayoutStyle {
    /// Mixed layout style of the Illustrated Message. Shows content in two columns, with an image on the left, a vertical stack of the title and descrition contents on the right, and the action button stack on the bottom.
    static var mixed: some IllustratedMessageStyle {
        IllustratedMessageMixedLayoutStyle().concat(.fiori)
    }
}

/// Flexible action button style of the Illustrated Message. The width of the primary action button is hugged and the secondary action button will take the rest of the container width.
public extension IllustratedMessageStyle where Self == IllustratedMessageFlexibleButtonStyle {
    /// Flexible action button style of the Illustrated Message. The width of the primary action button is hugged and the secondary action button will take the rest of the container width.
    static var flexibleButton: some IllustratedMessageStyle {
        IllustratedMessageFlexibleButtonStyle().concat(.fiori)
    }
}

/// Full width action button style of the Illustrated Message. The width of both action buttons will take the width of the container.
public extension IllustratedMessageStyle where Self == IllustratedMessageFullWidthButtonStyle {
    /// Full width action button style of the Illustrated Message. The width of both action buttons will take the width of the container.
    static var fullWidthButton: some IllustratedMessageStyle {
        IllustratedMessageFullWidthButtonStyle().concat(.fiori)
    }
}

/// Fixed width action button style of the Illustrated Message. The width of both action buttons is fixed.
public extension IllustratedMessageStyle where Self == IllustratedMessageFixedWidthButtonStyle {
    /// Full width action button style of the Illustrated Message. The width of both action buttons is fixed
    static var fixedWidthButton: some IllustratedMessageStyle {
        IllustratedMessageFixedWidthButtonStyle().concat(.fiori)
    }
}

func getResizedDetailImage(detailImage: IllustratedMessageConfiguration.DetailImage, size: IllustratedMessage.DetailImageSize) -> some View {
    switch size {
    case .extraSmall:
        return detailImage
            .frame(width: 48, height: 48)
    case .small:
        return detailImage
            .frame(width: 64, height: 64)
    case .medium:
        return detailImage
            .frame(width: 92, height: 92)
    case .large:
        return detailImage
            .frame(width: 160, height: 160)
    case .extraLarge:
        return detailImage
            .frame(width: 320, height: 240)
    }
}

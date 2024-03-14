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

public enum DetailImageSize {
    case extraSmall
    case small
    case medium
    case large
    case extraLarge
}

// Base Layout style
public struct IllustratedMessageBaseStyle: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        VStack(spacing: 0) {
            getResizedDetailImage(detailImage: configuration.detailImage, size: configuration.detailImageSize ?? DetailImageSize.medium)
                .padding(.bottom, 16)
            configuration.title
            configuration.description
            configuration.action
                .padding(.top, 24)
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
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .padding(.horizontal, 16)
                .padding(.bottom, 4)
        }
    }

    struct DescriptionFioriStyle: DescriptionStyle {
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .padding(.horizontal, 16)
        }
    }

    struct ActionFioriStyle: ActionStyle {
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
        }
    }
}

/// Vertical layout style of the Illustrated Message. All content is displayed in one column. This is the default layout style
public typealias IllustratedMessageVerticalLayoutStyle = IllustratedMessageBaseStyle

/// Horizontal layout style of the Illustrated Message. Shows content in two columns, with an image on the left and a vertical stack of the other content on the right
public struct IllustratedMessageHorizontalLayoutStyle: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        HStack(spacing: 0) {
            getResizedDetailImage(detailImage: configuration.detailImage, size: configuration.detailImageSize ?? DetailImageSize.medium)
                .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 0) {
                configuration.title
                configuration.description
                configuration.action
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
            }
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

func getResizedDetailImage(detailImage: IllustratedMessageConfiguration.DetailImage, size: DetailImageSize) -> some View {
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

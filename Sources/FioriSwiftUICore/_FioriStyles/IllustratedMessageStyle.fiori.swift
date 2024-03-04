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

// Base Layout style
public struct IllustratedMessageBaseStyle: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        VStack(spacing: 0) {
            configuration.detailImage
            configuration.title
            configuration.description
            configuration.action
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
                .padding(.bottom, 16)
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
                .padding(.top, 24)
        }
    }
}

/// Horizontal layout style of the Illustrated Message. Shows content in two columns, with an image on the left and a vertical stack of the other content on the right
public struct IllustratedMessageHorizontalStyle: IllustratedMessageStyle {
    @State var viewIsNarrow = true
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        HStack(spacing: 0) {
            configuration.detailImage
                .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 0) {
                configuration.title
                    .padding(.horizontal, 16)
                    .padding(.bottom, 4)
                configuration.description
                    .padding(.horizontal, 16)
                configuration.action
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
            }
        }
    }
}

/// Horizontal layout style of the Illustrated Message. Shows content in two columns, with an image on the left and a vertical stack of the other content on the right
public extension IllustratedMessageStyle where Self == IllustratedMessageHorizontalStyle {
    static var horizontal: Self {
        IllustratedMessageHorizontalStyle()
    }
}

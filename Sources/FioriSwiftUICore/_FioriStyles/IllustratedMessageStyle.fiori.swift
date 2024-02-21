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
                .padding(.bottom, 16)
            configuration.title
                .padding(.horizontal, 16)
                .padding(.bottom, 4)
            configuration.description
                .padding(.horizontal, 16)
            configuration.action
                .padding(.top, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
    
// Default fiori styles
extension IllustratedMessageFioriStyle {
    struct ContentFioriStyle: IllustratedMessageStyle {
        func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
            IllustratedMessage(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct DetailImageFioriStyle: DetailImageStyle {
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
            // Add default style for DetailImage
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
            // Add default style for Title
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct DescriptionFioriStyle: DescriptionStyle {
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
            // Add default style for Description
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct ActionFioriStyle: ActionStyle {
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
            // Add default style for Action
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

/// Show contents in a scrollable horizontal stack
public struct IllustratedMessageHorizontalStyle: IllustratedMessageStyle {
    @State var viewIsNarrow = true
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        HStack(spacing: 0) {
            configuration.detailImage
                .padding(.leading, 16)
            VStack(alignment: viewIsNarrow || configuration.detailImage.isEmpty ? .center : .leading, spacing: 0) {
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sizeReader { size in
            if size.width < 375 {
                viewIsNarrow = true
            } else {
                viewIsNarrow = false
            }
        }
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageHorizontalStyle {
    static var horizontal: Self {
        IllustratedMessageHorizontalStyle()
    }
}

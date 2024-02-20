import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct LinearProgressIndicatorViewBaseStyle: LinearProgressIndicatorViewStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        VStack {
            configuration._linearProgressIndicator
                .padding(.bottom, 12)
            HStack {
                configuration.icon
                configuration.description
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
        }
    }
}

// Default fiori styles
extension LinearProgressIndicatorViewFioriStyle {
    struct ContentFioriStyle: LinearProgressIndicatorViewStyle {
        func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
            LinearProgressIndicatorView(configuration)
        }
    }
    
    struct LinearProgressIndicatorFioriStyle: LinearProgressIndicatorStyle {
        func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
            LinearProgressIndicator(configuration)
        }
    }
    
    struct IconFioriStyle: IconStyle {
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .caption1))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .caption1))
        }
    }
}

public struct LinearProgressIndicatorViewErrorStyle: LinearProgressIndicatorViewStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorStyle(.error)
            .iconStyle(content: { iconConfiguration in
                if iconConfiguration.icon.isEmpty {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundStyle(Color.preferredColor(.negativeLabel))
                } else {
                    iconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(.negativeLabel))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundColor(.preferredColor(.negativeLabel))
            })
            .foregroundColor(.preferredColor(.negativeLabel))
    }
}

public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewErrorStyle {
    static var error: LinearProgressIndicatorViewErrorStyle {
        LinearProgressIndicatorViewErrorStyle()
    }
}

public struct LinearProgressIndicatorViewSuccessStyle: LinearProgressIndicatorViewStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorStyle(.success)
            .iconStyle(content: { iconConfiguration in
                if iconConfiguration.icon.isEmpty {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color.preferredColor(.tintColor))
                } else {
                    iconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(.tintColor))
                }
            })
    }
}

public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewSuccessStyle {
    static var success: LinearProgressIndicatorViewSuccessStyle {
        LinearProgressIndicatorViewSuccessStyle()
    }
}

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
        let linearProgressIndicatorViewConfiguration: LinearProgressIndicatorViewConfiguration
        
        func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
            LinearProgressIndicator(configuration)
        }
    }
    
    struct IconFioriStyle: IconStyle {
        let linearProgressIndicatorViewConfiguration: LinearProgressIndicatorViewConfiguration
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .caption1))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        let linearProgressIndicatorViewConfiguration: LinearProgressIndicatorViewConfiguration
        
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .caption1))
        }
    }
}

// Default nss styles
extension LinearProgressIndicatorViewNSSStyle {
    struct ContentNSSStyle: LinearProgressIndicatorViewStyle {
        let linearProgressIndicatorViewConfiguration: LinearProgressIndicatorViewConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
            LinearProgressIndicatorView(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct LinearProgressIndicatorNSSStyle: LinearProgressIndicatorStyle {
        let linearProgressIndicatorViewConfiguration: LinearProgressIndicatorViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
            LinearProgressIndicator(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for LinearProgressIndicator
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct IconNSSStyle: IconStyle {
        let linearProgressIndicatorViewConfiguration: LinearProgressIndicatorViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Icon
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct DescriptionNSSStyle: DescriptionStyle {
        let linearProgressIndicatorViewConfiguration: LinearProgressIndicatorViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Description
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}

/// Error style
public struct LinearProgressIndicatorViewErrorStyle: LinearProgressIndicatorViewStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorStyle(.error)
            .iconStyle(content: { iconConfiguration in
                if iconConfiguration.icon.isEmpty, !configuration.description.isEmpty {
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

/// Error style
public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewErrorStyle {
    static var error: LinearProgressIndicatorViewErrorStyle {
        LinearProgressIndicatorViewErrorStyle()
    }
}

/// Success style
public struct LinearProgressIndicatorViewSuccessStyle: LinearProgressIndicatorViewStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorStyle(.success)
            .iconStyle(content: { iconConfiguration in
                if iconConfiguration.icon.isEmpty, !configuration.description.isEmpty {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color.preferredColor(.tintColor))
                } else {
                    iconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(.tintColor))
                }
            })
    }
}

/// Success style
public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewSuccessStyle {
    static var success: LinearProgressIndicatorViewSuccessStyle {
        LinearProgressIndicatorViewSuccessStyle()
    }
}

/// Determinate style
public struct LinearProgressIndicatorViewDeterminateStyle: LinearProgressIndicatorViewStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorStyle(.determinate)
    }
}

/// Determinate style
public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewDeterminateStyle {
    static var determinate: LinearProgressIndicatorViewDeterminateStyle {
        LinearProgressIndicatorViewDeterminateStyle()
    }
}

/// Indeterminate style
public struct LinearProgressIndicatorViewIndeterminateStyle: LinearProgressIndicatorViewStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorStyle(.indeterminate)
    }
}

/// Indeterminate style
public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewIndeterminateStyle {
    static var indeterminate: LinearProgressIndicatorViewIndeterminateStyle {
        LinearProgressIndicatorViewIndeterminateStyle()
    }
}

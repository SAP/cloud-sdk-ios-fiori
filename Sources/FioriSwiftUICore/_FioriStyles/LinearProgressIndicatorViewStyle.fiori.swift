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
    /// Error style
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
    /// Success style
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
    /// Determinate style
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
    /// Indeterminate style
    static var indeterminate: LinearProgressIndicatorViewIndeterminateStyle {
        LinearProgressIndicatorViewIndeterminateStyle()
    }
}

/// Determinate AI style
public struct LinearProgressIndicatorViewDeterminateAIStyle: LinearProgressIndicatorViewStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorStyle(.determinateAI)
            .iconStyle(content: { iconConfiguration in
                if iconConfiguration.icon.isEmpty, !configuration.description.isEmpty {
                    Image(fioriName: "fiori.ai")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(Color.preferredColor(.tintColor))
                } else {
                    iconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(.tintColor))
                }
            })
    }
}

/// Determinate AI style
public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewDeterminateAIStyle {
    /// Determinate AI style
    static var determinateAI: LinearProgressIndicatorViewDeterminateAIStyle {
        LinearProgressIndicatorViewDeterminateAIStyle()
    }
}

/// Indeterminate AI style
public struct LinearProgressIndicatorViewIndeterminateAIStyle: LinearProgressIndicatorViewStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorStyle(.indeterminateAI)
            .iconStyle(content: { iconConfiguration in
                if iconConfiguration.icon.isEmpty, !configuration.description.isEmpty {
                    Image(fioriName: "fiori.ai")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(Color.preferredColor(.tintColor))
                } else {
                    iconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(.tintColor))
                }
            })
    }
}

/// Indeterminate AI style
public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewIndeterminateAIStyle {
    /// Indeterminate AI style
    static var indeterminateAI: LinearProgressIndicatorViewIndeterminateAIStyle {
        LinearProgressIndicatorViewIndeterminateAIStyle()
    }
}

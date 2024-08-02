import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct InformationViewBaseStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        VStack {
            HStack(alignment: .center, spacing: 8) {
                configuration.icon
                configuration.description
                Spacer()
            }
        }
    }
}

// Default fiori styles
extension InformationViewFioriStyle {
    struct ContentFioriStyle: InformationViewStyle {
        func makeBody(_ configuration: InformationViewConfiguration) -> some View {
            InformationView(configuration)
                .foregroundColor(.preferredColor(.tertiaryLabel))
                .padding(.top, 4)
                .padding(.bottom, 11)
        }
    }
    
    struct IconFioriStyle: IconStyle {
        let informationViewConfiguration: InformationViewConfiguration
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .footnote))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        let informationViewConfiguration: InformationViewConfiguration
        
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .footnote))
        }
    }
}

struct InformationViewModifier: ViewModifier {
    let icon: Image?
    let description: AttributedString
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        VStack {
            content
            
            if self.isPresented {
                InformationView(icon: self.icon, description: self.description)
            }
        }
    }
}

public extension View {
    /// To show the InformationView at the bottom of the view. It includes an icon and text. It is used in error handling to show error / warning / informational / success confirmation message.
    func informationView(isPresented: Binding<Bool>, icon: Image? = nil, description: AttributedString) -> some View {
        self.modifier(InformationViewModifier(icon: icon, description: description, isPresented: isPresented))
    }
}

public struct InformationViewErrorStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .iconStyle(content: { IconConfiguration in
                if IconConfiguration.icon.isEmpty {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundStyle(Color.preferredColor(.negativeLabel))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(.negativeLabel))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(.negativeLabel))
            })
    }
}

public struct InformationViewWarningStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .iconStyle(content: { IconConfiguration in
                if IconConfiguration.icon.isEmpty {
                    Image(systemName: "exclamationmark.triangle")
                        .foregroundStyle(Color.preferredColor(.criticalLabel))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(.criticalLabel))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(.criticalLabel))
            })
    }
}

public struct InformationViewInformationalStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .iconStyle(content: { IconConfiguration in
                if IconConfiguration.icon.isEmpty {
                    Image(systemName: "info.circle")
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(.primaryLabel))
            })
    }
}

public struct InformationViewSuccessStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .iconStyle(content: { IconConfiguration in
                if IconConfiguration.icon.isEmpty {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color.preferredColor(.positiveLabel))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(.positiveLabel))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(.positiveLabel))
            })
    }
}

/// Error style of the InformationView. It is used to show error message.
public extension InformationViewStyle where Self == InformationViewErrorStyle {
    static var error: InformationViewErrorStyle {
        InformationViewErrorStyle()
    }
}

/// Warning style of the InformationView. It is used to show warning message.
public extension InformationViewStyle where Self == InformationViewWarningStyle {
    static var warning: InformationViewWarningStyle {
        InformationViewWarningStyle()
    }
}

/// Informationalstyle of the InformationView. It is used to show informational message.
public extension InformationViewStyle where Self == InformationViewInformationalStyle {
    static var informational: InformationViewInformationalStyle {
        InformationViewInformationalStyle()
    }
}

/// Success style of the InformationView. It is used to show success message.
public extension InformationViewStyle where Self == InformationViewSuccessStyle {
    static var success: InformationViewSuccessStyle {
        InformationViewSuccessStyle()
    }
}

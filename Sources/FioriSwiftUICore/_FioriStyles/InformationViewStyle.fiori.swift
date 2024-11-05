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
        @Environment(\.isEnabled) var isEnabled
        func makeBody(_ configuration: InformationViewConfiguration) -> some View {
            InformationView(configuration)
                .foregroundColor(.preferredColor(self.isEnabled ? .tertiaryLabel : .separator))
                .padding(.top, 4)
                .padding(.bottom, 11)
        }
    }
    
    struct IconFioriStyle: IconStyle {
        @Environment(\.isEnabled) var isEnabled
        let informationViewConfiguration: InformationViewConfiguration
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundStyle(Color.preferredColor(self.isEnabled ? .tertiaryLabel : .separator))
                .font(.fiori(forTextStyle: .footnote))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        @Environment(\.isEnabled) var isEnabled
        let informationViewConfiguration: InformationViewConfiguration
        
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .foregroundColor(.preferredColor(self.isEnabled ? .tertiaryLabel : .separator))
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
    @Environment(\.isEnabled) var isEnabled
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .iconStyle(content: { IconConfiguration in
                if IconConfiguration.icon.isEmpty {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .negativeLabel : .separator))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .negativeLabel : .separator))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(self.isEnabled ? .negativeLabel : .separator))
            })
    }
}

public struct InformationViewWarningStyle: InformationViewStyle {
    @Environment(\.isEnabled) var isEnabled
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .iconStyle(content: { IconConfiguration in
                if IconConfiguration.icon.isEmpty {
                    Image(systemName: "exclamationmark.triangle")
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .criticalLabel : .separator))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .criticalLabel : .separator))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(self.isEnabled ? .criticalLabel : .separator))
            })
    }
}

public struct InformationViewInformationalStyle: InformationViewStyle {
    @Environment(\.isEnabled) var isEnabled
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .iconStyle(content: { IconConfiguration in
                if IconConfiguration.icon.isEmpty {
                    Image(systemName: "info.circle")
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .primaryLabel : .separator))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .primaryLabel : .separator))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(self.isEnabled ? .primaryLabel : .separator))
            })
    }
}

public struct InformationViewSuccessStyle: InformationViewStyle {
    @Environment(\.isEnabled) var isEnabled
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .iconStyle(content: { IconConfiguration in
                if IconConfiguration.icon.isEmpty {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .positiveLabel : .separator))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(self.isEnabled ? .positiveLabel : .separator))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(self.isEnabled ? .positiveLabel : .separator))
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

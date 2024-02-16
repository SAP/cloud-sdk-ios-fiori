import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct InformationViewBaseStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        VStack {
            configuration.content
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
                .foregroundColor(.preferredColor(.primaryLabel))
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .padding(.top, 4)
                .padding(.bottom, 11)
        }
    }
    
    struct IconFioriStyle: IconStyle {
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .footnote))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .footnote))
        }
    }
}

public extension View {
    /// To show the InformationView at the bottom of the view. It includes an icon and text. It is used in error handling to show error / warning / informational / success confirmation message.
    func informationView(icon: Image? = nil, description: AttributedString) -> some View {
        InformationView(icon: icon, description: description, content: { self })
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
                        .foregroundStyle(Color.preferredColor(.mango5))
                } else {
                    IconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(.mango5))
                }
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(.mango5))
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

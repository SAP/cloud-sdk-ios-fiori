import Foundation
import SwiftUI
import FioriThemeManager

// Base Layout style
public struct InformationViewBaseStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        VStack {
            configuration.informationViewContent
            HStack(alignment: .center, spacing: 8) {
                configuration.informationViewIcon
                configuration.informationViewText
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
            .informationViewTextStyle(.fiori)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.top, 4)
            .padding(.bottom, 11)
    }
}

    struct InformationViewIconFioriStyle: InformationViewIconStyle {
    func makeBody(_ configuration: InformationViewIconConfiguration) -> some View {
        InformationViewIcon(configuration)
    }
}

struct InformationViewTextFioriStyle: InformationViewTextStyle {
    func makeBody(_ configuration: InformationViewTextConfiguration) -> some View {
        InformationViewText(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.fiori(forTextStyle: .footnote))
    }
}

struct InformationViewContentFioriStyle: InformationViewContentStyle {
    func makeBody(_ configuration: InformationViewContentConfiguration) -> some View {
        InformationViewContent(configuration)
    }
}
}

extension View {
    /// To show the InformationView at the bottom of the view. It includes an icon and text. It is used in error handling to show error / warning / informational / success confirmation message.
    public func informationView(informationViewIcon: Image? = nil, informationViewText: AttributedString) -> some View {
        InformationView(informationViewContent: { self }, informationViewIcon: informationViewIcon, informationViewText: informationViewText)
    }
}

public struct InformationViewErrorStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .informationViewIconStyle(content: { informationViewIconConfiguration in
                if informationViewIconConfiguration.informationViewIcon.isEmpty {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundStyle(Color.preferredColor(.negativeLabel))
                } else {
                    informationViewIconConfiguration.informationViewIcon
                        .foregroundStyle(Color.preferredColor(.negativeLabel))
                }
            })
            .informationViewTextStyle(content: { informationViewTextConfiguration in
                informationViewTextConfiguration.informationViewText
                    .foregroundStyle(Color.preferredColor(.negativeLabel))
            })
            .foregroundStyle(Color.preferredColor(.negativeLabel))
    }
}

public struct InformationViewWarningStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .informationViewIconStyle(content: { informationViewIconConfiguration in
                if informationViewIconConfiguration.informationViewIcon.isEmpty {
                    Image(systemName: "exclamationmark.triangle")
                        .foregroundStyle(Color.preferredColor(.mango5))
                } else {
                    informationViewIconConfiguration.informationViewIcon
                        .foregroundStyle(Color.preferredColor(.mango5))
                }
            })
            .informationViewTextStyle(content: { informationViewTextConfiguration in
                informationViewTextConfiguration.informationViewText
                    .foregroundStyle(Color.preferredColor(.mango5))
                })
            .foregroundStyle(Color.preferredColor(.mango5))
    }
}

public struct InformationViewInformationalStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .informationViewIconStyle(content: { informationViewIconConfiguration in
                if informationViewIconConfiguration.informationViewIcon.isEmpty {
                    Image(systemName: "info.circle")
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                } else {
                    informationViewIconConfiguration.informationViewIcon
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                }
            })
            .informationViewTextStyle(content: { informationViewTextConfiguration in
                informationViewTextConfiguration.informationViewText
                    .foregroundStyle(Color.preferredColor(.primaryLabel))
                })
            .foregroundStyle(Color.preferredColor(.primaryLabel))
    }
}

public struct InformationViewSuccessStyle: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .informationViewIconStyle(content: { informationViewIconConfiguration in
                if informationViewIconConfiguration.informationViewIcon.isEmpty {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color.preferredColor(.positiveLabel))
                } else {
                    informationViewIconConfiguration.informationViewIcon
                        .foregroundStyle(Color.preferredColor(.positiveLabel))
                }
            })
            .informationViewTextStyle(content: { informationViewTextConfiguration in
                informationViewTextConfiguration.informationViewText
                    .foregroundStyle(Color.preferredColor(.positiveLabel))
                })
            .foregroundStyle(Color.preferredColor(.positiveLabel))
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

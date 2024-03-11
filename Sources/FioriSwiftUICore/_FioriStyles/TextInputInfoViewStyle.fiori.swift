import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TextInputInfoViewBaseStyle: TextInputInfoViewStyle {
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        HStack(alignment: .top, spacing: 8) {
            configuration.icon
            configuration.description
            Spacer()
            configuration.counter
        }
        .padding(.top, 4)
        .padding(.bottom, 11)
    }
}

// Default fiori styles
extension TextInputInfoViewFioriStyle {
    struct ContentFioriStyle: TextInputInfoViewStyle {
        func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
            TextInputInfoView(configuration)
                .foregroundColor(.preferredColor(.primaryLabel))
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
    
    struct CounterFioriStyle: CounterStyle {
        func makeBody(_ configuration: CounterConfiguration) -> some View {
            Counter(configuration)
                .font(.fiori(forTextStyle: .footnote))
        }
    }
    
    struct InformationViewFioriStyle: InformationViewStyle {
        func makeBody(_ configuration: InformationViewConfiguration) -> some View {
            InformationView(configuration)
        }
    }
}

struct TextInputInfoViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    let icon: Image?
    let description: AttributedString?
    let counter: AttributedString?
    
    func body(content: Content) -> some View {
        VStack {
            content
            
            if isPresented {
                TextInputInfoView(icon: icon, description: description, counter: counter)
            }
        }
    }
}

public extension View {
    /// To show the TextInputInfoView at the bottom of the view. It includes an icon and text. It is used in error handling to show error / warning / informational / success confirmation message.
    func textInputInfoView(isPresented: Binding<Bool>, icon: Image? = nil, description: AttributedString? = nil, counter: AttributedString? = nil) -> some View {
        self.modifier(TextInputInfoViewModifier(isPresented: isPresented, icon: icon, description: description, counter: counter))
    }
}

/// Error style
public struct TextInputInfoViewErrorStyle: TextInputInfoViewStyle {
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
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
            .counterStyle(content: { counterConfiguration in
                if !counterConfiguration.counter.isEmpty {
                    counterConfiguration.counter
                        .foregroundStyle(Color.preferredColor(.negativeLabel))
                        .font(.fiori(forTextStyle: .footnote))
                }
            })
    }
}

/// Warning style
public struct TextInputInfoViewWarningStyle: TextInputInfoViewStyle {
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
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

/// Informational Style
public struct TextInputInfoViewInformationalStyle: TextInputInfoViewStyle {
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
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

/// Success Style
public struct TextInputInfoViewSuccessStyle: TextInputInfoViewStyle {
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
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

/// Error style of the TextInputInfoView. It is used to show error message.
public extension TextInputInfoViewStyle where Self == TextInputInfoViewErrorStyle {
    static var error: TextInputInfoViewErrorStyle {
        TextInputInfoViewErrorStyle()
    }
}

/// Warning style of the TextInputInfoView. It is used to show warning message.
public extension TextInputInfoViewStyle where Self == TextInputInfoViewWarningStyle {
    static var warning: TextInputInfoViewWarningStyle {
        TextInputInfoViewWarningStyle()
    }
}

/// Informationalstyle of the TextInputInfoView. It is used to show informational message.
public extension TextInputInfoViewStyle where Self == TextInputInfoViewInformationalStyle {
    static var informational: TextInputInfoViewInformationalStyle {
        TextInputInfoViewInformationalStyle()
    }
}

/// Success style of the TextInputInfoView. It is used to show success message.
public extension TextInputInfoViewStyle where Self == TextInputInfoViewSuccessStyle {
    static var success: TextInputInfoViewSuccessStyle {
        TextInputInfoViewSuccessStyle()
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
struct TextInputInfoViewBaseStyle: TextInputInfoViewStyle {
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
            
            if self.isPresented {
                TextInputInfoView(icon: self.icon, description: self.description, counter: self.counter)
            }
        }
    }
}

extension View {
    /// To show the TextInputInfoView at the bottom of the view. It includes an icon and text. It is used in error handling to show error / warning / informational / success confirmation message.
    func textInputInfoView(isPresented: Binding<Bool>, icon: Image? = nil, description: AttributedString? = nil, counter: AttributedString? = nil) -> some View {
        self.modifier(TextInputInfoViewModifier(isPresented: isPresented, icon: icon, description: description, counter: counter))
    }
}

/// Error style
struct TextInputInfoViewErrorStyle: TextInputInfoViewStyle {
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
struct TextInputInfoViewWarningStyle: TextInputInfoViewStyle {
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
struct TextInputInfoViewInformationalStyle: TextInputInfoViewStyle {
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
struct TextInputInfoViewSuccessStyle: TextInputInfoViewStyle {
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
extension TextInputInfoViewStyle where Self == TextInputInfoViewErrorStyle {
    static var error: TextInputInfoViewErrorStyle {
        TextInputInfoViewErrorStyle()
    }
}

/// Warning style of the TextInputInfoView. It is used to show warning message.
extension TextInputInfoViewStyle where Self == TextInputInfoViewWarningStyle {
    static var warning: TextInputInfoViewWarningStyle {
        TextInputInfoViewWarningStyle()
    }
}

/// Informationalstyle of the TextInputInfoView. It is used to show informational message.
extension TextInputInfoViewStyle where Self == TextInputInfoViewInformationalStyle {
    static var informational: TextInputInfoViewInformationalStyle {
        TextInputInfoViewInformationalStyle()
    }
}

/// Success style of the TextInputInfoView. It is used to show success message.
extension TextInputInfoViewStyle where Self == TextInputInfoViewSuccessStyle {
    static var success: TextInputInfoViewSuccessStyle {
        TextInputInfoViewSuccessStyle()
    }
}

#Preview(body: {
    VStack(alignment: .leading) {
        Text("Default Fiori style, no icon")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"), counter: AttributedString("10/100"))
        
        Text("Default Fiori style, no message")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), counter: AttributedString("10/100"))
        
        Text("Default Fiori style, no counter")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))
        
        Text("Error style")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message, long messag  long message  long message  long message  long message  long message long message  long message"), counter: AttributedString("12/10"))
            .textInputInfoViewStyle(.error)
        
        Text("Warning style")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message, long messag  long message  long message  long message  long message  long message long message  long message"), counter: AttributedString("10/10"))
            .textInputInfoViewStyle(.warning)
        
        Text("Informational style")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"), counter: AttributedString("0/10"))
            .textInputInfoViewStyle(.informational)
        
        Text("Success style")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"), counter: AttributedString("10/100"))
            .textInputInfoViewStyle(.success)
        
        Text("Customized icon")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), icon: Image(systemName: "heart"), description: AttributedString("test message, long messag  long message  long message  long message  long message  long message long message  long message"), counter: AttributedString("10/100"))
        
        Text("Customized font and color")
            .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), icon: Image(systemName: "diamond"), description: AttributedString("test message"), counter: AttributedString("10/100"))
            .iconStyle(content: { iconConfiguration in
                iconConfiguration.icon
                    .foregroundStyle(Color.preferredColor(.tintColor))
            })
            .descriptionStyle(content: { descriptionConfiguration in
                descriptionConfiguration.description
                    .foregroundStyle(Color.preferredColor(.criticalLabel))
                    .font(.fiori(forTextStyle: .title2))
            })
            .counterStyle(content: { counterConfiguration in
                counterConfiguration.counter
                    .foregroundStyle(Color.preferredColor(.criticalLabel))
                    .font(.fiori(forTextStyle: .title2))
            })
        
        Spacer()
    }
    .padding()
})

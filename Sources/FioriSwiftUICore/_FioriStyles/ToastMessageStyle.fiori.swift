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
public struct ToastMessageBaseStyle: ToastMessageStyle {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    public func makeBody(_ configuration: ToastMessageConfiguration) -> some View {
        GeometryReader { reader in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    self.makeMessageBody(configuration: configuration, size: reader.size)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func makeMessageBody(configuration: ToastMessageConfiguration, size: CGSize) -> some View {
        HStack(alignment: .center, spacing: 8) {
            if configuration.icon.isEmpty {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(Color.preferredColor(.primaryLabel))
            } else {
                configuration.icon
            }
            configuration.title
                .font(Font.fiori(forTextStyle: .subheadline))
                .foregroundColor(Color.preferredColor(.primaryLabel))
        }
        .padding(20)
        .frame(width: size.width * (self.horizontalSizeClass == .compact ? 0.8 : 0.6))
        .background(Color.preferredColor(.header, interface: .elevatedConstant))
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .inset(by: 0.33)
                .stroke(Color.preferredColor(.separator), lineWidth: 0.33)
        )
        .shadow(color: Color.preferredColor(.sectionShadow), radius: 2)
        .shadow(color: Color.preferredColor(.cardShadow), radius: 16, x: 0, y: 8)
        .shadow(color: Color.preferredColor(.cardShadow), radius: 32, x: 0, y: 16)
    }
}

// Default fiori styles
extension ToastMessageFioriStyle {
    struct ContentFioriStyle: ToastMessageStyle {
        func makeBody(_ configuration: ToastMessageConfiguration) -> some View {
            ToastMessage(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct IconFioriStyle: IconStyle {
        let toastMessageConfiguration: ToastMessageConfiguration

        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
            // Add default style for Icon
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let toastMessageConfiguration: ToastMessageConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
            // Add default style for Title
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

// Default nss styles
extension ToastMessageNSSStyle {
    struct ContentNSSStyle: ToastMessageStyle {
        let toastMessageConfiguration: ToastMessageConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: ToastMessageConfiguration) -> some View {
            ToastMessage(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct IconNSSStyle: IconStyle {
        let toastMessageConfiguration: ToastMessageConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Icon
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TitleNSSStyle: TitleStyle {
        let toastMessageConfiguration: ToastMessageConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Title
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}

public extension View {
    /// Show a toast message as an overlay above the view.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the banner message.
    ///   - icon: Icon image in front of the text. The default is a checkmark icon.
    ///   - title: The message to display.
    ///   - duration: The duration in seconds for which the toast message is shown. The default is `1`.
    /// - Returns: A new `View` with the toast message.
    func toastMessage(isPresented: Binding<Bool>,
                      @ViewBuilder icon: () -> any View = { EmptyView() },
                      title: AttributedString,
                      duration: Double = 1) -> some View
    {
        self.modifier(ToastMessageModifier(icon: icon(),
                                           title: Text(title),
                                           duration: duration,
                                           isPresented: isPresented))
    }
    
    /// Show a toast message as an overlay above the view.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the banner message.
    ///   - icon: Icon image in front of the text. The default is a checkmark icon.
    ///   - title: The message to display.
    ///   - duration: The duration in seconds for which the toast message is shown. The default is `1`.
    /// - Returns: A new `View` with the toast message.
    func toastMessage(isPresented: Binding<Bool>,
                      @ViewBuilder icon: () -> any View = { EmptyView() },
                      title: String,
                      duration: Double = 1) -> some View
    {
        self.modifier(ToastMessageModifier(icon: icon(),
                                           title: Text(title),
                                           duration: duration,
                                           isPresented: isPresented))
    }
    
    /// Show a toast message as an overlay above the view.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the banner message.
    ///   - icon: Icon image in front of the text. The default is a checkmark icon.
    ///   - title: The message to display.
    ///   - duration: The duration in seconds for which the toast message is shown. The default is `1`.
    /// - Returns: A new `View` with the toast message.
    func toastMessage(isPresented: Binding<Bool>,
                      @ViewBuilder icon: () -> any View = { EmptyView() },
                      @ViewBuilder title: () -> any View,
                      duration: Double = 1) -> some View
    {
        self.modifier(ToastMessageModifier(icon: icon(),
                                           title: title(),
                                           duration: duration,
                                           isPresented: isPresented))
    }
}

struct ToastMessageModifier: ViewModifier {
    let icon: any View
    var title: any View
    var duration: Double
    @Binding var isPresented: Bool
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top, content: {
                if self.isPresented {
                    ToastMessage(icon: {
                        self.icon
                    }, title: {
                        self.title
                    })
                }
            })
            .setOnChange(of: self.isPresented) {
                self.showToast()
            }
    }
    
    private func showToast() {
        if self.duration > 0 {
            self.workItem?.cancel()
            
            let task = DispatchWorkItem {
                self.dismissToast()
            }
         
            if UIAccessibility.isVoiceOverRunning, !self.title.isEmpty {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    UIAccessibility.post(notification: .announcement, argument: self.title)
                }
            }
            
            self.workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + self.duration, execute: task)
        }
    }
    
    private func dismissToast() {
        withAnimation(.easeInOut) {
            self.isPresented = false
        }
        
        self.workItem?.cancel()
        self.workItem = nil
    }
}

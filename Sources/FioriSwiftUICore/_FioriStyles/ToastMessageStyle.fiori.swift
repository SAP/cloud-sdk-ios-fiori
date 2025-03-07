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

public enum ToastMessagePosition: String, CaseIterable, Identifiable {
    case above
    case center
    case below
    public var id: Self { self }
}

// Base Layout style
public struct ToastMessageBaseStyle: ToastMessageStyle {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var size: CGSize = .zero

    public func makeBody(_ configuration: ToastMessageConfiguration) -> some View {
        GeometryReader { reader in
            self.makeMessageBody(configuration: configuration, size: reader.size)
                .position(getPositionOffset(position: configuration.position, spacing: configuration.spacing, viewSize: self.size, parentViewSize: reader.size))
        }
    }
    
    func makeMessageBody(configuration: ToastMessageConfiguration, size: CGSize) -> some View {
        HStack(alignment: .center, spacing: 8) {
            configuration.icon
            configuration.title
                .font(Font.fiori(forTextStyle: .subheadline))
                .foregroundColor(Color.preferredColor(.primaryLabel))
        }
        .padding(20)
        .frame(width: size.width * (self.horizontalSizeClass == .compact ? 0.8 : 0.6))
        .background(.regularMaterial)
        .background(configuration.backgroundColor)
        .cornerRadius(configuration.cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: configuration.cornerRadius)
                .stroke(configuration.borderColor, lineWidth: configuration.borderWidth)
        )
        .sizeReader { size in
            self.size = size
        }
        .toastMessageShadow(configuration.shadow)
    }
}

private func getPositionOffset(position: ToastMessagePosition, spacing: CGFloat, viewSize: CGSize, parentViewSize: CGSize) -> CGPoint {
    var correctedSpacing: CGFloat
    var viewCoordinates = CGPoint()
    viewCoordinates.x = parentViewSize.width / 2

    if spacing < 0 {
        correctedSpacing = 0
    } else {
        correctedSpacing = spacing
    }
    
    switch position {
    case .above:
        viewCoordinates.y = -1 * (viewSize.height / 2 + correctedSpacing)
    case .center:
        viewCoordinates.y = parentViewSize.height / 2
    case .below:
        viewCoordinates.y = parentViewSize.height + viewSize.height / 2 + correctedSpacing
    }

    return viewCoordinates
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

public extension View {
    /// Show a toast message as an overlay above the view.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the banner message.
    ///   - icon: Icon image in front of the text. The default is a checkmark icon.
    ///   - title: The message to display.
    ///   - duration: The duration in seconds for which the toast message is shown. The default value is `1`.
    ///   - position: The position of the toast message relative to its parent view. `.center` puts the toast message in the center of its parent view, `.above` aligns it above the view, and `.below` aligns it below the view. The default value is `.center`.
    ///   - spacing: The amount of spacing to put in between the toast message and the frame of its parent view. This only applies to the `.above` and `.below` positions, and negative values are converted to `0`. The default value is `0`.
    ///   - cornerRadius: A number specifying how rounded the corners of the view should be. The default value is `6`.
    ///   - backgroundColor: The background color of the view. The default value is `Color.preferredColor(.tertiaryFill)`.
    ///   - borderWidth: The width of the border surrounding the toast message. The default value is `0`.
    ///   - borderColor: The color of the border surrounding the toast message. The default value is `Color.clear`.
    ///   - shadow: A shadow to render underneath the view. The default value is `FioriShadowStyle.level3`.
    /// - Returns: A new `View` with the toast message.
    func toastMessage(isPresented: Binding<Bool>,
                      @ViewBuilder icon: () -> any View = { EmptyView() },
                      title: AttributedString,
                      duration: Double = 1,
                      position: ToastMessagePosition = .center,
                      spacing: CGFloat = 0,
                      cornerRadius: CGFloat = 6,
                      backgroundColor: Color = Color.preferredColor(.tertiaryFill),
                      borderWidth: CGFloat = 0,
                      borderColor: Color = Color.clear,
                      shadow: FioriShadowStyle? = FioriShadowStyle.level3) -> some View
    {
        self.modifier(ToastMessageModifier(icon: icon(),
                                           title: Text(title),
                                           duration: duration,
                                           position: position,
                                           spacing: spacing,
                                           cornerRadius: cornerRadius,
                                           backgroundColor: backgroundColor,
                                           borderWidth: borderWidth,
                                           borderColor: borderColor,
                                           shadow: shadow,
                                           isPresented: isPresented))
    }
    
    /// Show a toast message as an overlay above the view.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the banner message.
    ///   - icon: Icon image in front of the text. The default is a checkmark icon.
    ///   - title: The message to display.
    ///   - duration: The duration in seconds for which the toast message is shown. The default value is `1`.
    ///   - position: The position of the toast message relative to its parent view. `.center` puts the toast message in the center of its parent view, `.above` aligns it above the view, and `.below` aligns it below the view. The default value is `.center`.
    ///   - spacing: The amount of spacing to put in between the toast message and the frame of its parent view. This only applies to the `.above` and `.below` positions, and negative values are converted to `0`. The default value is `0`.
    ///   - cornerRadius: A number specifying how rounded the corners of the view should be. The default value is `6`.
    ///   - backgroundColor: The background color of the view. The default value is `Color.preferredColor(.tertiaryFill)`.
    ///   - borderWidth: The width of the border surrounding the toast message. The default value is `0`.
    ///   - borderColor: The color of the border surrounding the toast message. The default value is `Color.clear`.
    ///   - shadow: A shadow to render underneath the view. The default value is `FioriShadowStyle.level3`.
    /// - Returns: A new `View` with the toast message.
    func toastMessage(isPresented: Binding<Bool>,
                      @ViewBuilder icon: () -> any View = { EmptyView() },
                      title: String,
                      duration: Double = 1,
                      position: ToastMessagePosition = .center,
                      spacing: CGFloat = 0,
                      cornerRadius: CGFloat = 6,
                      backgroundColor: Color = Color.preferredColor(.tertiaryFill),
                      borderWidth: CGFloat = 0,
                      borderColor: Color = Color.clear,
                      shadow: FioriShadowStyle? = FioriShadowStyle.level3) -> some View
    {
        self.modifier(ToastMessageModifier(icon: icon(),
                                           title: Text(title),
                                           duration: duration,
                                           position: position,
                                           spacing: spacing,
                                           cornerRadius: cornerRadius,
                                           backgroundColor: backgroundColor,
                                           borderWidth: borderWidth,
                                           borderColor: borderColor,
                                           shadow: shadow,
                                           isPresented: isPresented))
    }
    
    /// Show a toast message as an overlay above the view.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the banner message.
    ///   - icon: Icon image in front of the text. The default is a checkmark icon.
    ///   - title: The message to display.
    ///   - duration: The duration in seconds for which the toast message is shown. The default value is `1`.
    ///   - position: The position of the toast message relative to its parent view. `.center` puts the toast message in the center of its parent view, `.above` aligns it above the view, and `.below` aligns it below the view. The default value is `.center`.
    ///   - spacing: The amount of spacing to put in between the toast message and the frame of its parent view. This only applies to the `.above` and `.below` positions, and negative values are converted to `0`. The default value is `0`.
    ///   - cornerRadius: A number specifying how rounded the corners of the view should be. The default value is `6`.
    ///   - backgroundColor: The background color of the view. The default value is `Color.preferredColor(.tertiaryFill)`.
    ///   - borderWidth: The width of the border surrounding the toast message. The default value is `0`.
    ///   - borderColor: The color of the border surrounding the toast message. The default value is `Color.clear`.
    ///   - shadow: A shadow to render underneath the view. The default value is `FioriShadowStyle.level3`.
    /// - Returns: A new `View` with the toast message.
    func toastMessage(isPresented: Binding<Bool>,
                      @ViewBuilder icon: () -> any View = { EmptyView() },
                      @ViewBuilder title: () -> any View,
                      duration: Double = 1,
                      position: ToastMessagePosition = .center,
                      spacing: CGFloat = 0,
                      cornerRadius: CGFloat = 6,
                      backgroundColor: Color = Color.preferredColor(.tertiaryFill),
                      borderWidth: CGFloat = 0,
                      borderColor: Color = Color.clear,
                      shadow: FioriShadowStyle? = FioriShadowStyle.level3) -> some View
    {
        self.modifier(ToastMessageModifier(icon: icon(),
                                           title: title(),
                                           duration: duration,
                                           position: position,
                                           spacing: spacing,
                                           cornerRadius: cornerRadius,
                                           backgroundColor: backgroundColor,
                                           borderWidth: borderWidth,
                                           borderColor: borderColor,
                                           shadow: shadow,
                                           isPresented: isPresented))
    }
}

struct ToastMessageModifier: ViewModifier {
    let icon: any View
    var title: any View
    var duration: Double
    var position: ToastMessagePosition
    var spacing: CGFloat
    var cornerRadius: CGFloat
    var backgroundColor: Color
    var borderWidth: CGFloat
    var borderColor: Color
    var shadow: FioriShadowStyle?

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
                    }, position: self.position,
                    spacing: self.spacing,
                    cornerRadius: self.cornerRadius,
                    backgroundColor: self.backgroundColor,
                    borderWidth: self.borderWidth,
                    borderColor: self.borderColor,
                    shadow: self.shadow)
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

public extension View {
    @ViewBuilder
    func toastMessageShadow(_ shadowStyle: FioriShadowStyle?) -> some View {
        if let shadowStyle {
            self.shadow(shadowStyle)
        } else {
            self
        }
    }
}

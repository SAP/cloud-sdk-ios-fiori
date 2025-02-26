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
        .background(Color.preferredColor(.header, interface: .elevatedConstant))
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .inset(by: 0.33)
                .stroke(Color.preferredColor(.separator), lineWidth: 0.33)
        )
        .sizeReader { size in
            self.size = size
        }
        .shadow(color: Color.preferredColor(.sectionShadow), radius: 2)
        .shadow(color: Color.preferredColor(.cardShadow), radius: 16, x: 0, y: 8)
        .shadow(color: Color.preferredColor(.cardShadow), radius: 32, x: 0, y: 16)
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
    /// - Returns: A new `View` with the toast message.
    func toastMessage(isPresented: Binding<Bool>,
                      @ViewBuilder icon: () -> any View = { EmptyView() },
                      title: AttributedString,
                      duration: Double = 1,
                      position: ToastMessagePosition = .center,
                      spacing: CGFloat = 0) -> some View
    {
        self.modifier(ToastMessageModifier(icon: icon(),
                                           title: Text(title),
                                           duration: duration,
                                           position: position,
                                           spacing: spacing,
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
    /// - Returns: A new `View` with the toast message.
    func toastMessage(isPresented: Binding<Bool>,
                      @ViewBuilder icon: () -> any View = { EmptyView() },
                      title: String,
                      duration: Double = 1,
                      position: ToastMessagePosition = .center,
                      spacing: CGFloat = 0) -> some View
    {
        self.modifier(ToastMessageModifier(icon: icon(),
                                           title: Text(title),
                                           duration: duration,
                                           position: position,
                                           spacing: spacing,
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
    /// - Returns: A new `View` with the toast message.
    func toastMessage(isPresented: Binding<Bool>,
                      @ViewBuilder icon: () -> any View = { EmptyView() },
                      @ViewBuilder title: () -> any View,
                      duration: Double = 1,
                      position: ToastMessagePosition = .center,
                      spacing: CGFloat = 0) -> some View
    {
        self.modifier(ToastMessageModifier(icon: icon(),
                                           title: title(),
                                           duration: duration,
                                           position: position,
                                           spacing: spacing,
                                           isPresented: isPresented))
    }
}

struct ToastMessageModifier: ViewModifier {
    let icon: any View
    var title: any View
    var duration: Double
    var position: ToastMessagePosition
    var spacing: CGFloat
    
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
                    spacing: self.spacing)
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

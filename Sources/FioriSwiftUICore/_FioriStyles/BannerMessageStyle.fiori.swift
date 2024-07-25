import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct BannerMessageBaseStyle: BannerMessageStyle {
    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        VStack(spacing: 0) {
            configuration.topDivider.frame(height: 4)
            HStack {
                Spacer()
                configuration.icon
                configuration.title
                    .padding([.top, .bottom], 13)
                Spacer()
                configuration.closeAction.padding(.trailing)
            }
            .frame(minHeight: 39)
            Color.preferredColor(.separator).frame(height: 1)
        }
        .drawingGroup()
        .background(.bar)
    }
}

// Default fiori styles
extension BannerMessageFioriStyle {
    struct ContentFioriStyle: BannerMessageStyle {
        func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
            BannerMessage(configuration)
                .background(Color.preferredColor(.chromeSecondary))
        }
    }
    
    struct IconFioriStyle: IconStyle {
        let bannerMessageConfiguration: BannerMessageConfiguration
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundStyle(Color.preferredColor(.negativeLabel))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let bannerMessageConfiguration: BannerMessageConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(.negativeLabel))
                .font(.fiori(forTextStyle: .footnote))
        }
    }
    
    struct CloseActionFioriStyle: CloseActionStyle {
        let bannerMessageConfiguration: BannerMessageConfiguration
    
        func makeBody(_ configuration: CloseActionConfiguration) -> some View {
            CloseAction(configuration)
        }
    }
    
    struct TopDividerFioriStyle: TopDividerStyle {
        let bannerMessageConfiguration: BannerMessageConfiguration
    
        func makeBody(_ configuration: TopDividerConfiguration) -> some View {
            TopDivider(configuration)
                .background(Color.preferredColor(.negativeLabel))
        }
    }
}

public extension View {
    /// Show banner message view at the top of target view or as a overlay above the view.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the banner message.
    ///   - pushContentDown: A binding to a Boolean value that determines whether push the content down below the banner message.
    ///   - title: Attributed string for the title.
    ///   - bannerTapped: Action for banner tapped.
    /// - Returns: A new `View` with banner message.
    func bannerMessageView(isPresented: Binding<Bool>,
                           pushContentDown: Binding<Bool> = .constant(false),
                           @ViewBuilder icon: () -> any View = { EmptyView() },
                           title: AttributedString,
                           bannerTapped: (() -> Void)? = nil) -> some View
    {
        self.modifier(BannerMessageModifier(icon: icon(),
                                            title: Text(title),
                                            isPresented: isPresented,
                                            pushContentDown: pushContentDown,
                                            bannerTapped: bannerTapped))
    }
    
    /// Show banner message view at the top of target view or as a overlay above the view.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the banner message.
    ///   - pushContentDown: A binding to a Boolean value that determines whether push the content down below the banner message.
    ///   - title: String for the title.
    ///   - bannerTapped: Action for banner tapped.
    /// - Returns: A new `View` with banner message.
    func bannerMessageView(isPresented: Binding<Bool>,
                           pushContentDown: Binding<Bool> = .constant(false),
                           @ViewBuilder icon: () -> any View = { EmptyView() },
                           title: String,
                           bannerTapped: (() -> Void)? = nil) -> some View
    {
        self.modifier(BannerMessageModifier(icon: icon(),
                                            title: Text(title),
                                            isPresented: isPresented,
                                            pushContentDown: pushContentDown,
                                            bannerTapped: bannerTapped))
    }
    
    /// Show banner message view at the top of target view or as a overlay above the view.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the banner message.
    ///   - pushContentDown: A binding to a Boolean value that determines whether push the content down below the banner message.
    ///   - title: A view for the title.
    ///   - bannerTapped: Action for banner tapped.
    /// - Returns: A new `View` with banner message.
    func bannerMessageView(isPresented: Binding<Bool>,
                           pushContentDown: Binding<Bool> = .constant(false),
                           @ViewBuilder icon: () -> any View = { EmptyView() },
                           @ViewBuilder title: () -> any View,
                           bannerTapped: (() -> Void)? = nil) -> some View
    {
        self.modifier(BannerMessageModifier(icon: icon(),
                                            title: title(),
                                            isPresented: isPresented,
                                            pushContentDown: pushContentDown,
                                            bannerTapped: bannerTapped))
    }
}

struct BannerMessageModifier: ViewModifier {
    let icon: any View
    let title: any View
    @Binding var isPresented: Bool
    @Binding var pushContentDown: Bool
    var bannerTapped: (() -> Void)?
    @State var offset: CGFloat = 0
    
    @ViewBuilder var bannerMessage: some View {
        BannerMessage(icon: {
            self.icon
        }, title: {
            self.title
        }, closeAction: {
            FioriButton { state in
                if state == .normal {
                    withAnimation {
                        self.isPresented = false
                    }
                }
            } label: { _ in
                Image(systemName: "xmark")
            }
        })
        .onTapGesture {
            self.bannerTapped?()
        }
        .sizeReader { size in
            if abs(self.offset + size.height) > 0.1 {
                self.offset = -size.height
            }
        }
    }
    
    func body(content: Content) -> some View {
        if self.pushContentDown {
            content
                .padding(.top, self.isPresented ? -self.offset : 0)
                .overlay(alignment: .top, content: {
                    self.bannerMessage
                        .offset(y: self.isPresented ? 0 : self.offset)
                        .clipped()
                })
        } else {
            content
                .overlay(alignment: .top, content: {
                    self.bannerMessage
                        .offset(y: self.isPresented ? 0 : self.offset)
                        .clipped()
                })
        }
    }
}

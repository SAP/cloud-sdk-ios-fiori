import FioriThemeManager
import Foundation
import SwiftUI

/// Banner multi message type
public enum BannerMultiMessageType: Int {
    // Use this variant when neutral information is provided. Default. Message.
    case neutral
    // Use this variant when informative message is provided. For example, the status of a user action.
    case informative
    // Use this variant when a positive message is provided. For example, a confirmation for a successful user action.
    case positive
    // Use this variant when a critical message is provided. For example, an alert.
    case critical
    // Use this variant when a negative message is provided. For example, an error.
    case negative
}

/// Base Layout style
public struct BannerMessageBaseStyle: BannerMessageStyle {
    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        VStack(spacing: 0) {
            configuration.topDivider.frame(height: 4)
            HStack {
                HStack(spacing: 6, content: {
                    switch configuration.alignment {
                    case .leading:
                        configuration.icon
                        configuration.title
                            .padding([.top, .bottom], 13)
                        Spacer()
                    case .center:
                        Spacer()
                        configuration.icon
                        configuration.title
                            .padding([.top, .bottom], 13)
                        Spacer()
                    default:
                        Spacer()
                        configuration.icon
                        configuration.title
                            .padding([.top, .bottom], 13)
                    }
                })
                .padding(.leading, configuration.alignment == .center ? 44 : 16)
                .padding(.trailing, configuration.alignment == .center ? 0 : 16)
                .onTapGesture {
                    configuration.bannerTapAction?()
                }
                
                Spacer()
                
                configuration.closeAction.padding(.trailing)
            }
            .frame(minHeight: 39)
            if !configuration.hideSeparator {
                Color.preferredColor(.separator).frame(height: 1)
            }
        }
        .drawingGroup()
        .background(Color.preferredColor(.tertiaryBackground))
    }
}

struct BannerMessageNeutralStyle: BannerMessageStyle {
    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle { c in
                c.icon.foregroundStyle(BannerMessageFioriStyle.titleForegroundColor(type: .neutral))
            }
    }
}

struct BannerMessageNegativeStyle: BannerMessageStyle {
    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle { c in
                c.icon.foregroundStyle(BannerMessageFioriStyle.titleForegroundColor(type: .negative))
            }
            .titleStyle(content: { c in
                c.title.foregroundStyle(BannerMessageFioriStyle.titleForegroundColor(type: .negative))
            })
    }
}

struct BannerMessageCriticalStyle: BannerMessageStyle {
    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle { c in
                c.icon.foregroundStyle(BannerMessageFioriStyle.titleForegroundColor(type: .critical))
            }
            .titleStyle(content: { c in
                c.title.foregroundStyle(BannerMessageFioriStyle.titleForegroundColor(type: .critical))
            })
    }
}

struct BannerMessagePositiveStyle: BannerMessageStyle {
    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle { c in
                c.icon.foregroundStyle(BannerMessageFioriStyle.titleForegroundColor(type: .positive))
            }
            .titleStyle(content: { c in
                c.title.foregroundStyle(BannerMessageFioriStyle.titleForegroundColor(type: .positive))
            })
    }
}

struct BannerMessageInformativeStyle: BannerMessageStyle {
    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle { c in
                c.icon.foregroundStyle(BannerMessageFioriStyle.titleForegroundColor(type: .informative))
            }
            .titleStyle(content: { c in
                c.title.foregroundStyle(BannerMessageFioriStyle.titleForegroundColor(type: .informative))
            })
    }
}

// Default fiori styles
extension BannerMessageFioriStyle {
    static func titleForegroundColor(type: BannerMultiMessageType) -> Color {
        switch type {
        case .neutral:
            Color.preferredColor(.neutralLabel)
        case .negative:
            Color.preferredColor(.negativeLabel)
        case .critical:
            Color.preferredColor(.criticalLabel)
        case .positive:
            Color.preferredColor(.positiveLabel)
        case .informative:
            Color.preferredColor(.informativeLabel)
        }
    }
    
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
                .foregroundStyle(BannerMessageFioriStyle.titleForegroundColor(type: self.bannerMessageConfiguration.messageType))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let bannerMessageConfiguration: BannerMessageConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(BannerMessageFioriStyle.titleForegroundColor(type: self.bannerMessageConfiguration.messageType))
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
                .background(BannerMessageFioriStyle.titleForegroundColor(type: self.bannerMessageConfiguration.messageType))
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
                           bannerTapped: (() -> Void)? = nil,
                           alignment: HorizontalAlignment? = nil) -> some View
    {
        self.modifier(BannerMessageModifier(icon: icon(),
                                            title: Text(title),
                                            isPresented: isPresented,
                                            pushContentDown: pushContentDown,
                                            bannerTapped: bannerTapped,
                                            alignment: alignment ?? .center,
                                            hideSeparator: false,
                                            messageType: .negative,
                                            turnOnSectionHeader: true,
                                            showDetailLink: false,
                                            bannerMultiMessages: Binding<[BannerMessageListModel]>.constant([])))
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
                           bannerTapped: (() -> Void)? = nil,
                           alignment: HorizontalAlignment? = nil) -> some View
    {
        self.modifier(BannerMessageModifier(icon: icon(),
                                            title: Text(title),
                                            isPresented: isPresented,
                                            pushContentDown: pushContentDown,
                                            bannerTapped: bannerTapped,
                                            alignment: alignment ?? .center,
                                            hideSeparator: false,
                                            messageType: .negative,
                                            turnOnSectionHeader: true,
                                            showDetailLink: false,
                                            bannerMultiMessages: Binding<[BannerMessageListModel]>.constant([])))
    }
    
    /// Show banner message view at the top of target view or as a overlay above the view.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the banner message.
    ///   - pushContentDown: A binding to a Boolean value that determines whether push the content down below the banner message.
    ///   - title: A view for the title.
    ///   - bannerTapped: Action for banner tapped.
    ///   - icon: A view for the icon.
    ///   - alignment: A alignment for the icon and title
    /// - Returns: A new `View` with banner message.
    func bannerMessageView(isPresented: Binding<Bool>,
                           pushContentDown: Binding<Bool> = .constant(false),
                           @ViewBuilder icon: () -> any View = { EmptyView() },
                           @ViewBuilder title: () -> any View,
                           bannerTapped: (() -> Void)? = nil,
                           alignment: HorizontalAlignment? = nil) -> some View
    {
        self.modifier(BannerMessageModifier(icon: icon(),
                                            title: title(),
                                            isPresented: isPresented,
                                            pushContentDown: pushContentDown,
                                            bannerTapped: bannerTapped,
                                            alignment: alignment ?? .center,
                                            hideSeparator: false,
                                            messageType: .negative,
                                            turnOnSectionHeader: true,
                                            showDetailLink: false,
                                            bannerMultiMessages: Binding<[BannerMessageListModel]>.constant([])))
    }

    /// Show banner message view at the top of target view or as a overlay above the view. Click View Detail can pop up message detail sheet.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the banner message.
    ///   - pushContentDown: A binding to a Boolean value that determines whether push the content down below the banner message.
    ///   - icon: A view for the icon.
    ///   - bannerTapped: Action for banner tapped.
    ///   - viewDetailAction: View the message detail callback, the parameter is message id, developer can use the id to scroll to the relative item
    ///   - alignment: A alignment for the icon and title.
    ///   - hideSeparator: Hide bottom separator or not.
    ///   - messageType: The type of message, default is .negative
    ///   - turnOnSectionHeader: Show message detail section header or not, default is true
    ///   - showDetailLink: Show view details link or not
    ///   - bannerMultiMessages: Multi message data array, [BannerMessageListModel]
    /// - Returns: A new `View` with banner message.
    func bannerMessageView(isPresented: Binding<Bool>,
                           pushContentDown: Binding<Bool> = .constant(false),
                           @ViewBuilder icon: () -> any View = { EmptyView() },
                           bannerTapped: (() -> Void)? = nil,
                           viewDetailAction: ((UUID) -> Void)? = nil,
                           alignment: HorizontalAlignment = .center,
                           hideSeparator: Bool = false,
                           messageType: BannerMultiMessageType = .negative,
                           turnOnSectionHeader: Bool = true,
                           showDetailLink: Bool = false,
                           bannerMultiMessages: Binding<[BannerMessageListModel]> = Binding<[BannerMessageListModel]>.constant([])) -> some View
    {
        var finalMessageType = messageType
        
        if !bannerMultiMessages.isEmpty {
            /// .neutral has the lowest priority, finalMessageType will be figured out from bannerMultiMessages
            finalMessageType = .neutral
        }
        
        for bannerMessageListModel in bannerMultiMessages {
            for singleMessageModel in bannerMessageListModel.wrappedValue.items where singleMessageModel.messageType.rawValue > finalMessageType.rawValue {
                finalMessageType = singleMessageModel.messageType
            }
        }
        return self.modifier(BannerMessageModifier(icon: icon(),
                                                   isPresented: isPresented,
                                                   pushContentDown: pushContentDown,
                                                   bannerTapped: bannerTapped,
                                                   viewDetailAction: viewDetailAction,
                                                   alignment: alignment,
                                                   hideSeparator: hideSeparator,
                                                   messageType: finalMessageType,
                                                   turnOnSectionHeader: turnOnSectionHeader,
                                                   showDetailLink: showDetailLink,
                                                   bannerMultiMessages: bannerMultiMessages))
    }
}

struct BannerMessageModifier: ViewModifier {
    let icon: (any View)?
    var title: (any View)?
    @Binding var isPresented: Bool
    @Binding var pushContentDown: Bool
    var bannerTapped: (() -> Void)?
    
    // View the message detail callback, the parameter is message id, developer can use the id to scroll to the relative item
    var viewDetailAction: ((UUID) -> Void)?
    
    var alignment: HorizontalAlignment
    var hideSeparator: Bool
    var messageType: BannerMultiMessageType
    var turnOnSectionHeader: Bool
    var showDetailLink: Bool
    @State var offset: CGFloat = 0
    
    @Binding private var bannerMultiMessages: [BannerMessageListModel]
    
    @State private var showingMessageDetail: Bool = false
    
    init(icon: (any View)? = nil, title: (any View)? = nil, isPresented: Binding<Bool>, pushContentDown: Binding<Bool>, bannerTapped: (() -> Void)? = nil, viewDetailAction: ((UUID) -> Void)? = nil, alignment: HorizontalAlignment, hideSeparator: Bool, messageType: BannerMultiMessageType, turnOnSectionHeader: Bool, showDetailLink: Bool, bannerMultiMessages: Binding<[BannerMessageListModel]>) {
        self.icon = icon
        self.title = title
        _isPresented = isPresented
        _pushContentDown = pushContentDown
        self.bannerTapped = bannerTapped
        self.viewDetailAction = viewDetailAction
        self.alignment = alignment
        self.hideSeparator = hideSeparator
        self.messageType = messageType
        self.turnOnSectionHeader = turnOnSectionHeader
        self.showDetailLink = showDetailLink
        _bannerMultiMessages = bannerMultiMessages
    }
    
    func calculateMessageSummary() -> AttributedString {
        var calculateDict: [BannerMultiMessageType: Int] = [:]
        
        for BannerMessageListModel in self.bannerMultiMessages {
            for singleMessageModel in BannerMessageListModel.items {
                let key = singleMessageModel.messageType
                if let originValue = calculateDict[key] {
                    calculateDict[key] = originValue + 1
                } else {
                    calculateDict[key] = 1
                }
            }
        }
        var summary: [String] = []
        for (key, value) in calculateDict.sorted(by: { $0.key.rawValue > $1.key.rawValue }) {
            summary.append("\(value) \(self.messageDesc(type: key, count: value))")
        }
        
        if !summary.isEmpty {
            var result = ""
            for i in 0 ..< summary.count {
                if result == "" {
                    result = summary[i]
                } else {
                    result += ", \(summary[i])"
                }
            }
            result += ". "
            var attributedString = AttributedString(result)
            
            // show detail link to pop up multi message sheet
            if !self.showDetailLink {
                return attributedString
            }
            
            var viewDetail = AttributedString(NSLocalizedString("View Details", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
            viewDetail.foregroundColor = .preferredColor(.tintColor)
            viewDetail.link = URL(string: "ViewDetails")
            attributedString.append(viewDetail)
            return attributedString
        } else {
            return AttributedString("")
        }
    }
    
    func messageDesc(type: BannerMultiMessageType, count: Int) -> String {
        var key = ""
        switch type {
        case .neutral:
            key = "message"
        case .informative:
            key = "information"
        case .positive:
            key = "confirmation"
        case .critical:
            key = "warning"
        case .negative:
            key = "error"
        }
        return NSLocalizedString(key + (count > 1 ? "s" : ""), tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
    }
    
    @ViewBuilder var defaultIcon: some View {
        switch self.messageType {
        case .neutral:
            Image(fioriName: "fiori.hint")
        case .informative:
            Image(fioriName: "fiori.hint")
        case .positive:
            Image(fioriName: "fiori.hint")
        case .critical:
            Image(fioriName: "fiori.warning2")
        case .negative:
            Image(fioriName: "fiori.notification.3")
        }
    }
    
    @ViewBuilder var bannerMessage: some View {
        BannerMessage(icon: {
            (self.icon ?? self.defaultIcon).typeErased
        }, title: {
            if let title = self.title {
                AnyView(title)
            } else {
                Text(self.calculateMessageSummary())
                    .environment(\.openURL, OpenURLAction(handler: { url in
                        if url.absoluteString == "ViewDetails" {
                            self.showingMessageDetail = true
                            
                            if UIDevice.current.userInterfaceIdiom == .phone {
                                self.isPresented = false
                            }
                        }
                        return .handled
                    }))
                    .frame(minWidth: (UIDevice.current.userInterfaceIdiom != .phone && self.alignment != .center) ? 393 : nil, alignment: .leading)
                    .popover(isPresented: self.$showingMessageDetail) {
                        BannerMultiMessageSheet(title: {
                            EmptyView()
                        }, closeAction: {
                            EmptyView()
                        }, dismissAction: {
                            self.showingMessageDetail = false
                        }, removeAction: { _, _ in
                            if self.bannerMultiMessages.isEmpty {
                                self.isPresented = false
                            }
                        }, viewDetailAction: self.viewDetailAction, turnOnSectionHeader: self.turnOnSectionHeader, bannerMultiMessages: self.$bannerMultiMessages)
                            .presentationDetents([.medium, .large])
                    }
            }
        }, closeAction: {
            FioriButton { state in
                if state == .normal {
                    withAnimation {
                        self.isPresented = false
                    }
                }
            } label: { _ in
                Image(fioriName: "fiori.decline")
            }
        }, bannerTapAction: self.bannerTapped, alignment: self.alignment, hideSeparator: self.hideSeparator, messageType: self.messageType, showDetailLink: self.showDetailLink)
            .sizeReader { size in
                if abs(self.offset + size.height) > 0.1, !self.showingMessageDetail {
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

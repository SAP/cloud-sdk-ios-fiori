import Foundation
import SwiftUI

// MARK: Macro generated

public protocol NewObjectItemStyle: DynamicProperty {
    associatedtype Body: View
    func makeBody(_ configuration: NewObjectItemConfiguration) -> Body
}

public struct NewObjectItemConfiguration {
    public let title: Title
    public let subtitle: Subtitle
    public let footnote: Footnote
    public let description: Description
    public let status: Status
    public let substatus: Substatus
    public let detailImage: DetailImage
    public let icons: Icons
    public let tags: Tags
    public let actionTitle: ActionTitle
    public let action: (() -> Void)?
    
    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Footnote = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias Status = ConfigurationViewWrapper
    public typealias Substatus = ConfigurationViewWrapper
    public typealias DetailImage = ConfigurationViewWrapper
    public typealias Icons = ConfigurationViewWrapper
    public typealias Tags = ConfigurationViewWrapper
    public typealias ActionTitle = ConfigurationViewWrapper
}

/// The style that provides styling attributes for this component (i.e. font, color, etc)
public struct NewObjectItemFioriStyle: NewObjectItemStyle {
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .titleStyle {
                Title($0).modifier(TitleFioriStyleModifier())
            }
            .subtitleStyle {
                Subtitle($0).modifier(SubTitleFioriStyleModifier())
            }
            .footnoteStyle {
                Footnote($0).modifier(FootnoteFioriStyleModifier())
            }
            .statusStyle {
                Status($0).modifier(StatusFioriStyleModifier())
            }
            .substatusStyle {
                Substatus($0).modifier(SubstatusFioriStyleModifier())
            }
            .descriptionStyle {
                Description($0).modifier(DescriptionFioriStyleModifier())
            }
            .actionTitleStyle {
                ActionTitle($0)
                    .modifier(ActionTitleFioriStyleModifier())
            }
            .detailImageStyle {
                DetailImage($0)
                    .modifier(DetailImageFioriStyleModifier())
            }
    }
}

public struct NewObjectItemTitleStyle: NewObjectItemStyle {
    let style: any TitleStyle
    
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public struct NewObjectItemSubtitleStyle: NewObjectItemStyle {
    let style: any SubtitleStyle
    
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public struct NewObjectItemActionTitleStyle: NewObjectItemStyle {
    let style: any ActionTitleStyle
    
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .actionTitleStyle(self.style)
            .typeErased
    }
}

public struct NewObjectItemActionStyle: NewObjectItemStyle {
    let style: any ButtonStyle
    
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .buttonStyle(self.style)
            .typeErased
    }
}

public extension NewObjectItemStyle where Self == NewObjectItemBaseStyle {
    static var base: Self {
        NewObjectItemBaseStyle()
    }
}

public extension NewObjectItemStyle where Self == NewObjectItemFioriStyle {
    static var fiori: Self {
        NewObjectItemFioriStyle()
    }
}

public extension NewObjectItemStyle where Self == NewObjectItemTitleStyle {
    static func titleStyle<Style: TitleStyle>(_ style: Style) -> NewObjectItemTitleStyle {
        NewObjectItemTitleStyle(style: style)
    }
    
    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> NewObjectItemTitleStyle {
        let style = AnyTitleStyle(content)
        return NewObjectItemTitleStyle(style: style)
    }
}

public extension NewObjectItemStyle where Self == NewObjectItemSubtitleStyle {
    static func subtitleStyle<Style: SubtitleStyle>(_ style: Style) -> NewObjectItemSubtitleStyle {
        NewObjectItemSubtitleStyle(style: style)
    }
    
    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> NewObjectItemSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return NewObjectItemSubtitleStyle(style: style)
    }
}

public extension NewObjectItemStyle where Self == NewObjectItemActionTitleStyle {
    static func actionTitleStyle<Style: ActionTitleStyle>(_ style: Style) -> NewObjectItemActionTitleStyle {
        NewObjectItemActionTitleStyle(style: style)
    }
    
    static func actionTitleStyle(@ViewBuilder content: @escaping (ActionTitleConfiguration) -> some View) -> NewObjectItemActionTitleStyle {
        let style = AnyActionTitleStyle(content)
        return NewObjectItemActionTitleStyle(style: style)
    }
}

// Modifier

public struct NewObjectItemStyleModifier<Style: NewObjectItemStyle>: ViewModifier {
    let style: Style
    
    public func body(content: Content) -> some View {
        content
            .newObjectItemStyle(self.style)
    }
}

extension NewObjectItemStyle {
    // Modify the current style.
    func modifier(_ modifier: some ViewModifier) -> some NewObjectItemStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }
    
    // Concatenate a new style on current style. The current style is the base style so it will take the precedence.
    func concat(_ style: some NewObjectItemStyle) -> some NewObjectItemStyle {
        style.modifier(NewObjectItemStyleModifier(style: self))
    }
}

public struct AnyNewObjectItemStyle: NewObjectItemStyle {
    let content: (NewObjectItemConfiguration) -> any View
    
    init(@ViewBuilder _ content: @escaping (NewObjectItemConfiguration) -> any View) {
        self.content = content
    }
    
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

// MARK: Style implementations by SDK developers

/// The style that only defines the default layout of DemoView without providing any styling attributes.
public struct NewObjectItemBaseStyle: NewObjectItemStyle {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.splitPercent) var splitPercent
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @State var mainViewSize: CGSize = .zero
    
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        var shouldShowAvatar: Bool {
            /*! isAvatarsEmptyView || */ !configuration.detailImage.isEmpty
        }
        
        @ViewBuilder
        var avatarView: some View {
            //            if !isAvatarsEmptyView {
            //                avatars.clipped()
            //                Spacer().frame(width: 12)
            //            } else
            if !configuration.detailImage.isEmpty {
                configuration.detailImage
                //                Spacer().frame(width: 12)
            } else {
                EmptyView()
            }
        }
        
        var isCenterAligned: Bool {
            configuration.subtitle.isEmpty && configuration.footnote.isEmpty && configuration.tags.isEmpty
        }
        
        let context = Context(configuration: configuration, shouldShowAvatar: shouldShowAvatar, avatarView: avatarView)
        
        // FIXME: check if VStack causes any problem.
        return VStack {
            if !configuration.actionTitle.isEmpty {
                // When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.
                if isCenterAligned {
                    self.makeOneLineSingleActionView(context)
                } else {
                    self.makeRegularSingleActionView(context)
                }
            } else if horizontalSizeClass == nil || horizontalSizeClass == .some(.compact) || splitPercent == nil {
                // When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.
                if isCenterAligned {
                    self.makeCompactOneLineView(context)
                }
                // If only 1 status is being used with either a chevron or with no accessory view, the body and subhead labels in the main content area should extend to the full width of the cell below the status.
                // The headline must maintain the 8 px padding with the status.
                else if configuration.substatus.isEmpty {
                    self.makeCompactOneStatusView(context)
                } else {
                    self.makeCompactGeneralView(context)
                }
            } else { // horizontalSizeClass is Regular
                // When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.
                if isCenterAligned {
                    self.makeRegularCenterView(context)
                } else {
                    self.makeRegularGeneralView(context)
                }
            }
        }
        .contentShape(Rectangle())
        .padding(EdgeInsets(top: 14, leading: 0, bottom: 14, trailing: 0))
    }
}

extension NewObjectItemBaseStyle {
    struct Context {
        let configuration: NewObjectItemConfiguration
        let shouldShowAvatar: Bool
        let avatarView: any View
    }
}

extension NewObjectItemBaseStyle {
    func makeOneLineSingleActionView(_ context: Context) -> some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            if !context.configuration.icons.isEmpty {
                // only one icon is allowed to be displayed
                context.configuration.icons
                    .environment(\.numberOfLines, 1)
                    .offset(x: -22, y: 0)
            }
            
            HStack {
                if horizontalSizeClass == .compact || splitPercent == nil {
                    HStack(alignment: .center, spacing: 0) {
                        if !context.shouldShowAvatar {
                            context.avatarView.clipped().typeErased
                            Spacer().frame(width: 12)
                        }
                        context.configuration.title.lineLimit(1)
                        Spacer(minLength: 16)
                    }
                } else {
                    HStack(alignment: .center, spacing: 0) {
                        HStack(alignment: .center) {
                            if !context.shouldShowAvatar {
                                context.avatarView.clipped().typeErased
                                Spacer().frame(width: 12)
                            }
                            
                            context.configuration.title.lineLimit(1)
                            
                            Spacer(minLength: 16)
                        }
                        .frame(width: self.doesShowDescription(context) ? self.mainViewSize.width * splitPercent! : self.mainViewSize.width)
                        
                        HStack(alignment: .center) {
                            if !context.configuration.description.isEmpty {
                                Spacer().frame(width: 8)
                            }
                            
                            context.configuration.description.lineLimit(1)
                            
                            Spacer(minLength: 24)
                        }
                        .frame(width: self.doesShowDescription(context) ? self.mainViewSize.width * (1 - splitPercent!) : 0)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .background(GeometrySizeView(size: $mainViewSize))
                }
                
                NewAction(.init(actionTitle: context.configuration.actionTitle, action: context.configuration.action))
            }
        }
    }
    
    func makeRegularSingleActionView(_ context: Context) -> some View {
        ZStack(alignment: .topLeading) {
            if !context.configuration.icons.isEmpty {
                context.configuration.icons
                    .environment(\.numberOfLines, numberOfLinesAllowedToShow(context))
                    .offset(x: -22, y: 0)
            }
            
            if horizontalSizeClass == .some(.compact) || splitPercent == nil {
                HStack(alignment: .center) {
                    HStack(alignment: .top) {
                        if context.shouldShowAvatar {
                            context.avatarView.clipped().typeErased
                            Spacer().frame(width: 12)
                        }
                        
                        VStack(alignment: .leading, spacing: 3) {
                            context.configuration.title.lineLimit(2)
                            context.configuration.subtitle
                            context.configuration.footnote
                            context.configuration.tags
//                            footnoteIcons
                        }
                        
                        Spacer(minLength: 16)
                    }
                    
                    NewAction(.init(actionTitle: context.configuration.actionTitle, action: context.configuration.action))
                }
            } else {
                HStack(alignment: .center) {
                    HStack(alignment: .iconStackAlignmentGuide) {
                        HStack(alignment: .top) {
                            if context.shouldShowAvatar {
                                context.avatarView
                                    .clipped()
                                    .anchorPreference(key: MyViewPreferenceKey.self, value: .bounds, transform: {
                                        [MyViewPreferenceData(element: .detailImage, bounds: $0)]
                                    })
                                    .hidden()
                                    .typeErased

                                Spacer().frame(width: 12)
                            }
                            
                            VStack(alignment: .leading, spacing: 3) {
                                context.configuration.title.lineLimit(2)
                                    .alignmentGuide(.iconStackAlignmentGuide) { dimension in
                                        dimension[.firstTextBaseline]
                                    }
                                context.configuration.subtitle
                                context.configuration.footnote
                                context.configuration.tags
//                                footnoteIcons
                            }
                            
                            Spacer(minLength: 16)
                        }
                        .frame(width: self.doesShowDescription(context) ? self.mainViewSize.width * splitPercent! : self.mainViewSize.width)
                        
                        HStack(alignment: .top) {
                            if !context.configuration.description.isEmpty {
                                Spacer().frame(width: 8)
                            }
                            
                            context.configuration.description
                                .lineLimit(numberOfLinesAllowedToShow(context))
                                .alignmentGuide(.iconStackAlignmentGuide) { dimension in
                                    dimension[.firstTextBaseline]
                                }
                            
                            Spacer(minLength: 24)
                        }
                        .frame(width: self.doesShowDescription(context) ? self.mainViewSize.width * (1 - splitPercent!) : 0)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .background(GeometrySizeView(size: $mainViewSize))
                    .overlayPreferenceValue(MyViewPreferenceKey.self) { preferences in
                        GeometryReader { geometry in
                            self.repositionDetailImageAndStatus(geometry, preferences: preferences, showStatus: false, context: context) // reposition the detail image and status to top(geometry, preferences)
                        }
                    }
                    
                    NewAction(.init(actionTitle: context.configuration.actionTitle, action: context.configuration.action))
                }
            }
        }
    }
    
    func makeCompactOneLineView(_ context: Context) -> some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            if !context.configuration.icons.isEmpty {
                // only one icon is allowed to be displayed
                context.configuration.icons
                    .environment(\.numberOfLines, 1)
                    .offset(x: -22, y: 0)
            }
            
            HStack {
                if context.shouldShowAvatar {
                    context.avatarView.clipped().typeErased
                    Spacer().frame(width: 12)
                }
                
                context.configuration.title.lineLimit(1)
                
                Spacer(minLength: 8)
                
                context.configuration.status
            }
        }
    }
    
    func makeCompactOneStatusView(_ context: Context) -> some View {
        ZStack(alignment: .topLeading) {
            if !context.configuration.icons.isEmpty {
                context.configuration.icons
                    .environment(\.numberOfLines, numberOfLinesAllowedToShow(context))
                    .offset(x: -22, y: 0)
            }
            
            HStack(alignment: .top) {
                if context.shouldShowAvatar {
                    context.avatarView.clipped().typeErased
                    Spacer().frame(width: 12)
                }
                
                VStack(spacing: 3) {
                    HStack(alignment: .top) {
                        context.configuration.title.lineLimit(1)
                        Spacer(minLength: 8)
                        context.configuration.status
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 3) {
                            context.configuration.subtitle
                            context.configuration.footnote
                            context.configuration.tags
//                            footnoteIcons
                        }
                        Spacer(minLength: 0)
                    }
                }
            }
        }
    }
    
    func makeCompactGeneralView(_ context: Context) -> some View {
        ZStack(alignment: .topLeading) {
            if !context.configuration.icons.isEmpty {
                context.configuration.icons
                    .environment(\.numberOfLines, numberOfLinesAllowedToShow(context))
                    .offset(x: -22, y: 0)
            }
            
            HStack(alignment: .top) {
                if context.shouldShowAvatar {
                    context.avatarView.clipped().typeErased
                    Spacer().frame(width: 12)
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    context.configuration.title.lineLimit(2)
                    context.configuration.subtitle
                    context.configuration.footnote
                    context.configuration.tags
//                    footnoteIcons
                }
                
                Spacer(minLength: 8)
                
                VStack(alignment: .trailing, spacing: 4) {
                    context.configuration.status
                    context.configuration.substatus
                }
            }
        }
    }
    
    func makeRegularCenterView(_ context: Context) -> some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            if !context.configuration.icons.isEmpty {
                // only one icon is allowed to be displayed
                context.configuration.icons
                    .environment(\.numberOfLines, 1)
                    .offset(x: -22, y: 0)
            }
            
            HStack(alignment: .center, spacing: 0) {
                HStack(alignment: .center) {
                    if context.shouldShowAvatar {
                        context.avatarView.clipped().typeErased
                        Spacer().frame(width: 12)
                    }
                    
                    context.configuration.title.lineLimit(1)
                    Spacer(minLength: 16)
                }
                .frame(width: self.doesShowDescriptionOrStatus(context) ? self.mainViewSize.width * splitPercent! : self.mainViewSize.width)
                
                HStack(alignment: .center) {
                    if !context.configuration.description.isEmpty {
                        Spacer().frame(width: 8)
                    }
                    
                    context.configuration.description.lineLimit(1)
                    
                    Spacer(minLength: 24)
                    
                    context.configuration.status
                }
                .frame(width: self.doesShowDescriptionOrStatus(context) ? self.mainViewSize.width * (1 - splitPercent!) : 0)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(GeometrySizeView(size: $mainViewSize))
        }
    }
    
    func makeRegularGeneralView(_ context: Context) -> some View {
        ZStack(alignment: .topLeading) {
            if !context.configuration.icons.isEmpty {
                context.configuration.icons
                    .environment(\.numberOfLines, numberOfLinesAllowedToShow(context))
                    .offset(x: -22, y: 0)
            }
            
            HStack(alignment: .iconStackAlignmentGuide) {
                HStack(alignment: .top) {
                    if context.shouldShowAvatar {
                        context.avatarView
                            .clipped()
                            .anchorPreference(key: MyViewPreferenceKey.self, value: .bounds, transform: {
                                [MyViewPreferenceData(element: .detailImage, bounds: $0)]
                            })
                            .hidden()
                            .typeErased

                        Spacer().frame(width: 12)
                    }
                    
                    VStack(alignment: .leading, spacing: 3) {
                        context.configuration.title.lineLimit(2)
                            .alignmentGuide(.iconStackAlignmentGuide) { dimension in
                                dimension[.firstTextBaseline]
                            }
                        context.configuration.subtitle
                        context.configuration.footnote
                        context.configuration.tags
//                        footnoteIcons
                    }
                    Spacer(minLength: 16)
                }
                .frame(width: self.doesShowDescriptionOrStatus(context) ? self.mainViewSize.width * splitPercent! : self.mainViewSize.width)
                
                HStack(alignment: .top) {
                    if !context.configuration.description.isEmpty {
                        Spacer().frame(width: 8)
                    }
                    
                    context.configuration.description.lineLimit(numberOfLinesAllowedToShow(context))
                        .alignmentGuide(.iconStackAlignmentGuide) { dimension in
                            dimension[.firstTextBaseline]
                        }
                    
                    Spacer(minLength: 24)
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        context.configuration.status
                        context.configuration.substatus
                    }
                    .anchorPreference(key: MyViewPreferenceKey.self, value: .bounds, transform: {
                        [MyViewPreferenceData(element: .status, bounds: $0)]
                    })
                    .hidden()
                }
                .frame(width: self.doesShowDescriptionOrStatus(context) ? self.mainViewSize.width * (1 - splitPercent!) : 0)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(GeometrySizeView(size: $mainViewSize))
            .overlayPreferenceValue(MyViewPreferenceKey.self) { preferences in
                GeometryReader { geometry in
                    self.repositionDetailImageAndStatus(geometry, preferences: preferences, context: context) // reposition the detail image and status to top
                }
            }
        }
    }
    
    func doesShowDescriptionOrStatus(_ context: Context) -> Bool {
        if !context.configuration.status.isEmpty {
            return true
        }
        
        /// show description in regular mode
        if context.configuration.description.isEmpty {
            return false
        }
        
        var showDescription = true
        if #available(iOS 14.0, *) {
            if dynamicTypeSize >= .xLarge {
                showDescription = false
            }
        }
        
        return showDescription
    }
    
    func repositionDetailImageAndStatus(_ geometry: GeometryProxy, preferences: [MyViewPreferenceData], showStatus: Bool = true, context: Context) -> some View {
        let pDetail = preferences.first(where: { $0.element == .detailImage })
        let pStatus = preferences.first(where: { $0.element == .status })
        
        let boundDetail = pDetail != nil ? geometry[pDetail!.bounds] : .zero
        let boundStatus = pStatus != nil ? geometry[pStatus!.bounds] : .zero
//        let globalFrame = geometry.frame(in: .global)
//        print("global frame is \(globalFrame)")
        
        return ZStack {
            context.avatarView
                .clipped()
                .position(x: (boundDetail.minX + boundDetail.maxX) / 2, y: boundDetail.size.height / 2)
                .typeErased
            
            if showStatus {
                VStack(alignment: .trailing, spacing: 4) {
                    context.configuration.status
                    context.configuration.substatus
                }
                .position(x: (boundStatus.minX + boundStatus.maxX) / 2, y: boundStatus.size.height / 2)
            }
        }
    }
    
    func doesShowDescription(_ context: Context) -> Bool {
        /// show description in regular mode
        if context.configuration.description.isEmpty {
            return false
        }
        
        var showDescription = true
        if #available(iOS 14.0, *) {
            if dynamicTypeSize >= DynamicTypeSize.xLarge {
                showDescription = false
            }
        }
        
        return showDescription
    }
    
    func numberOfLinesAllowedToShow(_ context: Context) -> Int {
        if context.configuration.subtitle.isEmpty && context.configuration.footnote.isEmpty {
            return 1
        } else if context.configuration.subtitle.isEmpty || context.configuration.footnote.isEmpty {
            return 2
        } else {
            return 3
        }
    }
}

/// Define default fiori styles for each sub-component in DemoView
extension NewObjectItemFioriStyle {
    struct TitleFioriStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
        }
    }
    
    struct SubTitleFioriStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .lineLimit(1)
        }
    }
    
    struct FootnoteFioriStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .lineLimit(1)
        }
    }
    
    struct DescriptionFioriStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
        }
    }
    
    struct StatusFioriStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .lineLimit(1)
        }
    }
    
    struct SubstatusFioriStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .lineLimit(1)
        }
    }
    
    struct DetailImageFioriStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .clipped()
        }
    }
    
    struct ActionTitleFioriStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .lineLimit(2)
        }
    }
    
    // ...
}

/// Card style
public struct NewObjectItemCardStyle: NewObjectItemStyle {
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(.secondary)
            }
    }
}

public extension NewObjectItemStyle where Self == NewObjectItemCardStyle {
    static var card: Self {
        NewObjectItemCardStyle()
    }
}

public struct NewObjectItemBorderedActionTitle: ActionTitleStyle {
    public init() {}
    
    public func makeBody(_ configuration: ActionTitleConfiguration) -> some View {
        configuration.actionTitle
            .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.preferredColor(.tintColor), lineWidth: 1))
    }
}

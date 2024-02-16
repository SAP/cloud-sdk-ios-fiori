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
public struct ObjectItemBaseStyle: ObjectItemStyle {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.splitPercent) var splitPercent
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @State var mainViewSize: CGSize = .zero
    
    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        var shouldShowAvatar: Bool {
            !configuration.avatars.isEmpty || !configuration.detailImage.isEmpty
        }
        
        @ViewBuilder
        var avatarView: some View {
            if !configuration.avatars.isEmpty {
                configuration.avatars
            } else if !configuration.detailImage.isEmpty {
                configuration.detailImage
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
            if !configuration.action.isEmpty {
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
    }
}

extension ObjectItemBaseStyle {
    struct Context {
        let configuration: ObjectItemConfiguration
        let shouldShowAvatar: Bool
        let avatarView: any View
    }
}

extension ObjectItemBaseStyle {
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
                            context.avatarView.typeErased
                            Spacer().frame(width: 12)
                        }
                        context.configuration.title.lineLimit(1)
                        Spacer(minLength: 16)
                    }
                } else {
                    HStack(alignment: .center, spacing: 0) {
                        HStack(alignment: .center) {
                            if !context.shouldShowAvatar {
                                context.avatarView.typeErased
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
                
                context.configuration.action
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
                            context.avatarView.typeErased
                            Spacer().frame(width: 12)
                        }
                        
                        VStack(alignment: .leading, spacing: 3) {
                            context.configuration.title.lineLimit(2)
                            context.configuration.subtitle
                            context.configuration.footnote
                            context.configuration.tags
                            context.configuration.footnoteIcons
                        }
                        
                        Spacer(minLength: 16)
                    }
                    
                    context.configuration.action
                }
            } else {
                HStack(alignment: .center) {
                    HStack(alignment: .iconStackAlignmentGuide) {
                        HStack(alignment: .top) {
                            if context.shouldShowAvatar {
                                context.avatarView
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
                                context.configuration.footnoteIcons
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
                    
                    context.configuration.action
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
                    context.avatarView.typeErased
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
                    context.avatarView.typeErased
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
                            context.configuration.footnoteIcons
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
                    context.avatarView.typeErased
                    Spacer().frame(width: 12)
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    context.configuration.title.lineLimit(2)
                    context.configuration.subtitle
                    context.configuration.footnote
                    context.configuration.tags
                    context.configuration.footnoteIcons
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
                        context.avatarView.typeErased
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
                        context.configuration.footnoteIcons
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

// Default fiori styles
extension ObjectItemFioriStyle {
    struct ContentFioriStyle: ObjectItemStyle {
        func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
            ObjectItem(configuration)
                // Add default style for its content
                .padding(EdgeInsets(top: 14, leading: 0, bottom: 14, trailing: 0))
                .contentShape(Rectangle())
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
            // Add default style here
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                // Add default style here
                .lineLimit(1)
        }
    }

    struct FootnoteFioriStyle: FootnoteStyle {
        func makeBody(_ configuration: FootnoteConfiguration) -> some View {
            Footnote(configuration)
                // Add default style here
                .lineLimit(1)
        }
    }

    struct DescriptionFioriStyle: DescriptionStyle {
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
            // Add default style here
        }
    }

    struct StatusFioriStyle: StatusStyle {
        func makeBody(_ configuration: StatusConfiguration) -> some View {
            Status(configuration)
                // Add default style here
                .lineLimit(1)
        }
    }

    struct SubstatusFioriStyle: SubstatusStyle {
        func makeBody(_ configuration: SubstatusConfiguration) -> some View {
            Substatus(configuration)
                // Add default style here
                .lineLimit(1)
        }
    }

    struct DetailImageFioriStyle: DetailImageStyle {
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
                // Add default style here
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .clipped()
        }
    }

    struct IconsFioriStyle: IconsStyle {
        func makeBody(_ configuration: IconsConfiguration) -> some View {
            Icons(configuration)
            // Add default style here
        }
    }

    struct AvatarsFioriStyle: AvatarsStyle {
        func makeBody(_ configuration: AvatarsConfiguration) -> some View {
            Avatars(configuration)
                // Add default style here
                .clipped()
        }
    }

    struct FootnoteIconsFioriStyle: FootnoteIconsStyle {
        func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
            FootnoteIcons(configuration)
            // Add default style here
        }
    }

    struct TagsFioriStyle: TagsStyle {
        func makeBody(_ configuration: TagsConfiguration) -> some View {
            Tags(configuration)
            // Add default style here
        }
    }

    struct ActionFioriStyle: ActionStyle {
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
                // Add default style here
                .fioriButtonStyle(FioriPlainButtonStyle())
                .lineLimit(2)
        }
    }
}

/// Card style
public struct ObjectItemCardStyle: ObjectItemStyle {
    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(.secondary)
            }
    }
}

public extension ObjectItemStyle where Self == ObjectItemCardStyle {
    static var card: Self {
        ObjectItemCardStyle()
    }
}

public struct ObjectItemBorderedAction: ActionStyle {
    public init() {}
    
    public func makeBody(_ configuration: ActionConfiguration) -> some View {
        configuration.action
            .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.preferredColor(.tintColor), lineWidth: 1))
            .lineLimit(2)
    }
}

#Preview(body: {
    List {
        ObjectItem(title: {
            Text("Title")
        }, subtitle: {
            Text("Subtitle")
        }, footnote: {
            Text("Footnote")
        }, description: {
            Text("Description")
        }, status: {
            Text("Status")
        }, substatus: {
            Text("Substatus")
        }, detailImage: {
            Image(systemName: "person.circle").resizable().frame(width: 45, height: 45)
        }, icons: {
            Text("1")
            Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
            Image(systemName: "paperclip").font(.system(size: 14))
        })
            .titleStyle { config in
                config.title
                    .foregroundStyle(.blue) // take effect
            }
    }
})

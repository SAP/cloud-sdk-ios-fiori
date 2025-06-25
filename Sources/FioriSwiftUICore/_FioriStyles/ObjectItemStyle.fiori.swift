import FioriThemeManager
import Foundation
import SwiftUI

// swiftlint:disable file_length

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
    @Environment(\.footnoteIconsTextPosition) var footnoteIconsTextPosition

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
        
        var isCompact: Bool {
            self.horizontalSizeClass == nil || self.horizontalSizeClass == .some(.compact)
        }
        
        var isCenterAligned: Bool {
            configuration.subtitle.isEmpty && configuration.footnote.isEmpty && configuration.tags.isEmpty && (configuration.description.isEmpty || !isCompact || !configuration.showsDescriptionInCompact)
        }
        
        let context = Context(configuration: configuration, shouldShowAvatar: shouldShowAvatar, avatarView: avatarView)
        
        return Group {
            if !configuration.action.isEmpty {
                // When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.
                if isCenterAligned {
                    self.makeOneLineSingleActionView(context)
                } else {
                    self.makeRegularSingleActionView(context)
                }
            } else if isCompact || self.splitPercent == nil {
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
                if self.horizontalSizeClass == .compact || self.splitPercent == nil {
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
                        .frame(width: self.doesShowDescription(context) ? self.mainViewSize.width * self.splitPercent! : self.mainViewSize.width)
                        
                        HStack(alignment: .center) {
                            if !context.configuration.description.isEmpty {
                                Spacer().frame(width: 8)
                            }
                            
                            context.configuration.description.lineLimit(1)
                            
                            Spacer(minLength: 24)
                        }
                        .frame(width: self.doesShowDescription(context) ? self.mainViewSize.width * (1 - self.splitPercent!) : 0)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .background(GeometrySizeView(size: self.$mainViewSize))
                }
                
                context.configuration.action
            }
        }
    }
    
    func makeRegularSingleActionView(_ context: Context) -> some View {
        ZStack(alignment: .topLeading) {
            if !context.configuration.icons.isEmpty {
                context.configuration.icons
                    .environment(\.numberOfLines, self.numberOfLinesAllowedToShow(context))
                    .offset(x: -22, y: 0)
            }
            
            if self.horizontalSizeClass == .some(.compact) || self.splitPercent == nil {
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
                            self.footnoteIconsView(context)
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
                                self.footnoteIconsView(context)
                            }
                            
                            Spacer(minLength: 16)
                        }
                        .frame(width: self.doesShowDescription(context) ? self.mainViewSize.width * self.splitPercent! : self.mainViewSize.width)
                        
                        HStack(alignment: .top) {
                            if !context.configuration.description.isEmpty {
                                Spacer().frame(width: 8)
                            }
                            
                            context.configuration.description
                                .lineLimit(self.numberOfLinesAllowedToShow(context))
                                .alignmentGuide(.iconStackAlignmentGuide) { dimension in
                                    dimension[.firstTextBaseline]
                                }
                            
                            Spacer(minLength: 24)
                        }
                        .frame(width: self.doesShowDescription(context) ? self.mainViewSize.width * (1 - self.splitPercent!) : 0)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .background(GeometrySizeView(size: self.$mainViewSize))
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
                    .environment(\.numberOfLines, self.numberOfLinesAllowedToShow(context))
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
                        
                        if context.configuration.objectItemButton.isEmpty {
                            context.configuration.status
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 3) {
                            context.configuration.subtitle
                            context.configuration.footnote
                            context.configuration.tags
                            self.footnoteIconsView(context)
                            if context.configuration.showsDescriptionInCompact {
                                context.configuration.description
                            }
                        }
                        Spacer(minLength: 0)
                    }
                }
                
                if !context.configuration.objectItemButton.isEmpty {
                    Spacer(minLength: 8)
                    VStack(alignment: .trailing, spacing: 4) {
                        context.configuration.status
                        context.configuration.objectItemButton
                    }
                }
            }
        }
    }
    
    func makeCompactGeneralView(_ context: Context) -> some View {
        ZStack(alignment: .topLeading) {
            if !context.configuration.icons.isEmpty {
                context.configuration.icons
                    .environment(\.numberOfLines, self.numberOfLinesAllowedToShow(context))
                    .offset(x: -22, y: 0)
            }
            
            HStack(alignment: .top) {
                if context.shouldShowAvatar {
                    context.avatarView.typeErased
                    Spacer().frame(width: 12)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    VStack(alignment: .leading, spacing: 3) {
                        context.configuration.title.lineLimit(2)
                        context.configuration.subtitle
                        context.configuration.footnote
                        context.configuration.tags
                        self.footnoteIconsView(context)
                    }
                    
                    if context.configuration.showsDescriptionInCompact {
                        context.configuration.description
                    }
                }
                
                Spacer(minLength: 8)
                
                VStack(alignment: .trailing, spacing: 4) {
                    context.configuration.status
                    context.configuration.substatus
                    context.configuration.objectItemButton
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
                .frame(width: self.doesShowDescriptionOrStatus(context) ? self.mainViewSize.width * self.splitPercent! : self.mainViewSize.width)
                
                HStack(alignment: .center) {
                    if !context.configuration.description.isEmpty {
                        Spacer().frame(width: 8)
                    }
                    
                    context.configuration.description.lineLimit(1)
                    
                    Spacer(minLength: 24)
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        context.configuration.status
                        context.configuration.objectItemButton
                    }
                }
                .frame(width: self.doesShowDescriptionOrStatus(context) ? self.mainViewSize.width * (1 - self.splitPercent!) : 0)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(GeometrySizeView(size: self.$mainViewSize))
        }
    }
    
    func makeRegularGeneralView(_ context: Context) -> some View {
        ZStack(alignment: .topLeading) {
            if !context.configuration.icons.isEmpty {
                context.configuration.icons
                    .environment(\.numberOfLines, self.numberOfLinesAllowedToShow(context))
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
                        self.footnoteIconsView(context)
                    }
                    Spacer(minLength: 16)
                }
                .frame(width: self.doesShowDescriptionOrStatus(context) ? self.mainViewSize.width * self.splitPercent! : self.mainViewSize.width)
                
                HStack(alignment: .top) {
                    if !context.configuration.description.isEmpty {
                        Spacer().frame(width: 8)
                    }
                    
                    context.configuration.description.lineLimit(self.numberOfLinesAllowedToShow(context))
                        .alignmentGuide(.iconStackAlignmentGuide) { dimension in
                            dimension[.firstTextBaseline]
                        }
                    
                    Spacer(minLength: 24)
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        context.configuration.status
                        context.configuration.substatus
                        context.configuration.objectItemButton
                    }
                    .anchorPreference(key: MyViewPreferenceKey.self, value: .bounds, transform: {
                        [MyViewPreferenceData(element: .status, bounds: $0)]
                    })
                    .hidden()
                }
                .frame(width: self.doesShowDescriptionOrStatus(context) ? self.mainViewSize.width * (1 - self.splitPercent!) : 0)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(GeometrySizeView(size: self.$mainViewSize))
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
                    context.configuration.objectItemButton
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
    
    @ViewBuilder
    func footnoteIconsView(_ context: Context) -> some View {
        if !context.configuration.footnoteIcons.isEmpty || !context.configuration.footnoteIconsText.isEmpty {
            AvatarsAndTextLayout(textPosition: self.footnoteIconsTextPosition) {
                context.configuration.footnoteIconsText
                context.configuration.footnoteIcons
            }
        } else {
            EmptyView()
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
        let objectItemConfiguration: ObjectItemConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .headline, weight: .semibold))
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        let objectItemConfiguration: ObjectItemConfiguration
        
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .foregroundStyle(Color.preferredColor(.secondaryLabel))
                .lineLimit(1)
        }
    }

    struct FootnoteFioriStyle: FootnoteStyle {
        let objectItemConfiguration: ObjectItemConfiguration
        
        func makeBody(_ configuration: FootnoteConfiguration) -> some View {
            Footnote(configuration)
                // Add default style here
                .lineLimit(1)
        }
    }

    struct DescriptionFioriStyle: DescriptionStyle {
        let objectItemConfiguration: ObjectItemConfiguration
        
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
            // Add default style here
        }
    }

    struct StatusFioriStyle: StatusStyle {
        let objectItemConfiguration: ObjectItemConfiguration
        
        func makeBody(_ configuration: StatusConfiguration) -> some View {
            Status(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .lineLimit(1)
        }
    }

    struct SubstatusFioriStyle: SubstatusStyle {
        let objectItemConfiguration: ObjectItemConfiguration
        
        func makeBody(_ configuration: SubstatusConfiguration) -> some View {
            Substatus(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .lineLimit(1)
        }
    }

    struct DetailImageFioriStyle: DetailImageStyle {
        let objectItemConfiguration: ObjectItemConfiguration
        
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
                // Add default style here
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .clipped()
        }
    }

    struct IconsFioriStyle: IconsStyle {
        let objectItemConfiguration: ObjectItemConfiguration
        
        func makeBody(_ configuration: IconsConfiguration) -> some View {
            Icons(configuration)
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
        }
    }

    struct AvatarsFioriStyle: AvatarsStyle {
        let objectItemConfiguration: ObjectItemConfiguration
        
        func makeBody(_ configuration: AvatarsConfiguration) -> some View {
            Avatars(configuration)
                // Add default style here
                .clipped()
        }
    }

    struct FootnoteIconsFioriStyle: FootnoteIconsStyle {
        let objectItemConfiguration: ObjectItemConfiguration
        
        func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
            FootnoteIcons(configuration)
            // Add default style here
        }
    }
    
    struct FootnoteIconsTextFioriStyle: FootnoteIconsTextStyle {
        let objectItemConfiguration: ObjectItemConfiguration

        func makeBody(_ configuration: FootnoteIconsTextConfiguration) -> some View {
            FootnoteIconsText(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundStyle(Color.preferredColor(.secondaryLabel))
                .lineLimit(1)
        }
    }

    struct TagsFioriStyle: TagsStyle {
        let objectItemConfiguration: ObjectItemConfiguration
        
        func makeBody(_ configuration: TagsConfiguration) -> some View {
            Tags(configuration)
            // Add default style here
        }
    }

    struct ActionFioriStyle: ActionStyle {
        let objectItemConfiguration: ObjectItemConfiguration
        
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

#Preview {
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
        }, footnoteIcons: {
            Color.red
            Color.green
            Color.blue
            Color.red
            Color.green
            Color.blue
            Color.red
            Color.green
            Color.blue
        }, footnoteIconsText: {
            Text("Footnote icons text.")
        })
        .titleStyle { config in
            config.title
                .foregroundStyle(.blue) // take effect
        }
        .padding([.leading, .trailing], 8)
    }
}

#Preview("With Action") {
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
        }, footnoteIcons: {
            Color.red
            Color.green
            Color.blue
            Color.red
            Color.green
            Color.blue
            Color.red
            Color.green
            Color.blue
        }, footnoteIconsText: {
            Text("Footnote icons text.")
        }, action: {
            FioriButton(title: "Action")
        })
    }
}

struct AvatarsAndTextLayout: Layout {
    let textPosition: AvatarStack.TextPosition
    let margin = NSDirectionalEdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0)
    let textAndIconsSpacing: CGFloat = 6
    let textMinimumWidth: CGFloat = 60
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) -> CGSize {
        guard let containerWidth = proposal.width, containerWidth > 0 else {
            return .zero
        }
        if subviews.count == 2,
           let textView = subviews.first,
           let iconsView = subviews.last,
           textView.sizeThatFits(.infinity) != .zero,
           iconsView.sizeThatFits(.infinity) != .zero
        {
            switch self.textPosition {
            case .top, .bottom:
                let availableWidth = containerWidth - self.margin.leading - self.margin.trailing
                let textViewSize = textView.sizeThatFits(ProposedViewSize(width: availableWidth,
                                                                          height: .infinity))
                let iconsSize = iconsView.sizeThatFits(ProposedViewSize(width: availableWidth,
                                                                        height: .infinity))
                let maxHeight = textViewSize.height + iconsSize.height + self.textAndIconsSpacing + self.margin.top + self.margin.bottom
                return CGSize(width: containerWidth,
                              height: maxHeight)
            case .leading, .trailing:
                let textActualSize = textView.sizeThatFits(.unspecified)
                let iconsAvailableWidth = containerWidth - min(textActualSize.width, self.textMinimumWidth) - self.margin.leading - self.margin.trailing
                let iconsSize = iconsView.sizeThatFits(ProposedViewSize(width: iconsAvailableWidth,
                                                                        height: .infinity))
                let textWidth = containerWidth - iconsSize.width - self.margin.leading - self.margin.trailing - self.textAndIconsSpacing
                let textSize = textView.sizeThatFits(ProposedViewSize(width: textWidth, height: .infinity))
                let maxHeight = max(iconsSize.height, textSize.height) + self.margin.top + self.margin.bottom
                let size = CGSize(width: containerWidth, height: maxHeight)
                return size
            }
        } else if subviews.count == 1 {
            var maxHeight: CGFloat = 0
            let contentWidth = containerWidth - self.margin.leading - self.margin.trailing
            for subview in subviews {
                let height = subview.sizeThatFits(ProposedViewSize(width: contentWidth, height: .infinity)).height
                maxHeight = max(maxHeight, height)
            }
            return CGSize(width: containerWidth, height: maxHeight + self.margin.top + self.margin.bottom)
        } else {
            return .zero
        }
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) {
        guard let containerWidth = proposal.width, containerWidth > 0 else {
            return
        }
        if subviews.count == 2,
           let textView = subviews.first,
           let iconsView = subviews.last,
           textView.sizeThatFits(.infinity) != .zero,
           iconsView.sizeThatFits(.infinity) != .zero
        {
            switch self.textPosition {
            case .top:
                textView.place(at: bounds.origin, proposal: .unspecified)
                let nextOrigin = CGPoint(x: bounds.minX,
                                         y: bounds.minY + textView.sizeThatFits(.unspecified).height + self.textAndIconsSpacing)
                iconsView.place(at: nextOrigin, proposal: .unspecified)
            case .bottom:
                iconsView.place(at: bounds.origin, proposal: .unspecified)
                let nextOrigin = CGPoint(x: bounds.minX,
                                         y: bounds.minY + iconsView.sizeThatFits(.unspecified).height + self.textAndIconsSpacing)
                textView.place(at: nextOrigin, proposal: .unspecified)
            case .leading:
                let textActualSize = textView.sizeThatFits(.unspecified)
                let iconsAvailableWidth = containerWidth - min(textActualSize.width, self.textMinimumWidth) - self.textAndIconsSpacing - self.margin.leading - self.margin.trailing
                let iconsSize = iconsView.sizeThatFits(ProposedViewSize(width: iconsAvailableWidth, height: .infinity))
                let textMaxWidth = containerWidth - iconsSize.width - self.textAndIconsSpacing - self.margin.leading - self.margin.trailing
                let textSize: CGSize
                if textActualSize.width < textMaxWidth {
                    textSize = textActualSize
                } else {
                    textSize = textView.sizeThatFits(ProposedViewSize(CGSize(width: textMaxWidth, height: .infinity)))
                }
                let maxHeight = max(textSize.height, iconsSize.height)
                let iconsY = bounds.minY + (maxHeight - iconsSize.height) / 2 + self.margin.top
                let textY = bounds.minY + (maxHeight - textSize.height) / 2 + self.margin.top
                
                textView.place(at: CGPoint(x: bounds.minX + self.margin.leading, y: textY), proposal: ProposedViewSize(textSize))
                let iconsX = bounds.origin.x + textSize.width + self.textAndIconsSpacing + self.margin.leading
                iconsView.place(at: CGPoint(x: iconsX, y: iconsY),
                                proposal: ProposedViewSize(iconsSize))
            case .trailing:
                let textActualSize = textView.sizeThatFits(.unspecified)
                let iconsAvailableWidth = containerWidth - min(textActualSize.width, self.textMinimumWidth) - self.textAndIconsSpacing - self.margin.leading - self.margin.trailing
                let iconsSize = iconsView.sizeThatFits(ProposedViewSize(width: iconsAvailableWidth, height: .infinity))
                let textMaxWidth = containerWidth - iconsSize.width - self.textAndIconsSpacing - self.margin.leading - self.margin.trailing
                
                let textX = bounds.minX + iconsSize.width + self.textAndIconsSpacing + self.margin.leading
                let textSize: CGSize
                if textActualSize.width < textMaxWidth {
                    textSize = textActualSize
                } else {
                    textSize = textView.sizeThatFits(ProposedViewSize(CGSize(width: textMaxWidth, height: .infinity)))
                }
                let maxHeight = max(textSize.height, iconsSize.height)
                let iconsY = bounds.minY + (maxHeight - iconsSize.height) / 2 + self.margin.top
                let textY = bounds.minY + (maxHeight - textSize.height) / 2 + self.margin.top
                iconsView.place(at: CGPoint(x: bounds.minX + self.margin.leading, y: iconsY),
                                proposal: ProposedViewSize(iconsSize))
                textView.place(at: CGPoint(x: textX, y: textY), proposal: ProposedViewSize(textSize))
            }
        } else {
            for subview in subviews {
                subview.place(at: CGPoint(x: bounds.origin.x + self.margin.leading,
                                          y: bounds.origin.y + self.margin.top),
                              proposal: ProposedViewSize(CGSize(width: containerWidth - self.margin.leading - self.margin.trailing, height: .infinity)))
            }
        }
    }
}

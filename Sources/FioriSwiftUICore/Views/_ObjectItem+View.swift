import FioriThemeManager
import SwiftUI

extension Fiori {
    enum _ObjectItem {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content.font(.fiori(forTextStyle: .headline))
                    .foregroundColor(.preferredColor(.primaryLabel))
            }
        }

        struct Subtitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .body))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .lineLimit(1)
            }
        }

        struct Footnote: ViewModifier {
            func body(content: Content) -> some View {
                content.font(.fiori(forTextStyle: .subheadline))
                    .foregroundColor(.preferredColor(.tertiaryLabel))
                    .lineLimit(1)
            }
        }

        struct DescriptionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .subheadline))
                    .foregroundColor(.preferredColor(.tertiaryLabel))
            }
        }

        struct Status: ViewModifier {
            func body(content: Content) -> some View {
                content.font(.fiori(forTextStyle: .subheadline))
                    .foregroundColor(.preferredColor(.tertiaryLabel)).lineLimit(1)
            }
        }

        struct Substatus: ViewModifier {
            func body(content: Content) -> some View {
                content.font(.fiori(forTextStyle: .subheadline))
                    .foregroundColor(.preferredColor(.tertiaryLabel)).lineLimit(1)
            }
        }

        struct DetailImage: ViewModifier {
            func body(content: Content) -> some View {
                content
//                    .frame(minWidth: 28, idealWidth: 45, maxWidth: 65, minHeight: 28, idealHeight: 45, maxHeight: 65, alignment: .topLeading)
                    .cornerRadius(4)
            }
        }
        
        struct Action: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .callout))
                    .lineLimit(2)
                    .foregroundColor(Color.preferredColor(.tintColor))
            }
        }
        
        struct ActionCumulative: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.preferredColor(.tintColor), lineWidth: 1))
                    .buttonStyle(PlainButtonStyle())
            }
        }
        
        struct Avatars: ViewModifier {
            func body(content: Content) -> some View {
                content
            }
        }
        
        struct FootnoteIcons: ViewModifier {
            func body(content: Content) -> some View {
                content
            }
        }
        
        struct Tags: ViewModifier {
            func body(content: Content) -> some View {
                content
            }
        }

        typealias TitleCumulative = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
        typealias FootnoteCumulative = EmptyModifier
        typealias DescriptionTextCumulative = EmptyModifier
        typealias StatusCumulative = EmptyModifier
        typealias SubstatusCumulative = EmptyModifier
        typealias DetailImageCumulative = EmptyModifier
        typealias IconsCumulative = EmptyModifier
        typealias AvatarsCumulative = EmptyModifier
        typealias FootnoteIconsCumulative = EmptyModifier
        typealias TagsCumulative = EmptyModifier

        typealias Icons = EmptyModifier
        static let title = Title()
        static let subtitle = Subtitle()
        static let footnote = Footnote()
        static let descriptionText = DescriptionText()
        static let status = Status()
        static let substatus = Substatus()
        static let detailImage = DetailImage()
        static let icons = Icons()
        static let action = Action()
        static let avatars = Avatars()
        static let footnoteIcons = FootnoteIcons()
        static let tags = Tags()
        
        static let titleCumulative = TitleCumulative()
        static let subtitleCumulative = SubtitleCumulative()
        static let footnoteCumulative = FootnoteCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()
        static let statusCumulative = StatusCumulative()
        static let substatusCumulative = SubstatusCumulative()
        static let detailImageCumulative = DetailImageCumulative()
        static let iconsCumulative = IconsCumulative()
        static let actionCumulative = ActionCumulative()
        static let avatarsCumulative = AvatarsCumulative()
        static let footnoteIconsCumulative = FootnoteIconsCumulative()
        static let tagsCumulative = TagsCumulative()
    }
}

extension _ObjectItem: View {
    var shouldShowAvatar: Bool {
        !isAvatarsEmptyView || !isDetailImageEmptyView
    }
    
    @ViewBuilder
    var avatarView: some View {
        if !isAvatarsEmptyView {
            avatars.clipped()
        } else if !isDetailImageEmptyView {
            detailImage.clipped()
        } else {
            EmptyView()
        }
    }
    
    var isCenterAligned: Bool {
        isSubtitleEmptyView && isFootnoteEmptyView && isTagsEmptyView && isFootnoteIconsEmptyView
    }
    
    public var body: some View {
        Group {
            if !isActionEmptyView {
                // When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.
                if self.isCenterAligned {
                    self.makeOneLineSingleActionView()
                } else {
                    self.makeRegularSingleActionView()
                }
            } else if horizontalSizeClass == nil || horizontalSizeClass == .some(.compact) || splitPercent == nil {
                // When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.
                if self.isCenterAligned {
                    self.makeCompactOneLineView()
                }
                // If only 1 status is being used with either a chevron or with no accessory view, the body and subhead labels in the main content area should extend to the full width of the cell below the status.
                // The headline must maintain the 8 px padding with the status.
                else if isSubstatusEmptyView {
                    self.makeCompactOneStatusView()
                } else {
                    self.makeCompactGeneralView()
                }
            } else { // horizontalSizeClass is Regular
                // When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.
                if self.isCenterAligned {
                    self.makeRegularCenterView()
                } else {
                    self.makeRegularGeneralView()
                }
            }
        }
        .contentShape(Rectangle())
        .padding(EdgeInsets(top: 14, leading: 0, bottom: 14, trailing: 0))
    }
    
    func makeOneLineSingleActionView() -> some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            if !isIconsEmptyView {
                // only one icon is allowed to be displayed
                icons
                    .environment(\.numberOfLines, 1)
                    .offset(x: -22, y: 0)
            }
            
            HStack {
                if horizontalSizeClass == .some(.compact) || splitPercent == nil {
                    HStack(alignment: .center, spacing: 0) {
                        if !self.shouldShowAvatar {
                            self.avatarView.clipped()
                            Spacer().frame(width: 12)
                        }
                        title.lineLimit(1)
                        Spacer(minLength: 16)
                    }
                } else {
                    HStack(alignment: .center, spacing: 0) {
                        HStack(alignment: .center) {
                            if !self.shouldShowAvatar {
                                self.avatarView.clipped()
                                Spacer().frame(width: 12)
                            }
                            
                            title.lineLimit(1)
                            
                            Spacer(minLength: 16)
                        }
                        .frame(width: self.doesShowDescription() ? self.mainViewSize.width * splitPercent! : self.mainViewSize.width)
                        
                        HStack(alignment: .center) {
                            if !isDescriptionTextEmptyView {
                                Spacer().frame(width: 8)
                            }
                            
                            descriptionText.lineLimit(1)
                            
                            Spacer(minLength: 24)
                        }
                        .frame(width: self.doesShowDescription() ? self.mainViewSize.width * (1 - splitPercent!) : 0)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .background(GeometrySizeView(size: $mainViewSize))
                }
                
                action
            }
        }
    }
    
    func makeRegularSingleActionView() -> some View {
        ZStack(alignment: .topLeading) {
            if !isIconsEmptyView {
                icons
                    .environment(\.numberOfLines, self.numberOfLinesAllowedToShow())
                    .offset(x: -22, y: 0)
            }
            
            if horizontalSizeClass == .some(.compact) || splitPercent == nil {
                HStack(alignment: .center) {
                    HStack(alignment: .top) {
                        if self.shouldShowAvatar {
                            self.avatarView.clipped()
                            Spacer().frame(width: 12)
                        }
                        
                        VStack(alignment: .leading, spacing: 3) {
                            title.lineLimit(2)
                            subtitle
                            footnote
                            tags
                            footnoteIcons
                        }
                        
                        Spacer(minLength: 16)
                    }
                    
                    action
                }
            } else {
                HStack(alignment: .center) {
                    HStack(alignment: .iconStackAlignmentGuide) {
                        HStack(alignment: .top) {
                            if self.shouldShowAvatar {
                                self.avatarView
                                    .clipped()
                                    .anchorPreference(key: MyViewPreferenceKey.self, value: .bounds, transform: {
                                        [MyViewPreferenceData(element: .detailImage, bounds: $0)]
                                    })
                                    .hidden()
                                
                                Spacer().frame(width: 12)
                            }
                            
                            VStack(alignment: .leading, spacing: 3) {
                                title.lineLimit(2)
                                    .alignmentGuide(.iconStackAlignmentGuide) { dimension in
                                        dimension[.firstTextBaseline]
                                    }
                                subtitle
                                footnote
                                tags
                                footnoteIcons
                            }
                            
                            Spacer(minLength: 16)
                        }
                        .frame(width: self.doesShowDescription() ? self.mainViewSize.width * splitPercent! : self.mainViewSize.width)
                        
                        HStack(alignment: .top) {
                            if !isDescriptionTextEmptyView {
                                Spacer().frame(width: 8)
                            }
                            
                            descriptionText
                                .lineLimit(self.numberOfLinesAllowedToShow())
                                .alignmentGuide(.iconStackAlignmentGuide) { dimension in
                                    dimension[.firstTextBaseline]
                                }
                            
                            Spacer(minLength: 24)
                        }
                        .frame(width: self.doesShowDescription() ? self.mainViewSize.width * (1 - splitPercent!) : 0)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .background(GeometrySizeView(size: $mainViewSize))
                    .overlayPreferenceValue(MyViewPreferenceKey.self) { preferences in
                        GeometryReader { geometry in
                            self.self.repositionDetailImageAndStatus(geometry, preferences: preferences, showStatus: false) // reposition the detail image and status to top(geometry, preferences)
                        }
                    }
                    
                    action
                }
            }
        }
    }
    
    // When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.
    func makeCompactOneLineView() -> some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            if !isIconsEmptyView {
                // only one icon is allowed to be displayed
                icons
                    .environment(\.numberOfLines, 1)
                    .offset(x: -22, y: 0)
            }
            
            HStack {
                if self.shouldShowAvatar {
                    self.avatarView.clipped()
                    Spacer().frame(width: 12)
                }
                
                title.lineLimit(1)
                
                Spacer(minLength: 8)
                
                status
            }
        }
    }
    
    // If only 1 status is being used with either a chevron or with no accessory view, the body and subhead labels in the main content area should extend to the full width of the cell below the status.
    // The headline must maintain the 8 px padding with the status.
    func makeCompactOneStatusView() -> some View {
        ZStack(alignment: .topLeading) {
            if !isIconsEmptyView {
                icons
                    .environment(\.numberOfLines, self.numberOfLinesAllowedToShow())
                    .offset(x: -22, y: 0)
            }
            
            HStack(alignment: .top) {
                if self.shouldShowAvatar {
                    self.avatarView.clipped()
                    Spacer().frame(width: 12)
                }
                
                VStack(spacing: 3) {
                    HStack(alignment: .top) {
                        title.lineLimit(1)
                        Spacer(minLength: 8)
                        status
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 3) {
                            subtitle
                            footnote
                            tags
                            footnoteIcons
                        }
                        Spacer(minLength: 0)
                    }
                }
            }
        }
    }
    
    func makeCompactGeneralView() -> some View {
        ZStack(alignment: .topLeading) {
            if !isIconsEmptyView {
                icons
                    .environment(\.numberOfLines, self.numberOfLinesAllowedToShow())
                    .offset(x: -22, y: 0)
            }
            
            HStack(alignment: .top) {
                if self.shouldShowAvatar {
                    self.avatarView.clipped()
                    Spacer().frame(width: 12)
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    title.lineLimit(2)
                    subtitle
                    footnote
                    tags
                    footnoteIcons
                }
                
                Spacer(minLength: 8)
                
                VStack(alignment: .trailing, spacing: 4) {
                    status
                    substatus
                }
            }
        }
    }
    
    // When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.
    func makeRegularCenterView() -> some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            if !isIconsEmptyView {
                // only one icon is allowed to be displayed
                icons
                    .environment(\.numberOfLines, 1)
                    .offset(x: -22, y: 0)
            }
            
            HStack(alignment: .center, spacing: 0) {
                HStack(alignment: .center) {
                    if self.shouldShowAvatar {
                        self.avatarView.clipped()
                        Spacer().frame(width: 12)
                    }
                    
                    title.lineLimit(1)
                    Spacer(minLength: 16)
                }
                .frame(width: self.doesShowDescriptionOrStatus() ? self.mainViewSize.width * splitPercent! : self.mainViewSize.width)
                
                HStack(alignment: .center) {
                    if !isDescriptionTextEmptyView {
                        Spacer().frame(width: 8)
                    }
                    
                    descriptionText.lineLimit(1)
                    
                    Spacer(minLength: 24)
                    
                    status
                }
                .frame(width: self.doesShowDescriptionOrStatus() ? self.mainViewSize.width * (1 - splitPercent!) : 0)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(GeometrySizeView(size: $mainViewSize))
        }
    }
    
    func makeRegularGeneralView() -> some View {
        ZStack(alignment: .topLeading) {
            if !isIconsEmptyView {
                icons
                    .environment(\.numberOfLines, self.numberOfLinesAllowedToShow())
                    .offset(x: -22, y: 0)
            }
            
            HStack(alignment: .iconStackAlignmentGuide) {
                HStack(alignment: .top) {
                    if self.shouldShowAvatar {
                        self.avatarView
                            .clipped()
                            .anchorPreference(key: MyViewPreferenceKey.self, value: .bounds, transform: {
                                [MyViewPreferenceData(element: .detailImage, bounds: $0)]
                            })
                            .hidden()
                        
                        Spacer().frame(width: 12)
                    }
                    
                    VStack(alignment: .leading, spacing: 3) {
                        title.lineLimit(2)
                            .alignmentGuide(.iconStackAlignmentGuide) { dimension in
                                dimension[.firstTextBaseline]
                            }
                        subtitle
                        footnote
                        tags
                        footnoteIcons
                    }
                    Spacer(minLength: 16)
                }
                .frame(width: self.doesShowDescriptionOrStatus() ? self.mainViewSize.width * splitPercent! : self.mainViewSize.width)
                
                HStack(alignment: .top) {
                    if !isDescriptionTextEmptyView {
                        Spacer().frame(width: 8)
                    }
                    
                    descriptionText
                        .lineLimit(self.numberOfLinesAllowedToShow())
                        .alignmentGuide(.iconStackAlignmentGuide) { dimension in
                            dimension[.firstTextBaseline]
                        }
                    
                    Spacer(minLength: 24)
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        status
                        substatus
                    }
                    .anchorPreference(key: MyViewPreferenceKey.self, value: .bounds, transform: {
                        [MyViewPreferenceData(element: .status, bounds: $0)]
                    })
                    .hidden()
                }
                .frame(width: self.doesShowDescriptionOrStatus() ? self.mainViewSize.width * (1 - splitPercent!) : 0)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(GeometrySizeView(size: $mainViewSize))
            .overlayPreferenceValue(MyViewPreferenceKey.self) { preferences in
                GeometryReader { geometry in
                    self.repositionDetailImageAndStatus(geometry, preferences: preferences) // reposition the detail image and status to top
                }
            }
        }
    }
    
    func repositionDetailImageAndStatus(_ geometry: GeometryProxy, preferences: [MyViewPreferenceData], showStatus: Bool = true) -> some View {
        let pDetail = preferences.first(where: { $0.element == .detailImage })
        let pStatus = preferences.first(where: { $0.element == .status })
        
        let boundDetail = pDetail != nil ? geometry[pDetail!.bounds] : .zero
        let boundStatus = pStatus != nil ? geometry[pStatus!.bounds] : .zero
//        let globalFrame = geometry.frame(in: .global)
//        print("global frame is \(globalFrame)")
        
        return ZStack {
            self.avatarView
                .clipped()
                .position(x: (boundDetail.minX + boundDetail.maxX) / 2, y: boundDetail.size.height / 2)
            
            if showStatus {
                VStack(alignment: .trailing, spacing: 4) {
                    status
                    substatus
                }
                .position(x: (boundStatus.minX + boundStatus.maxX) / 2, y: boundStatus.size.height / 2)
            }
        }
    }
    
    func doesShowDescription() -> Bool {
        /// show description in regular mode
        if isDescriptionTextEmptyView {
            return false
        }
        
        var showDescription = true
        if #available(iOS 14.0, *) {
            if sizeCategory >= ContentSizeCategory.extraLarge {
                showDescription = false
            }
        }
        
        return showDescription
    }
    
    func doesShowDescriptionOrStatus() -> Bool {
        if !isStatusEmptyView {
            return true
        }
        
        /// show description in regular mode
        if isDescriptionTextEmptyView {
            return false
        }
        
        var showDescription = true
        if #available(iOS 14.0, *) {
            if sizeCategory >= ContentSizeCategory.extraLarge {
                showDescription = false
            }
        }
        
        return showDescription
    }
    
    func numberOfLinesAllowedToShow() -> Int {
        if isSubtitleEmptyView && isFootnoteEmptyView {
            return 1
        } else if isSubtitleEmptyView || isFootnoteEmptyView {
            return 2
        } else {
            return 3
        }
    }
}

struct GeometrySizeView: View {
    @Binding var size: CGSize

    var body: some View {
        GeometryReader { proxy -> Color in
            DispatchQueue.main.async {
                self.size = proxy.size
            }
            
            return Color.clear
        }
    }
}

enum ObjectItemElement {
    case detailImage
    case status
    case singleActionButton
}

struct MyViewPreferenceData {
    let element: ObjectItemElement
    let bounds: Anchor<CGRect>
}

struct MyViewPreferenceKey: PreferenceKey {
    typealias Value = [MyViewPreferenceData]
    
    static var defaultValue: [MyViewPreferenceData] = []
    
    static func reduce(value: inout [MyViewPreferenceData], nextValue: () -> [MyViewPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}

struct ObjectItemNumberOfLines: EnvironmentKey {
    public static let defaultValue: Int = 3
}

public extension EnvironmentValues {
    var numberOfLines: Int {
        get { self[ObjectItemNumberOfLines.self] }
        set { self[ObjectItemNumberOfLines.self] = newValue }
    }
}

struct ObjectItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            _ObjectItem(title: {
                Text("Transformer Overheating")
            }, status: {
                Text("High")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .border(Color.black, width: 1)
            })
            .previewLayout(.fixed(width: 390, height: 150))
            .environment(\.horizontalSizeClass, .compact)
            .previewDisplayName("When only the headline label is used, everything in the cell is center aligned. Only 1 status can be used.")
            
            _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, status: {
                Text("High")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("12345")
                    .font(.system(size: 6))
                Circle().fill(Color.blue).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
            })
            .previewLayout(.fixed(width: 390, height: 150))
            .environment(\.horizontalSizeClass, .compact)
            .previewDisplayName("If only 1 status is being used, the body and subhead labels in the main content area should extend to the full width of the cell below the status.")
            
            _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
                    .font(.headline)
                    .foregroundColor(.green)
                    .lineLimit(2)
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 32, weight: .bold, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Circle().fill(Color.blue).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
            })
            .previewLayout(.fixed(width: 390, height: 150))
            .environment(\.horizontalSizeClass, .compact)
            .previewDisplayName("All elements, Compact")
            
            _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1")
                Image(systemName: "circle.fill").foregroundColor(.blue)
                Image(systemName: "paperclip").font(.system(size: 14))
            })
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (4th generation)"))
            .previewLayout(.fixed(width: 844, height: 120))
            .environment(\.horizontalSizeClass, .regular)
            .previewDisplayName("Regular, 1st is text, init with ViewBuilder")
            
            _ObjectItem(title: {
                Text("Transformer Overheating When After Being on for 1 Hour or Longer")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Image(systemName: "circle.fill")
                Text("1")
                Image(systemName: "paperclip").font(.system(size: 14))
            })
            .splitPercent(nil)
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (4th generation)"))
            .previewLayout(.fixed(width: 844, height: 120))
            .environment(\.horizontalSizeClass, .regular)
            .previewDisplayName("Regular, 1st is icon, splitPercent to nil, init with ViewBuilder")
            
            _ObjectItem(title: "Transformer Overheating",
                        subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                        descriptionText: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                        status: TextOrIcon.text("High"),
                        substatus: TextOrIcon.text("Scheduled"),
                        detailImage: Image(systemName: "person"),
                        icons: [TextOrIcon.text("1"),
                                TextOrIcon.icon(Image(systemName: "circle.fill")),
                                TextOrIcon.icon(Image(systemName: "mail"))])
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (4th generation)"))
                .previewLayout(.fixed(width: 844, height: 120))
                .environment(\.horizontalSizeClass, .regular)
                .previewDisplayName("Regular, 1st is text, init with model")
            
            _ObjectItem(title: {
                Text("Transformer Overheating")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, descriptionText: {
                Text("Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.")
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled").lineLimit(1)
            }, detailImage: {
                Image(systemName: "person")
                    .font(.system(size: 45, weight: .regular, design: .serif))
                    .border(Color.black, width: 1)
            }, icons: {
                Text("1").font(.subheadline)
                Circle().fill(Color.blue).frame(width: 14, height: 14)
                Image(systemName: "paperclip").font(.system(size: 14))
            })
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (4th generation)"))
            .previewLayout(.fixed(width: 844, height: 200))
            .environment(\.horizontalSizeClass, .regular)
            .previewDisplayName("Accessibility AX1 and larger- no description text")
            .environment(\.sizeCategory, .accessibilityExtraLarge)
            
            _ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, footnote: {
                Text("Los Angeles")
            }, descriptionText: {
                Text("Rouja has worked for the company for ten years and has all of the skills that would be necessary for developing quality applications.  She is proficient in Java as well as CSS, Bootstrap, and Swift.")
            }, status: {
                Text("Available")
            }, detailImage: {
                Image("ProfilePic")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
            }, icons: {
                Text("1")
                Circle().fill(Color.preferredColor(.tintColor)).frame(width: 14, height: 14)
            }, action: {
                Button {
                    print("Tapped Follow")
                } label: {
                    Text("Follow")
                }.buttonStyle(PlainButtonStyle())
            })
            .previewLayout(.fixed(width: 390, height: 150))
            .environment(\.horizontalSizeClass, .compact)
            .previewDisplayName("Single Action")
        }
    }
}

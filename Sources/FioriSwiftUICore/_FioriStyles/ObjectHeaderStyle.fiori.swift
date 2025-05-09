import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ObjectHeaderBaseStyle: ObjectHeaderStyle {
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.headerSeparator) private var separatorConfiguration

    @State var rightViewSize: CGSize = .init(width: 120, height: 0)
    @State var currentTabIndex: Int = 0
    @State var leftViewSize: CGSize = .init(width: 740, height: 0)
    @State var mainViewSize: CGSize = .zero
    @State var statusViewSize: CGSize = .zero
    @State var middleViewSize: CGSize = .init(width: 312, height: 0)
    
    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        Group {
            if self.horizontalSizeClass == .compact {
                self.compactView(configuration)
                    .ifApply(self.separatorConfiguration.showSeparator) { content in
                        VStack(spacing: 16) {
                            content
                            self.separatorConfiguration.color
                                .frame(height: self.separatorConfiguration.lineWidth)
                        }
                    }
            } else {
                self.regularView(configuration)
                    .ifApply(self.separatorConfiguration.showSeparator) { content in
                        VStack(spacing: 16) {
                            content
                            self.separatorConfiguration.color
                                .frame(height: self.separatorConfiguration.lineWidth)
                        }
                    }
                    .padding(.vertical, 18)
            }
        }
    }
    
    func regularView(_ configuration: ObjectHeaderConfiguration) -> some View {
        HStack(alignment: .top) {
            if !configuration.detailImage.isEmpty {
                configuration.detailImage
                    .frame(width: 70, height: 70)
                    .cornerRadius(6)
                    .clipped()
                
                Spacer().frame(width: 16)
            }
            
            HStack(alignment: .iconStackAlignmentGuide) {
                HStack {
                    self.leftViewInRegular(configuration)
                    Spacer(minLength: 0)
                }
                .layoutPriority(0)
                .frame(minWidth: 120, maxWidth: 740)
                
                Spacer(minLength: 48)
                
                if !self.isMiddleViewInRegularEmpty(configuration) {
                    self.middleViewInRegular(configuration)
                        .layoutPriority(1)
                        .sizeReader(size: { size in
                            self.middleViewSize = size
                        })
                        .frame(width: min(312, self.middleViewSize.width))
                }
                
                if !self.isMiddleViewInRegularEmpty(configuration), !configuration.status.isEmpty || !configuration.substatus.isEmpty {
                    Spacer().frame(width: 40)
                }
                
                self.rightViewInRegular(configuration)
                    .layoutPriority(2)
                    .sizeReader(size: { size in
                        DispatchQueue.main.async {
                            self.rightViewSize = size
                        }
                    })
                    .frame(width: min(120, self.rightViewSize.width))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func leftViewInRegular(_ configuration: ObjectHeaderConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            configuration.title
                .alignmentGuide(.iconStackAlignmentGuide, computeValue: { dimension in
                    if self.isBaselineAligned(configuration) {
                        return dimension[VerticalAlignment.firstTextBaseline]
                    } else {
                        return dimension[.top]
                    }
                })
            configuration.subtitle
            
            if !configuration.detailContent.isEmpty || !configuration.descriptionText.isEmpty, !self.isAdditionalInfoViewEmpty(configuration) {
                Spacer().frame(height: 16)
                self.additionalInfoView(configuration)
            } else if !configuration.detailContent.isEmpty, self.isAdditionalInfoViewEmpty(configuration), !configuration.descriptionText.isEmpty {
                Spacer().frame(height: 16)
                configuration.descriptionText
            }
        }
    }
    
    @ViewBuilder
    func middleViewInRegular(_ configuration: ObjectHeaderConfiguration) -> some View {
        if !configuration.detailContent.isEmpty {
            VStack {
                Spacer(minLength: 0)
                configuration.detailContent
                Spacer(minLength: 0)
            }
        } else if !configuration.descriptionText.isEmpty {
            configuration.descriptionText
                .alignmentGuide(.iconStackAlignmentGuide, computeValue: { dimension in
                    if self.isBaselineAligned(configuration) {
                        return dimension[VerticalAlignment.firstTextBaseline]
                    } else {
                        return dimension[.top]
                    }
                })
        } else if !self.isAdditionalInfoViewEmpty(configuration) {
            self.additionalInfoView(configuration)
        } else {
            EmptyView()
        }
    }
    
    func rightViewInRegular(_ configuration: ObjectHeaderConfiguration) -> some View {
        VStack(alignment: .trailing, spacing: 2) {
            configuration.status
                .multilineTextAlignment(.trailing)
                .alignmentGuide(.iconStackAlignmentGuide, computeValue: { dimension in
                    if self.isBaselineAligned(configuration) {
                        return dimension[VerticalAlignment.firstTextBaseline]
                    } else {
                        return dimension[.top]
                    }
                })
            
            configuration.substatus
                .multilineTextAlignment(.trailing)
        }
    }
    
    func isBaselineAligned(_ configuration: ObjectHeaderConfiguration) -> Bool {
        if configuration.detailContent.isEmpty, configuration.descriptionText.isEmpty {
            return true
        } else if self.isMiddleViewInRegularEmpty(configuration), !configuration.status.isEmpty {
            return true
        }
        
        return false
    }
    
    func additionalInfoView(_ configuration: ObjectHeaderConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            configuration.tags
            configuration.bodyText
            configuration.footnote
        }
    }
    
    func isMiddleViewInRegularEmpty(_ configuration: ObjectHeaderConfiguration) -> Bool {
        if configuration.detailContent.isEmpty, configuration.descriptionText.isEmpty, self.isAdditionalInfoViewEmpty(configuration) {
            return true
        }
        
        return false
    }
    
    func isAdditionalInfoViewEmpty(_ configuration: ObjectHeaderConfiguration) -> Bool {
        if configuration.tags.isEmpty, configuration.bodyText.isEmpty, configuration.footnote.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func compactView(_ configuration: ObjectHeaderConfiguration) -> some View {
        VStack {
            let tabsCount = self.numberOfTabs(configuration)
            if tabsCount == 1 {
                Spacer().frame(height: 8)
            }
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                self.tabView(configuration)
                
                self.tab1(configuration)
                    .opacity(0)
                    .disabled(true)
                
                self.tab2(configuration)
                    .opacity(0)
                    .disabled(true)
                
                self.tab3(configuration)
                    .opacity(0)
                    .disabled(true)
                
                self.statusViewInCompact(configuration)
                    .sizeReader(size: { size in
                        DispatchQueue.main.async {
                            self.statusViewSize = size
                        }
                    }).hidden()
            }
            
            if tabsCount > 1 {
                Spacer().frame(height: 8)
                
                HStack {
                    Spacer(minLength: 0)
                    
                    PageIndicator(numberOfPages: tabsCount, currentPage: self.$currentTabIndex)
                    
                    Spacer(minLength: 0)
                }
            }
            
            if tabsCount == 1 {
                Spacer().frame(height: 8)
            }
        }
        .sizeReader(size: { size in
            DispatchQueue.main.async {
                self.mainViewSize = size
            }
        })
    }
    
    func tabView(_ configuration: ObjectHeaderConfiguration) -> some View {
        TabView(selection: self.$currentTabIndex) {
            self.tab1(configuration).tag(0)
            
            self.tab2(configuration).tag(self.realTabIndex(configuration, for: 1))
            
            self.tab3(configuration).tag(self.realTabIndex(configuration, for: 2))
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    /// Status will take 1st priority without exceeding its maximum width of 23%.
    /// The maximum for page controls is 3 pages.
    /// Chart and description are center-aligned horizontally and vertically in the container.
    @ViewBuilder
    func tab1(_ configuration: ObjectHeaderConfiguration) -> some View {
        if self.sizeCategory > .large {
            self.tab1WhenSizeCategoryGreatThanLarge(configuration)
        } else {
            self.tab1InGeneral(configuration)
        }
    }
    
    func tab1WhenSizeCategoryGreatThanLarge(_ configuration: ObjectHeaderConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                if configuration.detailImage.isEmpty {
                    configuration.detailImage
                }
                
                Spacer(minLength: 8)
                
                configuration.status.multilineTextAlignment(.trailing)
                
                configuration.substatus.multilineTextAlignment(.trailing)
            }
            
            VStack(alignment: .leading, spacing: 3) {
                configuration.title
                configuration.subtitle
            }
            
            if !self.isAdditionalInfoViewEmpty(configuration) {
                Spacer().frame(height: 8)
                
                self.additionalInfoView(configuration)
            } else {
                if !configuration.descriptionText.isEmpty {
                    Spacer().frame(height: 8)
                    
                    configuration.descriptionText
                }
            }
        }
    }
    
    func tab1InGeneral(_ configuration: ObjectHeaderConfiguration) -> some View {
        HStack(alignment: .top) {
            if !configuration.detailImage.isEmpty {
                configuration.detailImage
                    .frame(width: 45, height: 45)
                
                Spacer().frame(width: 16)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 3) {
                        configuration.title.multilineTextAlignment(.leading)
                        configuration.subtitle.multilineTextAlignment(.leading)
                    }
                    
                    if !configuration.status.isEmpty || !configuration.substatus.isEmpty {
                        Spacer(minLength: 8)
                        
                        self.statusViewInCompact(configuration)
                            .layoutPriority(2)
                            .frame(width: self.statusViewSize.width == 0 ? nil : min(self.statusViewSize.width, self.mainViewSize.width * 0.23))
                    }
                }
                
                if !self.isAdditionalInfoViewEmpty(configuration) {
                    self.additionalInfoView(configuration)
                } else {
                    configuration.descriptionText
                }
            }
            
            Spacer(minLength: 0)
        }
    }
    
    func statusViewInCompact(_ configuration: ObjectHeaderConfiguration) -> some View {
        VStack(alignment: .trailing, spacing: 4) {
            configuration.status
                .multilineTextAlignment(.trailing)
            
            configuration.substatus
                .multilineTextAlignment(.trailing)
        }
    }
    
    func tab2(_ configuration: ObjectHeaderConfiguration) -> some View {
        configuration.detailContent
    }
    
    @ViewBuilder
    func tab3(_ configuration: ObjectHeaderConfiguration) -> some View {
        if !self.isAdditionalInfoViewEmpty(configuration) {
            configuration.descriptionText
        }
    }
    
    func numberOfTabs(_ configuration: ObjectHeaderConfiguration) -> Int {
        var count = 1
        if !configuration.detailContent.isEmpty {
            count += 1
        }
        
        if !self.isAdditionalInfoViewEmpty(configuration), !configuration.descriptionText.isEmpty {
            count += 1
        }
        
        return count
    }
    
    func realTabIndex(_ configuration: ObjectHeaderConfiguration, for index: Int) -> Int {
        if index == 2 {
            if !self.isAdditionalInfoViewEmpty(configuration), !configuration.descriptionText.isEmpty {
                if !configuration.detailContent.isEmpty {
                    return 2
                } else {
                    return 1
                }
            }
        } else if index == 1 {
            if !configuration.detailContent.isEmpty {
                return 1
            }
        } else if index == 0 {
            return 0
        }
        
        // invalid value
        return -1
    }
}

// Default fiori styles
extension ObjectHeaderFioriStyle {
    struct ContentFioriStyle: ObjectHeaderStyle {
        func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
            ObjectHeader(configuration)
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let objectHeaderConfiguration: ObjectHeaderConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .title3))
                .foregroundColor(.preferredColor(.primaryLabel))
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        let objectHeaderConfiguration: ObjectHeaderConfiguration
        
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .font(.fiori(forTextStyle: .body))
                .foregroundColor(.preferredColor(.primaryLabel))
        }
    }
    
    struct TagsFioriStyle: TagsStyle {
        let objectHeaderConfiguration: ObjectHeaderConfiguration
        
        func makeBody(_ configuration: TagsConfiguration) -> some View {
            Tags(configuration)
        }
    }
    
    struct BodyTextFioriStyle: BodyTextStyle {
        let objectHeaderConfiguration: ObjectHeaderConfiguration
        
        func makeBody(_ configuration: BodyTextConfiguration) -> some View {
            BodyText(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(.preferredColor(.secondaryLabel))
        }
    }
    
    struct FootnoteFioriStyle: FootnoteStyle {
        let objectHeaderConfiguration: ObjectHeaderConfiguration
        
        func makeBody(_ configuration: FootnoteConfiguration) -> some View {
            Footnote(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(.preferredColor(.secondaryLabel))
                .lineLimit(1)
        }
    }
    
    struct DescriptionTextFioriStyle: DescriptionTextStyle {
        let objectHeaderConfiguration: ObjectHeaderConfiguration
        
        func makeBody(_ configuration: DescriptionTextConfiguration) -> some View {
            DescriptionText(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(.preferredColor(.primaryLabel))
        }
    }
    
    struct StatusFioriStyle: StatusStyle {
        let objectHeaderConfiguration: ObjectHeaderConfiguration
        
        func makeBody(_ configuration: StatusConfiguration) -> some View {
            Status(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(.preferredColor(.secondaryLabel))
        }
    }
    
    struct SubstatusFioriStyle: SubstatusStyle {
        let objectHeaderConfiguration: ObjectHeaderConfiguration
        
        func makeBody(_ configuration: SubstatusConfiguration) -> some View {
            Substatus(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(.preferredColor(.secondaryLabel))
        }
    }
    
    struct DetailImageFioriStyle: DetailImageStyle {
        let objectHeaderConfiguration: ObjectHeaderConfiguration
        
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
    
    struct DetailContentFioriStyle: DetailContentStyle {
        let objectHeaderConfiguration: ObjectHeaderConfiguration
        
        func makeBody(_ configuration: DetailContentConfiguration) -> some View {
            DetailContent(configuration)
        }
    }
}

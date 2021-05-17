import FioriCharts
import SwiftUI

public extension ObjectHeader where Title == Text,
    Subtitle == _ConditionalContent<Text, EmptyView>,
    Tags == _ConditionalContent<TagStack, EmptyView>,
    BodyText == _ConditionalContent<Text, EmptyView>,
    Footnote == _ConditionalContent<Text, EmptyView>,
    DescriptionText == _ConditionalContent<Text, EmptyView>,
    Status == _ConditionalContent<Text, EmptyView>,
    Substatus == _ConditionalContent<Text, EmptyView>,
    DetailImage == _ConditionalContent<Image, EmptyView>,
    DetailContent == HeaderChart<Text, _ConditionalContent<Text, EmptyView>, _ConditionalContent<Text, EmptyView>, _ConditionalContent<Image, EmptyView>, _ConditionalContent<Text, EmptyView>, AnyView>
{
    init(title: String,
         subtitle: String? = nil,
         tags: [String]? = nil,
         bodyText: String? = nil,
         footnote: String? = nil,
         descriptionText: String? = nil,
         status: String? = nil,
         substatus: String? = nil,
         detailImage: Image? = nil,
         headerChart: HeaderChart<Text, _ConditionalContent<Text, EmptyView>, _ConditionalContent<Text, EmptyView>, _ConditionalContent<Image, EmptyView>, _ConditionalContent<Text, EmptyView>, AnyView>)
    {
        self._title = Text(title)
        self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
        self._tags = tags != nil ? ViewBuilder.buildEither(first: TagStack(tags: tags!)) : ViewBuilder.buildEither(second: EmptyView())
        self._bodyText = bodyText != nil ? ViewBuilder.buildEither(first: Text(bodyText!)) : ViewBuilder.buildEither(second: EmptyView())
        self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
        self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
        self._status = status != nil ? ViewBuilder.buildEither(first: Text(status!)) : ViewBuilder.buildEither(second: EmptyView())
        self._substatus = substatus != nil ? ViewBuilder.buildEither(first: Text(substatus!)) : ViewBuilder.buildEither(second: EmptyView())
        self._detailImage = detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView())
        self._detailContent = headerChart
    }
}

extension Fiori {
    enum ObjectHeader {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                if #available(iOS 14.0, *) {
                    return content
                        .font(.title3)
                        .foregroundColor(.preferredColor(.primary1))
                } else {
                    // Fallback on earlier versions
                    return content
                        .font(.headline)
                        .foregroundColor(.preferredColor(.primary1))
                }
            }
        }
        
        struct Subtitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.body)
                    .foregroundColor(.preferredColor(.primary1))
            }
        }
        
        struct BodyText: ViewModifier {
            func body(content: Content) -> some View {
                content.font(.subheadline)
                    .foregroundColor(.preferredColor(.primary2))
            }
        }
        
        struct Footnote: ViewModifier {
            func body(content: Content) -> some View {
                content.font(.subheadline)
                    .foregroundColor(.preferredColor(.primary2))
                    .lineLimit(1)
            }
        }
        
        struct DescriptionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.subheadline)
                    .foregroundColor(.preferredColor(.primary1))
            }
        }
        
        struct Status: ViewModifier {
            func body(content: Content) -> some View {
                content.font(.subheadline)
                    .foregroundColor(.preferredColor(.primary2))
            }
        }
        
        struct Substatus: ViewModifier {
            func body(content: Content) -> some View {
                content.font(.subheadline)
                    .foregroundColor(.preferredColor(.primary2))
            }
        }
        
        struct DetailImage: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .cornerRadius(6)
            }
        }
        
        typealias TitleCumulative = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
        typealias BodyTextCumulative = EmptyModifier
        typealias FootnoteCumulative = EmptyModifier
        typealias DescriptionTextCumulative = EmptyModifier
        typealias StatusCumulative = EmptyModifier
        typealias SubstatusCumulative = EmptyModifier
        typealias DetailImageCumulative = EmptyModifier
        typealias Tags = EmptyModifier
        typealias Placeholder = EmptyModifier
        
        static let title = Title()
        static let subtitle = Subtitle()
        static let bodyText = BodyText()
        static let footnote = Footnote()
        static let descriptionText = DescriptionText()
        static let status = Status()
        static let substatus = Substatus()
        static let detailImage = DetailImage()
        static let titleCumulative = TitleCumulative()
        static let subtitleCumulative = SubtitleCumulative()
        static let bodyTextCumulative = BodyTextCumulative()
        static let footnoteCumulative = FootnoteCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()
        static let statusCumulative = StatusCumulative()
        static let substatusCumulative = SubstatusCumulative()
        static let detailImageCumulative = DetailImageCumulative()
    }
}

/*
 detailImage
 mainView: title, subtitle
 additionalInfoView: tags, bodyText, footnote
 descriptionView: descriptionText
 statusView: status, substatus
 detailContentView: detailContent
 
 if additionalInfoView is not empty put additionalInfoView under mainView
 if additionalInfoView is empty put descriptionView under mainView
 else descriptionView will get its own page
 */

extension ObjectHeader: View {
    public var body: some View {
        Group {
            if horizontalSizeClass == .some(.compact) {
                compactView
            } else { // horizontalSizeClass is Regular
                regularView
                    .padding(.vertical, 18)
            }
        }
        .background(Color.preferredColor(.primary6))
    }
    
    /*
     The size of each container will be determined by content.
     Status will take 1st priority without exceeding its maximum width.
     The middle container(Analytics/description/ additional info) will take 2nd priority within the boundary of its max width of 312.
     The width of the left container (Image, object title and additional info) will be determined by the remaining space, with a max of 740px and a min of 445.
     */
    var regularView: some View {
        HStack(alignment: .top) {
            if !isDetailImageEmptyView {
                detailImage
                    .frame(width: 70, height: 70)
                    .cornerRadius(6)
                    .clipped()
                
                Spacer().frame(width: 16)
            }
            
            HStack(alignment: .iconStackAlignmentGuide) {
                HStack {
                    leftViewInRegular
                    Spacer(minLength: 0)
                }
                .layoutPriority(0)
                .frame(minWidth: 120, maxWidth: 740)
                
                Spacer(minLength: 48)
                
                if !isMiddleViewInRegularEmpty {
                    middleViewInRegular
                        .layoutPriority(1)
                        .modifier(SizeModifier())
                        .onPreferenceChange(SizePreferenceKey.self) { size in
                            DispatchQueue.main.async {
                                self.middleViewSize = size
                            }
                        }
                        .frame(width: min(312, self.middleViewSize.width))
                }
                
                if !isMiddleViewInRegularEmpty && (!isStatusEmptyView || !isSubstatusEmptyView) {
                    Spacer().frame(width: 40)
                }
                
                rightViewInRegular
                    .layoutPriority(2)
                    .modifier(SizeModifier())
                    .onPreferenceChange(SizePreferenceKey.self) { size in
                        DispatchQueue.main.async {
                            self.rightViewSize = size
                        }
                    }
                    .frame(width: min(120, self.rightViewSize.width))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var leftViewInRegular: some View {
        VStack(alignment: .leading, spacing: 3) {
            title
                .alignmentGuide(.iconStackAlignmentGuide, computeValue: { dimension in
                    if self.isBaselineAligned {
                        return dimension[VerticalAlignment.firstTextBaseline]
                    } else {
                        return dimension[.top]
                    }
                })
            subtitle
            
            if (!isDetailContentEmpty || !isDescriptionTextEmptyView) && !isAdditionalInfoViewEmpty {
                Spacer().frame(height: 16)
                additionalInfoView
            } else if !isDetailContentEmpty && isAdditionalInfoViewEmpty && !isDescriptionTextEmptyView {
                Spacer().frame(height: 16)
                descriptionText
            }
        }
    }
    
    @ViewBuilder
    var middleViewInRegular: some View {
        if !isDetailContentEmpty {
            VStack {
                Spacer(minLength: 0)
                detailContent
                Spacer(minLength: 0)
            }
        } else if !isDescriptionTextEmptyView {
            descriptionText
                .alignmentGuide(.iconStackAlignmentGuide, computeValue: { dimension in
                    if self.isBaselineAligned {
                        return dimension[VerticalAlignment.firstTextBaseline]
                    } else {
                        return dimension[.top]
                    }
                })
        } else if !isAdditionalInfoViewEmpty {
            additionalInfoView
        } else {
            EmptyView()
        }
    }
    
    var rightViewInRegular: some View {
        VStack(alignment: .trailing, spacing: 2) {
            status
                .multilineTextAlignment(.trailing)
                .alignmentGuide(.iconStackAlignmentGuide, computeValue: { dimension in
                    if self.isBaselineAligned {
                        return dimension[VerticalAlignment.firstTextBaseline]
                    } else {
                        return dimension[.top]
                    }
                })
            
            substatus
                .multilineTextAlignment(.trailing)
        }
    }
    
    var isBaselineAligned: Bool {
        if self.isDetailContentEmpty && !isDescriptionTextEmptyView {
            return true
        } else if self.isMiddleViewInRegularEmpty && !isStatusEmptyView {
            return true
        }
        
        return false
    }
    
    var additionalInfoView: some View {
        VStack(alignment: .leading, spacing: 8) {
            tags
            bodyText
            footnote
        }
    }
    
    var isMiddleViewInRegularEmpty: Bool {
        if self.isDetailContentEmpty && isDescriptionTextEmptyView && self.isAdditionalInfoViewEmpty {
            return true
        }
        
        return false
    }
    
    var isAdditionalInfoViewEmpty: Bool {
        if isTagsEmptyView && isBodyTextEmptyView && isFootnoteEmptyView {
            return true
        } else {
            return false
        }
    }
    
    var isDetailContentEmpty: Bool {
        if DetailContent.self == EmptyView.self {
            return true
        }
        
        return false
    }
    
    var isSizeCategoryGreatThanLarge: Bool {
        let normalSizes: [ContentSizeCategory] = [.extraSmall, .small, .medium, .large]
        
        if normalSizes.contains(sizeCategory) {
            return false
        } else {
            return true
        }
    }
    
    var compactView: some View {
        VStack {
            if numberOfTabs == 1 {
                Spacer().frame(height: 8)
            }
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                tabView
                
                tab1
                    .opacity(0)
                    .disabled(true)
                
                tab2
                    .opacity(0)
                    .disabled(true)
                
                tab3
                    .opacity(0)
                    .disabled(true)
                
                statusViewInCompact
                    .modifier(SizeModifier())
                    .onPreferenceChange(SizePreferenceKey.self) { size in
                        DispatchQueue.main.async {
                            self.statusViewSize = size
                        }
                    }.hidden()
            }
            
            if #available(iOS 14.0, *), numberOfTabs > 1 {
                Spacer().frame(height: 8)
                
                HStack {
                    Spacer(minLength: 0)
                    
                    PageIndicator(numberOfPages: numberOfTabs, currentPage: $currentTabIndex)
                    
                    Spacer(minLength: 0)
                }
            }
            
            if numberOfTabs == 1 {
                Spacer().frame(height: 8)
            }
        }
        .modifier(SizeModifier())
        .onPreferenceChange(SizePreferenceKey.self) { size in
            DispatchQueue.main.async {
                self.mainViewSize = size
            }
        }
    }
    
    var tabView: some View {
        let tabView = TabView(selection: $currentTabIndex) {
            tab1.tag(0)
            
            tab2.tag(realTabIndex(for: 1))
            
            tab3.tag(realTabIndex(for: 2))
        }
        
        if #available(iOS 14.0, *) {
            return
                AnyView(tabView
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    //                            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                )
        } else {
            return AnyView(tabView)
        }
    }
    
    /// Status will take 1st priority without exceeding its maximum width of 23%.
    /// The maximum for page controls is 3 pages.
    /// Chart and description are center-aligned horizontally and vertically in the container.
    @ViewBuilder
    var tab1: some View {
        if isSizeCategoryGreatThanLarge {
            tab1WhenSizeCategoryGreatThanLarge
        } else {
            tab1InGeneral
        }
    }
    
    var tab1WhenSizeCategoryGreatThanLarge: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                if !isDetailImageEmptyView {
                    detailImage
                        .frame(width: 45, height: 45)
                        .cornerRadius(6)
                        .clipped()
                }
                
                Spacer(minLength: 8)
                
                status.multilineTextAlignment(.trailing)
                
                substatus.multilineTextAlignment(.trailing)
            }
            
            VStack(alignment: .leading, spacing: 3) {
                title
                subtitle
            }
            
            if !isAdditionalInfoViewEmpty {
                Spacer().frame(height: 8)
                
                additionalInfoView
            } else {
                if !isDescriptionTextEmptyView {
                    Spacer().frame(height: 8)
                    
                    descriptionText
                }
            }
        }
    }
    
    var tab1InGeneral: some View {
        HStack(alignment: .top) {
            if !isDetailImageEmptyView {
                detailImage
                    .frame(width: 45, height: 45)
                    .cornerRadius(6)
                    .clipped()
                
                Spacer().frame(width: 16)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 3) {
                        title.multilineTextAlignment(.leading)
                        subtitle.multilineTextAlignment(.leading)
                    }
                    
                    if !isStatusEmptyView || !isSubstatusEmptyView {
                        Spacer(minLength: 8)
                        
                        statusViewInCompact
                            .layoutPriority(2)
                            .frame(width: self.statusViewSize.width == 0 ? nil : min(self.statusViewSize.width, self.mainViewSize.width * 0.23))
                    }
                }
                
                if !isAdditionalInfoViewEmpty {
                    additionalInfoView
                } else {
                    descriptionText
                }
            }
            
            Spacer(minLength: 0)
        }
    }
    
    var statusViewInCompact: some View {
        VStack(alignment: .trailing, spacing: 4) {
            status
                .multilineTextAlignment(.trailing)
            
            substatus
                .multilineTextAlignment(.trailing)
        }
    }
    
    var tab2: some View {
        detailContent
    }
    
    @ViewBuilder
    var tab3: some View {
        if !isAdditionalInfoViewEmpty {
            descriptionText
        }
    }
    
    var numberOfTabs: Int {
        var count = 1
        if DetailContent.self != EmptyView.self {
            count += 1
        }
        
        if !self.isAdditionalInfoViewEmpty && !isDescriptionTextEmptyView {
            count += 1
        }
        
        return count
    }
    
    func realTabIndex(for index: Int) -> Int {
        if index == 2 {
            if !self.isAdditionalInfoViewEmpty && !isDescriptionTextEmptyView {
                if DetailContent.self != EmptyView.self {
                    return 2
                } else {
                    return 1
                }
            }
        } else if index == 1 {
            if DetailContent.self != EmptyView.self {
                return 1
            }
        } else if index == 0 {
            return 0
        }
        
        // invalid value
        return -1
    }
}

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = CGSize(width: max(value.width, nextValue().width),
                       height: max(value.height, nextValue().height))
    }
}

struct BoundPreferenceKey: PreferenceKey {
    typealias Value = CGRect
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        let size = CGSize(width: max(value.size.width, nextValue().size.width),
                          height: max(value.size.height, nextValue().size.height > 0 ? nextValue().size.height + 40 : 0))
        value = CGRect(origin: .zero, size: size)
    }
}

struct SizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.background(GeometryReader { proxy in
            Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
        })
    }
}

struct ObjectHeader_Preview: PreviewProvider {
    static var previews: some View {
        let chartModel = ChartModel(chartType: .line,
                                    data: [[10, 30, 45, 55, 40, 70, 80]],
                                    titlesForCategory: [["9AM", nil, nil, nil, nil, nil, "9PM"]],
                                    categoryAxis: ChartCategoryAxisAttributes(labelLayoutStyle: .range))
        chartModel.numericAxis.labels.isHidden = true
        chartModel.seriesAttributes[0].point.isHidden = true
        
        let hc = HeaderChart(title: {
            Text("Temperature")
        }, subtitle: {
            Text("20 min ago")
        }, trend: {
            Text("11.5%").foregroundColor(.green)
        }, trendImage: {
            Image(systemName: "triangle.fill").foregroundColor(.green)
        }, chart: {
            ChartView(chartModel)
        })
        
        return Group {
            ObjectHeader(title: "Transformer Overheating",
                         subtitle: "Three Phase Pad Mounted Transformer (533423)", footnote: "1000 - Hamburg, MECHANIK",
                         descriptionText: "Customer noticed that the transformer started to over heat within 45 minutes each time he turned it on at 7:30am.  The first technician who looked at this did not have the correct additional tools to complete the job.",
                         status: "High", substatus: "Scheduled",
                         detailImage: Image(systemName: "person"),
                         detailContent: { hc })
                .previewLayout(.fixed(width: 390, height: 150))
                .environment(\.horizontalSizeClass, .compact)
            
            // page 6
            ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("High Priority")
            }, detailImage: {
                Image(systemName: "person").font(Font.system(size: 70))
            }, detailContent: {
                HeaderChart(title: {
                    Text("Temperature")
                }, subtitle: {
                    Text("20 min ago")
                }, chart: {
                    ChartView(chartModel)
                })
            })
                .previewLayout(.fixed(width: 1024, height: 200))
                .environment(\.horizontalSizeClass, .regular)
                .environment(\.colorScheme, .dark)
            
            ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, status: {
                Text("Very High Priority").foregroundColor(.preferredColor(.negative))
            }, detailImage: {
                Image(systemName: "person").font(Font.system(size: 70))
            })
                .previewLayout(.fixed(width: 1024, height: 200))
                .environment(\.horizontalSizeClass, .regular)
                .environment(\.colorScheme, .dark)
            
            ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, footnote: {
                Text("Due on 12/31/16")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Text("Very High Priority").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("Scheduled")
            })
                .previewLayout(.fixed(width: 1024, height: 200))
                .environment(\.horizontalSizeClass, .regular)
                .environment(\.colorScheme, .dark)
            
            ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, footnote: {
                Text("Due on 12/31/16")
            })
                .previewLayout(.fixed(width: 1024, height: 200))
                .environment(\.horizontalSizeClass, .regular)
                .environment(\.colorScheme, .dark)
            
            ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines Accessibility Settings Testing")
            }, subtitle: {
                Text("Job 819701 Accessibility Settings Testing")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Text("Very High Priority").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("Scheduled")
            })
                .previewLayout(.fixed(width: 1024, height: 200))
                .environment(\.horizontalSizeClass, .regular)
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraExtraLarge)
            
            ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines Accessibility Settings Testing")
            }, subtitle: {
                Text("Job 819701 Accessibility Settings Testing")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, footnote: {
                Text("Due on 12/31/16")
            }, status: {
                Text("Very High Priority").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("Scheduled")
            }, detailContent: {
                HeaderChart(title: {
                    Text("Temperature")
                }, subtitle: {
                    Text("20 min ago")
                }, trend: {
                    Text("11.5%").foregroundColor(.green)
                }, trendImage: {
                    Image(systemName: "triangle.fill").foregroundColor(.green)
                }, kpi: {
                    KPIItem(data: .components([.metric("79"), .unit("°F")]), subtitle: "").disabled(true)
                })
            })
                .previewLayout(.fixed(width: 1024, height: 300))
                .environment(\.horizontalSizeClass, .regular)
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraExtraLarge)
        }
    }
}

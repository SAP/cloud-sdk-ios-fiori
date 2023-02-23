import SwiftUI

extension Fiori {
    enum ContactItem {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .headline))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .lineLimit(2)
            }
        }

        typealias TitleCumulative = EmptyModifier
        
        struct Subtitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .subheadline))
                    .foregroundColor(.preferredColor(.tertiaryLabel))
                    .lineLimit(1)
            }
        }

        typealias SubtitleCumulative = EmptyModifier
        
        struct DescriptionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .subheadline))
                    .foregroundColor(.preferredColor(.tertiaryLabel))
                    .lineLimit(3)
            }
        }

        typealias DescriptionTextCumulative = EmptyModifier
        
        struct DetailImage: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .frame(width: 45, height: 45, alignment: .center)
                    .clipShape(Circle())
            }
        }

        typealias DetailImageCumulative = EmptyModifier
        typealias ActionItems = EmptyModifier
        typealias ActionItemsCumulative = EmptyModifier

        static let title = Title()
        static let subtitle = Subtitle()
        static let descriptionText = DescriptionText()
        static let detailImage = DetailImage()
        static let actionItems = ActionItems()
        static let titleCumulative = TitleCumulative()
        static let subtitleCumulative = SubtitleCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()
        static let detailImageCumulative = DetailImageCumulative()
        static let actionItemsCumulative = ActionItemsCumulative()
    }
}

extension ContactItem: View {
    public var body: some View {
        Group {
            if horizontalSizeClass == .some(.regular) {
                bodyInRegular
            } else {
                bodyInCompact
            }
        }
    }
    
    var bodyInRegular: some View {
        HStack {
            detailImage
            if !isDetailImageEmptyView {
                Spacer().frame(width: 8)
            }

            if splitPercent == nil {
                titleSubtitleDescription
            } else {
                titleSubtitleDescriptionWithSplitPercent
            }
            actionItems
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
    
    var titleSubtitleDescription: some View {
        HStack(alignment: .center, spacing: 0) {
            Spacer().frame(width: 4)
            VStack(alignment: .leading, spacing: 3) {
                title
                subtitle
            }
            
            Spacer().frame(width: 24)
            
            descriptionText
            
            Spacer().frame(width: 24)
            
            Spacer(minLength: 0)
        }
    }
    
    var titleSubtitleDescriptionWithSplitPercent: some View {
        HStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Spacer().frame(width: 4)
                VStack(alignment: .leading, spacing: 3) {
                    title
                    subtitle
                }
                
                Spacer(minLength: 24)
            }
            .frame(width: mainViewSize.width * self.splitPercent!)
            
            HStack(alignment: .center, spacing: 0) {
                descriptionText
                
                Spacer(minLength: 24)
            }.frame(width: mainViewSize.width * (1 - self.splitPercent!))
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .modifier(SizeModifier())
        .onPreferenceChange(SizePreferenceKey.self) { size in
            DispatchQueue.main.async {
                self.mainViewSize = size
            }
        }
    }
    
    var bodyInCompact: some View {
        HStack {
            detailImage
            if !isDetailImageEmptyView {
                Spacer().frame(width: 8)
            }
            
            titleSubtitle
            
            Spacer(minLength: 0)
            
            actionItems
        }
    }
    
    var titleSubtitle: some View {
        HStack(spacing: 0) {
            Spacer().frame(width: 4)
            VStack(alignment: .leading, spacing: 3) {
                title
                subtitle
            }
            Spacer().frame(width: 24)
        }
    }
}

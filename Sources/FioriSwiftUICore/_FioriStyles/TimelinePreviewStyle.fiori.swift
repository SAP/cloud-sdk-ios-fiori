import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelinePreviewBaseStyle: TimelinePreviewStyle {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var itemCount = 0
    
    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            BuildHeader(configuration: configuration, itemCount: configuration.data.count)
            BuildTimelinePreviewItem(configuration: configuration, displayItems: self.getDisplayItemCount())
        }
    }
    
    func getDisplayItemCount() -> Int {
        let itemCount: Int = self.horizontalSizeClass == .compact ? 2 : (self.horizontalSizeClass == .regular ? (UIScreen.main.bounds.width > 768 ? 4 : 3) : 3)
        return itemCount
    }
}

struct BuildHeader: View {
    let configuration: TimelinePreviewConfiguration
    let itemCount: Int
    
    var body: some View {
        HStack {
            self.configuration.headerTitle
            Spacer()
            HStack(spacing: 3) {
                let labelFormat = NSLocalizedString("See All (%d)", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
                let labelString = String(format: labelFormat, self.itemCount)
                Text(labelString)
                    .font(.fiori(forTextStyle: .subheadline))
                    .foregroundStyle(Color.preferredColor(.tintColor))
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/ .leading/*@END_MENU_TOKEN@*/)
                self.configuration.seeAllAction
            }
            .contentShape(.rect)
            .accessibilityAddTraits(.isButton)
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
    }
}

struct BuildTimelinePreviewItem: View {
    let configuration: TimelinePreviewConfiguration
    let displayItems: Int

    var body: some View {
        HStack(alignment: .timelinePreviewAlignmentGuide, spacing: 4) {
            ForEach(self.filterItems(itemsData: self.configuration.data)) { item in
                let itemLabelFormat = NSLocalizedString("Item %d of %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
                let itemLabelString = String(format: itemLabelFormat, item.formatter.string(from: item.due), item.title)
                TimelinePreviewItem(title: AttributedString(item.title), icon: item.icon, timelineNode: item.timelineNode, timestamp: AttributedString(item.formatter.string(from: item.due)), data: item)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(itemLabelString)
            }
        }
    }

    func filterItems(itemsData: [TimelinePreviewItemModel]) -> [TimelinePreviewItemModel] {
        // flag item with isFuture and isCurrent
        let updatedItems = itemsData.map { item in
            var mutableItem = item
            mutableItem.isFuture = Date.compareTwoDates(first: mutableItem.due, second: Date()) == .orderedDescending
            mutableItem.isCurrent = Date.compareTwoDates(first: mutableItem.due, second: Date()) == .orderedSame
            return mutableItem
        }
        // sort the data by due and filter data by display item count
        let filteredItems = Array(updatedItems.sorted(by: { $0.due < $1.due }).prefix(self.displayItems))
        
        return filteredItems
    }
}

// Default fiori styles
extension TimelinePreviewFioriStyle {
    struct ContentFioriStyle: TimelinePreviewStyle {
        func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
            TimelinePreview(configuration)
                .fixedSize(horizontal: false, vertical: true)
                .contentShape(.rect)
                .padding(EdgeInsets(top: 11, leading: 16, bottom: 16, trailing: 16))
        }
    }

    struct HeaderTitleFioriStyle: HeaderTitleStyle {
        let timelinePreviewConfiguration: TimelinePreviewConfiguration
    
        func makeBody(_ configuration: HeaderTitleConfiguration) -> some View {
            HeaderTitle(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(Color.preferredColor(.secondaryLabel))
                .multilineTextAlignment(.leading)
        }
    }

    struct SeeAllActionFioriStyle: SeeAllActionStyle {
        let timelinePreviewConfiguration: TimelinePreviewConfiguration

        func makeBody(_ configuration: SeeAllActionConfiguration) -> some View {
            SeeAllAction(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(Color.preferredColor(.secondaryLabel))
                .fioriButtonStyle(FioriPlainButtonStyle())
        }
    }
}

public struct TimelinePreviewItemModel: Identifiable {
    public var id = UUID()
    public var title: String
    public var icon: Image?
    public var timelineNode: TimelineNodeType
    public var due: Date
    public var formatter: DateFormatter
    public var isFuture: Bool?
    public var isCurrent: Bool?
    
    public init(id: UUID = UUID(), title: String, icon: Image? = nil, timelineNode: TimelineNodeType, due: Date, dateFormat: String? = nil, isFuture: Bool? = false, isCurrent: Bool? = false) {
        self.id = id
        self.title = title
        self.icon = icon
        self.timelineNode = timelineNode
        self.due = due
        self.formatter = DateFormatter()
        if let dateFormat {
            self.formatter.dateFormat = dateFormat
        } else {
            self.formatter.dateFormat = "MMMM dd yyyy"
        }
        self.isFuture = isFuture
        self.isCurrent = isCurrent
    }
}

extension Date {
    static func compareTwoDates(first: Date, second: Date) -> ComparisonResult {
        let calendar = Calendar.current
        let components: Set<Calendar.Component> = [Calendar.Component.day, .month, .year, .hour, .minute, .second]
        let date1Components = calendar.dateComponents(components, from: first)
        let date2Components = calendar.dateComponents(components, from: second)
        let date1 = calendar.date(from: date1Components)
        let date2 = calendar.date(from: date2Components)

        guard let date1, let date2 else {
            fatalError("Two dates in comparison must have the same component")
        }

        return date1.compare(date2)
    }
}

extension VerticalAlignment {
    private struct TimelinePreviewAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.bottom]
        }
    }
    
    static let timelinePreviewAlignmentGuide = VerticalAlignment(
        TimelinePreviewAlignment.self
    )
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelinePreviewBaseStyle: TimelinePreviewStyle {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var itemCount = 0
    @State private var VSize: CGSize = .zero
    
    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if configuration.showHeader {
                BuildHeader(configuration: configuration, itemCount: configuration.data.count)
            }
            BuildTimelinePreviewItem(configuration: configuration, displayItems: self.getDisplayItemCount(VSWidth: self.VSize.width))
        }.readSize { newSize in
            self.VSize = newSize
        }
    }
    
    func getDisplayItemCount(VSWidth: CGFloat) -> Int {
        let itemCount: Int
        switch self.horizontalSizeClass {
        case .regular:
            itemCount = VSWidth > 672 ? 4 : 3
        default:
            itemCount = 2
        }
        return itemCount
    }
}

struct BuildHeader: View {
    let configuration: TimelinePreviewConfiguration
    let itemCount: Int
    
    var body: some View {
        HStack {
            self.configuration.title
            Spacer()
            self.configuration.action
                .actionStyle(content: { actionConfig in
                    if actionConfig.action.isEmpty {
                        let labelFormat = NSLocalizedString("See All (%d)", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
                        let labelString = String(format: labelFormat, self.itemCount)
                        FioriButton(label: { _ in Label(labelString, systemImage: "chevron.forward").labelStyle(SeeAllActionLabelStyle()) })
                            .fioriButtonStyle(FioriPlainButtonStyle())
                    } else {
                        self.configuration.action
                    }
                })
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
                let dateString = item.formatter.string(from: item.due)
                let timestampFormat = NSLocalizedString("Today, %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
                let timestampString = String(format: timestampFormat, dateString)
                let dateAttributedString = AttributedString(Date.compareTwoDates(first: item.due, second: Date()) == .orderedSame ? timestampString : dateString)
                TimelinePreviewItem(title: AttributedString(item.title), icon: item.icon, timelineNode: item.timelineNode, timestamp: dateAttributedString, isFuture: item.isFuture ?? false, nodeType: item.timelineNode)
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

    struct TitleFioriStyle: TitleStyle {
        let timelinePreviewConfiguration: TimelinePreviewConfiguration
    
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(Color.preferredColor(.secondaryLabel))
                .multilineTextAlignment(.leading)
        }
    }

    struct ActionFioriStyle: ActionStyle {
        let timelinePreviewConfiguration: TimelinePreviewConfiguration
    
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
                .font(.fiori(forTextStyle: .subheadline))
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

struct SeeAllActionLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center) {
            configuration.title
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(Color.preferredColor(.tintColor))
            configuration.icon
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(Color.preferredColor(.secondaryLabel))
        }
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

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear.preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

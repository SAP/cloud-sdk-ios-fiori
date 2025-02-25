import FioriThemeManager
import SwiftUI

struct FilterFeedbackBarItemFont: EnvironmentKey {
    public static let defaultValue: Font = .system(.body)
}

struct FilterFeedbackBarItemSelectedForegroundColor: EnvironmentKey {
    public static let defaultValue: Color = DefaultFilterFeedbackBarItemForegroundColor
}

struct FilterFeedbackBarItemUnselectedForegroundColor: EnvironmentKey {
    public static let defaultValue: Color = .preferredColor(.tertiaryLabel)
}

struct FilterFeedbackBarItemSpacing: EnvironmentKey {
    public static let defaultValue: CGFloat = 6
}

struct FilterFeedbackBarItemPadding: EnvironmentKey {
    public static let defaultValue: CGFloat = 8
}

struct FilterFeedbackBarItemMaxWidth: EnvironmentKey {
    public static let defaultValue: CGFloat = 0
}

struct FilterFeedbackBarItemMinHeight: EnvironmentKey {
    public static let defaultValue: CGFloat = 38
}

struct FilterFeedbackBarItemCornerRadius: EnvironmentKey {
    public static let defaultValue: CGFloat = 10
}

struct FilterFeedbackBarItemBackgroundSelectedFillColor: EnvironmentKey {
    public static let defaultValue: Color = .clear
}

struct FilterFeedbackBarItemBackgroundUnselectedFillColor: EnvironmentKey {
    public static let defaultValue: Color = .preferredColor(.tertiaryFill)
}

struct FilterFeedbackBarItemBackgroundSelectedStrokeColor: EnvironmentKey {
    #if !os(visionOS)
        /// default filter feedbackbar foreground color
        public static let defaultValue: Color = .preferredColor(.tintColor)
    #else
        /// default filter feedbackbar foreground color
        public static let defaultValue: Color = .preferredColor(.primaryLabel)
    #endif
}

struct FilterFeedbackBarItemBackgroundUnselectedStrokeColor: EnvironmentKey {
    public static let defaultValue: Color = .preferredColor(.separatorOpaque)
}

struct FilterFeedbackBarItemBorderWidth: EnvironmentKey {
    public static let defaultValue: CGFloat = 1
}

public extension EnvironmentValues {
    /// Font for filter feedback bar item.
    var filterFeedbackBarItemFont: Font {
        get { self[FilterFeedbackBarItemFont.self] }
        set { self[FilterFeedbackBarItemFont.self] = newValue }
    }
    
    /// Foreground color for filter feedback bar item selected state.
    var filterFeedbackBarItemSelectedForegroundColor: Color {
        get { self[FilterFeedbackBarItemSelectedForegroundColor.self] }
        set { self[FilterFeedbackBarItemSelectedForegroundColor.self] = newValue }
    }
    
    /// Foreground color for filter feedback bar item unselected state.
    var filterFeedbackBarItemUnselectedForegroundColor: Color {
        get { self[FilterFeedbackBarItemUnselectedForegroundColor.self] }
        set { self[FilterFeedbackBarItemUnselectedForegroundColor.self] = newValue }
    }
    
    /// Spacing for filter feedback bar item.
    var filterFeedbackBarItemSpacing: CGFloat {
        get { self[FilterFeedbackBarItemSpacing.self] }
        set { self[FilterFeedbackBarItemSpacing.self] = newValue }
    }
    
    /// Padding for filter feedback bar item.
    var filterFeedbackBarItemPadding: CGFloat {
        get { self[FilterFeedbackBarItemPadding.self] }
        set { self[FilterFeedbackBarItemPadding.self] = newValue }
    }
    
    /// Max width for filter feedback bar item.
    var filterFeedbackBarItemMaxWidth: CGFloat {
        get { self[FilterFeedbackBarItemMaxWidth.self] }
        set { self[FilterFeedbackBarItemMaxWidth.self] = newValue }
    }
    
    /// Minimum height for filter feedback bar item.
    var filterFeedbackBarItemMinHeight: CGFloat {
        get { self[FilterFeedbackBarItemMinHeight.self] }
        set { self[FilterFeedbackBarItemMinHeight.self] = newValue }
    }
    
    /// Corner radius for filter feedback bar item.
    var filterFeedbackBarItemCornerRadius: CGFloat {
        get { self[FilterFeedbackBarItemCornerRadius.self] }
        set { self[FilterFeedbackBarItemCornerRadius.self] = newValue }
    }
    
    /// Fill color for filter feedback bar item backgroud selected state.
    var filterFeedbackBarItemBackgroundSelectedFillColor: Color {
        get { self[FilterFeedbackBarItemBackgroundSelectedFillColor.self] }
        set { self[FilterFeedbackBarItemBackgroundSelectedFillColor.self] = newValue }
    }
    
    /// Fill color for filter feedback bar item backgroud unselected state.
    var filterFeedbackBarItemBackgroundUnselectedFillColor: Color {
        get { self[FilterFeedbackBarItemBackgroundUnselectedFillColor.self] }
        set { self[FilterFeedbackBarItemBackgroundUnselectedFillColor.self] = newValue }
    }
    
    /// Stroke color for filter feedback bar item backgroud selected state.
    var filterFeedbackBarItemBackgroundSelectedStrokeColor: Color {
        get { self[FilterFeedbackBarItemBackgroundSelectedStrokeColor.self] }
        set { self[FilterFeedbackBarItemBackgroundSelectedStrokeColor.self] = newValue }
    }
    
    /// Stroke color for filter feedback bar item backgroud unselected state.
    var filterFeedbackBarItemBackgroundUnselectedStrokeColor: Color {
        get { self[FilterFeedbackBarItemBackgroundUnselectedStrokeColor.self] }
        set { self[FilterFeedbackBarItemBackgroundUnselectedStrokeColor.self] = newValue }
    }
    
    /// Border width for filter feedback bar item.
    var filterFeedbackBarItemBorderWidth: CGFloat {
        get { self[FilterFeedbackBarItemBorderWidth.self] }
        set { self[FilterFeedbackBarItemBorderWidth.self] = newValue }
    }
}

public extension View {
    /// Set font for filter feedback bar item name. Default is `Font.system(.body)`.
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemFont(Font.system(.body))
    /// ```
    /// - Parameter font: The font for filter feedback bar item name.
    /// - Returns: A view with specified font for filter feedback bar item name.
    func filterFeedbackBarItemFont(_ font: Font) -> some View {
        environment(\.filterFeedbackBarItemFont, font)
    }
    
    /// Set foreground color for filter feedback bar item in selected state.
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemSelectedForegroundColor(.red)
    /// ```
    /// - Parameter selectedForegroundColor: The foreground color for filter feedback bar item in selected state.
    /// - Returns: A view with specified foreground color for filter feedback bar item in selected state.
    func filterFeedbackBarItemSelectedForegroundColor(_ selectedForegroundColor: Color) -> some View {
        environment(\.filterFeedbackBarItemSelectedForegroundColor, selectedForegroundColor)
    }
    
    /// Set foreground color for filter feedback bar item in unselected state.
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemUnselectedForegroundColor(.gray)
    /// ```
    /// - Parameter unselectedForegroundColor: The foreground color for filter feedback bar item in unselected state.
    /// - Returns: A view with specified foreground color for filter feedback bar item in unselected state.
    func filterFeedbackBarItemUnselectedForegroundColor(_ unselectedForegroundColor: Color) -> some View {
        environment(\.filterFeedbackBarItemUnselectedForegroundColor, unselectedForegroundColor)
    }
    
    /// Set spacing between the sub views in filter feedback bar item. Default is 6.
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemSpacing(8)
    /// ```
    /// - Parameter spacing: The spacing between the sub views.
    /// - Returns: A view with specified spacing between the sub views in filter feedback bar item.
    func filterFeedbackBarItemSpacing(_ spacing: CGFloat) -> some View {
        environment(\.filterFeedbackBarItemSpacing, spacing)
    }
    
    /// Set padding for filter feedback bar item. Default is 8.
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemPadding(8)
    /// ```
    /// - Parameter padding: The padding for filter feedback bar item.
    /// - Returns: A view with specified padding for filter feedback bar item.
    func filterFeedbackBarItemPadding(_ padding: CGFloat) -> some View {
        environment(\.filterFeedbackBarItemPadding, padding)
    }
    
    /// Set maximum width for filter feedback bar item. Default is 0. When value is greater than 0, maximum width will be set to this value, otherwise `nil`
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemMaxWidth(200)
    /// ```
    /// - Parameter maxWidth: The maximum width for filter feedback bar item.
    /// - Returns: A view with specified maximum width for filter feedback bar item.
    func filterFeedbackBarItemMaxWidth(_ maxWidth: CGFloat) -> some View {
        environment(\.filterFeedbackBarItemMaxWidth, maxWidth)
    }
    
    /// Set minimum height for filter feedback bar item. Default is 38.
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemMinHeight(38)
    /// ```
    /// - Parameter minHeight: The minimum height for filter feedback bar item.
    /// - Returns: A view with specified minimum height for filter feedback bar item.
    func filterFeedbackBarItemMinHeight(_ minHeight: CGFloat) -> some View {
        environment(\.filterFeedbackBarItemMinHeight, minHeight)
    }
    
    /// Set corner radius for filter feedback bar item. Default is 10.
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemCornerRadius(10)
    /// ```
    /// - Parameter cornerRadius: The corner radius for filter feedback bar item.
    /// - Returns: A view with specified corner radius for filter feedback bar item.
    func filterFeedbackBarItemCornerRadius(_ cornerRadius: CGFloat) -> some View {
        environment(\.filterFeedbackBarItemCornerRadius, cornerRadius)
    }
    
    /// Set fill color for filter feedback bar item background in selected state.
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemBackgroundSelectedFillColor(.clear)
    /// ```
    /// - Parameter selectedFillColor: The fill color for filter feedback bar item background in selected state.
    /// - Returns: A view with specified fill color for filter feedback bar item background in selected state.
    func filterFeedbackBarItemBackgroundSelectedFillColor(_ selectedFillColor: Color) -> some View {
        environment(\.filterFeedbackBarItemBackgroundSelectedFillColor, selectedFillColor)
    }
    
    /// Set fill color for filter feedback bar item background in unselected state.
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemBackgroundUnselectedFillColor(.tertiaryFill)
    /// ```
    /// - Parameter unselectedFillColor: The fill color for filter feedback bar item background in unselected state.
    /// - Returns: A view with specified fill color for filter feedback bar item background in unselected state.
    func filterFeedbackBarItemBackgroundUnselectedFillColor(_ unselectedFillColor: Color) -> some View {
        environment(\.filterFeedbackBarItemBackgroundUnselectedFillColor, unselectedFillColor)
    }
    
    /// Set stroke color for filter feedback bar item background in selected state.
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemBackgroundSelectedStrokeColor(.tintColor)
    /// ```
    /// - Parameter selectedStrokeColor: The stroke color for filter feedback bar item background in selected state.
    /// - Returns: A view with specified stroke color for filter feedback bar item background in selected state.
    func filterFeedbackBarItemBackgroundSelectedStrokeColor(_ selectedStrokeColor: Color) -> some View {
        environment(\.filterFeedbackBarItemBackgroundSelectedStrokeColor, selectedStrokeColor)
    }

    /// Set stroke color for filter feedback bar item background in unselected state.
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemBackgroundUnselectedStrokeColor(.separatorOpaque)
    /// ```
    /// - Parameter unselectedStrokeColor: The stroke color for filter feedback bar item background in unselected state.
    /// - Returns: A view with specified stroke color for filter feedback bar item background in unselected state.
    func filterFeedbackBarItemBackgroundUnselectedStrokeColor(_ unselectedStrokeColor: Color) -> some View {
        environment(\.filterFeedbackBarItemBackgroundUnselectedStrokeColor, unselectedStrokeColor)
    }
    
    /// Set border width for filter feedback bar item. Default is 1.
    /// ```swift
    /// @State var items: [[SortFilterItem]] = [[.slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)]]
    ///  FilterFeedbackBar(items: self.$items)
    ///     .filterFeedbackBarItemBorderWidth(1)
    /// ```
    /// - Parameter borderWidth: The border width for filter feedback bar item.
    /// - Returns: A view with specified border width for filter feedback bar item.
    func filterFeedbackBarItemBorderWidth(_ borderWidth: CGFloat) -> some View {
        environment(\.filterFeedbackBarItemBorderWidth, borderWidth)
    }
}

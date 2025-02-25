import FioriThemeManager
import SwiftUI

/// A enum describing the state of an filter form option
public enum FilterFormOptionState {
    /// option is enabled and unselected
    case enabledUnselected
    /// option is enabled and selected
    case enabledSelected
    /// option is disabled and unselected
    case disabledUnselected
    /// option is disabled and selected
    case disabledSelected
}

struct FilterFormOptionAttributes: EnvironmentKey {
    public static let defaultValue: [FilterFormOptionState: [NSAttributedString.Key: Any]] = [:]
}

struct FilterFormOptionMinHeight: EnvironmentKey {
    public static let defaultValue: CGFloat = 44.0
}

struct FilterFormOptionMinTouchHeight: EnvironmentKey {
    public static let defaultValue: CGFloat = 44.0
}

struct FilterFormOptionCornerRadius: EnvironmentKey {
    public static let defaultValue: CGFloat = 16.0
}

struct FilterFormOptionPadding: EnvironmentKey {
    public static let defaultValue: EdgeInsets = .init(top: 4, leading: 4, bottom: 4, trailing: 4)
}

struct FilterFormOptionTitleSpacing: EnvironmentKey {
    public static let defaultValue: CGFloat = 0
}

struct FilterFormOptionsItemSpacing: EnvironmentKey {
    public static let defaultValue: CGFloat = 6
}

struct FilterFormOptionsLineSpacing: EnvironmentKey {
    public static let defaultValue: CGFloat = 6
}

public extension EnvironmentValues {
    /// Attributes for filter form option, include foregroundColor, backgroundColor, font, strokeColor and strokeWidth.
    var filterFormOptionAttributes: [FilterFormOptionState: [NSAttributedString.Key: Any]] {
        get { self[FilterFormOptionAttributes.self] }
        set { self[FilterFormOptionAttributes.self] = newValue }
    }
    
    /// Minimum height for filter form option.
    var filterFormOptionMinHeight: CGFloat {
        get { self[FilterFormOptionMinHeight.self] }
        set { self[FilterFormOptionMinHeight.self] = newValue }
    }
    
    /// Minimum touch area height for filter form option.
    var filterFormOptionMinTouchHeight: CGFloat {
        get { self[FilterFormOptionMinTouchHeight.self] }
        set { self[FilterFormOptionMinTouchHeight.self] = newValue }
    }
    
    /// Corner radius for filter form option.
    var filterFormOptionCornerRadius: CGFloat {
        get { self[FilterFormOptionCornerRadius.self] }
        set { self[FilterFormOptionCornerRadius.self] = newValue }
    }
    
    /// Padding for filter form option.
    var filterFormOptionPadding: EdgeInsets {
        get { self[FilterFormOptionPadding.self] }
        set { self[FilterFormOptionPadding.self] = newValue }
    }
    
    /// Spacing between title and the checkmark for filter form option.
    var filterFormOptionTitleSpacing: CGFloat {
        get { self[FilterFormOptionTitleSpacing.self] }
        set { self[FilterFormOptionTitleSpacing.self] = newValue }
    }
    
    /// Item spacing for filter form options.
    var filterFormOptionsItemSpacing: CGFloat {
        get { self[FilterFormOptionsItemSpacing.self] }
        set { self[FilterFormOptionsItemSpacing.self] = newValue }
    }
    
    /// Line spacing for filter form options.
    var filterFormOptionsLineSpacing: CGFloat {
        get { self[FilterFormOptionsLineSpacing.self] }
        set { self[FilterFormOptionsLineSpacing.self] = newValue }
    }
}

public extension View {
    /// Set attributes for filter form option in different state, include foregroundColor, backgroundColor, font, strokeColor and strokeWidth.
    /// ```swift
    /// FilterFormView(title: "Sort Filter, MultiSelection, EmptySelection, fixed", mandatoryFieldIndicator: self.mandatoryField(), isRequired: false, options: self.sortValueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$sortFilterFixedSelectionValue, buttonSize: .fixed)
    /// .filterFormOptionAttributes([
    ///    .enabledUnselected: [
    ///        .strokeWidth: 1.0,
    ///        .strokeColor: Color.preferredColor(.separator),
    ///        .foregroundColor: Color.preferredColor(.tertiaryLabel),
    ///        .backgroundColor: Color.preferredColor(.tertiaryFill),
    ///        .font: Font.system(.body)
    ///    ]
    /// ])
    /// ```
    /// - Parameter attributes: attributes in different state.
    /// - Returns: A view with specified attributes.
    func filterFormOptionAttributes(_ attributes: [FilterFormOptionState: [NSAttributedString.Key: Any]]) -> some View {
        environment(\.filterFormOptionAttributes, attributes)
    }
    
    /// Set minimum height for filter form option. Default is 44.
    /// ```swift
    /// FilterFormView(title: "Sort Filter, MultiSelection, EmptySelection, fixed", mandatoryFieldIndicator: self.mandatoryField(), isRequired: false, options: self.sortValueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$sortFilterFixedSelectionValue, buttonSize: .fixed)
    /// .filterFormOptionMinHeight(50)
    /// ```
    /// - Parameter minHeight: Minimum height for filter form option.
    /// - Returns: A view with specified minimum height.
    func filterFormOptionMinHeight(_ minHeight: CGFloat) -> some View {
        environment(\.filterFormOptionMinHeight, minHeight)
    }
    
    /// Set minimum touch height for filter form option. Default is 44.
    /// ```swift
    /// FilterFormView(title: "Sort Filter, MultiSelection, EmptySelection, fixed", mandatoryFieldIndicator: self.mandatoryField(), isRequired: false, options: self.sortValueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$sortFilterFixedSelectionValue, buttonSize: .fixed)
    /// .filterFormOptionMinTouchHeight(50)
    /// ```
    /// - Parameter minTouchHeight: Minimum touch height for filter form option.
    /// - Returns: A view with specified minimum touch height.
    func filterFormOptionMinTouchHeight(_ minTouchHeight: CGFloat) -> some View {
        environment(\.filterFormOptionMinTouchHeight, minTouchHeight)
    }
    
    /// Set corner radius for filter form option. Default is 16.
    /// ```swift
    /// FilterFormView(title: "Sort Filter, MultiSelection, EmptySelection, fixed", mandatoryFieldIndicator: self.mandatoryField(), isRequired: false, options: self.sortValueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$sortFilterFixedSelectionValue, buttonSize: .fixed)
    /// .filterFormOptionCornerRadius(16)
    /// ```
    /// - Parameter cornerRadius: Corner radius for filter form option.
    /// - Returns: A view with specified corner radius.
    func filterFormOptionCornerRadius(_ cornerRadius: CGFloat) -> some View {
        environment(\.filterFormOptionCornerRadius, cornerRadius)
    }
    
    /// Set padding for filter form option. Default is EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4).
    /// ```swift
    /// FilterFormView(title: "Sort Filter, MultiSelection, EmptySelection, fixed", mandatoryFieldIndicator: self.mandatoryField(), isRequired: false, options: self.sortValueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$sortFilterFixedSelectionValue, buttonSize: .fixed)
    /// .filterFormOptionPadding(EdgeInsets(top: 4, leading: 9, bottom: 4, trailing: 9))
    /// ```
    /// - Parameter padding: Padding for filter form option.
    /// - Returns: A view with specified padding.
    func filterFormOptionPadding(_ padding: EdgeInsets) -> some View {
        environment(\.filterFormOptionPadding, padding)
    }
    
    /// Set spacing between title and the checkmark for filter form option. Default is 0.
    /// ```swift
    /// FilterFormView(title: "Sort Filter, MultiSelection, EmptySelection, fixed", mandatoryFieldIndicator: self.mandatoryField(), isRequired: false, options: self.sortValueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$sortFilterFixedSelectionValue, buttonSize: .fixed)
    /// .filterFormOptionTitleSpacing(4)
    /// ```
    /// - Parameter spacing: Spacing between title and the checkmark.
    /// - Returns: A view with specified spacing between title and the checkmark.
    func filterFormOptionTitleSpacing(_ spacing: CGFloat) -> some View {
        environment(\.filterFormOptionTitleSpacing, spacing)
    }
    
    /// Set item spacing for filter form options. Default is 6.
    /// ```swift
    /// FilterFormView(title: "Sort Filter, MultiSelection, EmptySelection, fixed", mandatoryFieldIndicator: self.mandatoryField(), isRequired: false, options: self.sortValueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$sortFilterFixedSelectionValue, buttonSize: .fixed)
    /// .filterFormOptionsItemSpacing(16)
    /// ```
    /// - Parameter spacing: Item spacing for filter form options in horizontal direction.
    /// - Returns: A view with specified item spacing for filter form options.
    func filterFormOptionsItemSpacing(_ spacing: CGFloat) -> some View {
        environment(\.filterFormOptionsItemSpacing, spacing)
    }
    
    /// Set line spacing for filter form options. Default is 6.
    /// ```swift
    /// FilterFormView(title: "Sort Filter, MultiSelection, EmptySelection, fixed", mandatoryFieldIndicator: self.mandatoryField(), isRequired: false, options: self.sortValueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$sortFilterFixedSelectionValue, buttonSize: .fixed)
    /// .filterFormOptionsLineSpacing(10)
    /// ```
    /// - Parameter spacing: Line spacing for filter form options in vertical direction.
    /// - Returns: A view with specified line spacing for filter form options.
    func filterFormOptionsLineSpacing(_ spacing: CGFloat) -> some View {
        environment(\.filterFormOptionsLineSpacing, spacing)
    }
}

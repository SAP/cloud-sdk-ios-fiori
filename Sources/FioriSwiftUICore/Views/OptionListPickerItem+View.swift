import FioriThemeManager
import SwiftUI
import UIKit

struct StatusBar {
    private init() {}
    
    static var height: CGFloat {
        #if os(visionOS)
            44 // default statusBar height for visionOS
        #else
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return 0 }
            return windowScene.statusBarManager?.statusBarFrame.height ?? 0
        #endif
    }
}

/// Available OptionListPickerItem layout  types. Use this enum to define item layout type to present.
public enum OptionListPickerItemLayoutType {
    /// Fixed width
    case fixed
    /// Column width will be flexible
    case flexible
}

public extension OptionListPickerItem {
    /// create a filter picker which is used in FilterFeedbackBarItem
    /// - Parameters:
    ///   - value: Indexes for selected values.
    ///   - valueOptions: The data for constructing the list picker.
    ///   - hint: Hint message.
    ///   - title: Title label of the options.
    ///   - itemLayout: Option item layout type.
    ///   - allowsMultipleSelection: A boolean value to indicate to allow multiple selections or not.
    ///   - allowsEmptySelection: A boolean value to indicate to allow empty selections or not.
    ///   - barItemFrame: The frame of the item in FilterFeedbackBar, which toggle to show this view.
    ///   - onTap: The closure when tap on item.
    ///   - updateSearchListPickerHeight: The closure to update the parent view.
    init(value: Binding<[Int]>, valueOptions: [String] = [], title: String? = nil, hint: String? = nil, itemLayout: OptionListPickerItemLayoutType = .fixed, allowsMultipleSelection: Bool = true, allowsEmptySelection: Bool = false, barItemFrame: CGRect = .zero, onTap: ((_ index: Int) -> Void)? = nil, updateSearchListPickerHeight: ((CGFloat) -> Void)? = nil) {
        self.init(value: value, valueOptions: valueOptions, hint: hint, title: title, itemLayout: itemLayout, allowsMultipleSelection: allowsMultipleSelection, allowsEmptySelection: allowsEmptySelection, onTap: onTap)
        
        self.barItemFrame = barItemFrame
        self.updateSearchListPickerHeight = updateSearchListPickerHeight
    }
}

extension OptionListPickerItem: View {
    public var body: some View {
        ScrollView(.vertical) {
            FilterFormView(title: {
                if let title = _title, !title.isEmpty {
                    Text(title)
                        .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                } else {
                    EmptyView()
                }
            }, options: _valueOptions.map { AttributedString($0) }, isEnabled: true, allowsMultipleSelection: _allowsMultipleSelection, allowsEmptySelection: _allowsEmptySelection, value: _value, buttonSize: _itemLayout == .flexible ? .flexible : .fixed, isSingleLine: false) { _ in
            }
            .padding([.leading, .trailing], 16)
            .filterFormOptionsLineSpacing(10)
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.updateSearchListPickerHeight?(self.calculateHeight(scrollViewContentHeight: geometry.size.height))
                        }
                        .onChange(of: geometry.size) {
                            self.updateSearchListPickerHeight?(self.calculateHeight(scrollViewContentHeight: geometry.size.height))
                        }
                }
            )
        }
    }
    
    private func getSafeAreaInsets() -> UIEdgeInsets {
        guard let keyWindow = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
        else {
            return .zero
        }
        return keyWindow.safeAreaInsets
    }
    
    private func calculateHeight(scrollViewContentHeight: CGFloat) -> CGFloat {
        let screenHeight = Screen.bounds.size.height
        let safeAreaInset = self.getSafeAreaInsets()
        var maxScrollViewHeight = screenHeight - self.additionalHeight()
        if UIDevice.current.userInterfaceIdiom != .phone {
            if self.barItemFrame.arrowDirection() == .top {
                maxScrollViewHeight -= (self.barItemFrame.maxY + 80)
            } else if self.barItemFrame.arrowDirection() == .bottom {
                maxScrollViewHeight -= (screenHeight - self.barItemFrame.minY + 80) + safeAreaInset.bottom + 13
            }
        } else {
            maxScrollViewHeight -= (safeAreaInset.top + 30)
        }
        return min(scrollViewContentHeight, maxScrollViewHeight)
    }
    
    private func additionalHeight() -> CGFloat {
        let isNotIphone = UIDevice.current.userInterfaceIdiom != .phone
        var height = 0.0
        height += self.getSafeAreaInsets().bottom + (isNotIphone ? 13 : 16)
        height += isNotIphone ? 50 : 56
        return height
    }
}

/*
 @available(iOS 14.0, macOS 11.0, *)
 struct OptionListPickerLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(OptionListPicker(model: LibraryPreviewData.Person.laurelosborn),
                     category: .control)
     }
 }
 */
/// Option list picker configuration for styling
public struct OptionListPickerButtonConfiguration {
    let leftIcon: AnyView
    let title: AnyView
    let isSelected: Bool
    
    /// :nodoc:
    public init(leftIcon: AnyView, title: AnyView, isSelected: Bool) {
        self.leftIcon = leftIcon
        self.title = title
        self.isSelected = isSelected
    }
}

/// Option list picker style
public protocol OptionListPickerStyle {
    /// :nodoc:
    func makeBody(configuration: OptionListPickerButtonConfiguration) -> AnyView
}

#if !os(visionOS)
    /// Default option list picker foreground color
    public let DefaultOptionListPickerForegroundColor = Color.preferredColor(.tintColor)
#else
    /// Default option list picker foreground color
    public let DefaultOptionListPickerForegroundColor = Color.preferredColor(.primaryLabel)
#endif

/// Default option list picker style
public struct DefaultOptionListPickerStyle: OptionListPickerStyle {
    let font: Font
    let foregroundColorSelected: Color
    let foregroundColorUnselected: Color
    let fillColorSelected: Color
    let fillColorUnselected: Color
    let strokeColorSelected: Color
    let strokeColorUnselected: Color
    let cornerRadius: CGFloat
    let spacing: CGFloat
    let borderWidth: CGFloat
    let minHeight: CGFloat
    let minTouchHeight: CGFloat
    
    /// :nodoc:
    public init(font: Font = .system(.body), foregroundColorSelected: Color = DefaultOptionListPickerForegroundColor, foregroundColorUnselected: Color = .preferredColor(.tertiaryLabel), fillColorSelected: Color = .preferredColor(.secondaryGroupedBackground), fillColorUnselected: Color = .preferredColor(.tertiaryFill), strokeColorSelected: Color = DefaultOptionListPickerForegroundColor, strokeColorUnselected: Color = .preferredColor(.separator), cornerRadius: CGFloat = 16, spacing: CGFloat = 4, borderWidth: CGFloat = 1, minHeight: CGFloat = 44, minTouchHeight: CGFloat = 50) {
        self.font = font
        self.foregroundColorSelected = foregroundColorSelected
        self.foregroundColorUnselected = foregroundColorUnselected
        self.fillColorSelected = fillColorSelected
        self.fillColorUnselected = fillColorUnselected
        self.strokeColorSelected = strokeColorSelected
        self.strokeColorUnselected = strokeColorUnselected
        self.cornerRadius = cornerRadius
        self.spacing = spacing
        self.borderWidth = borderWidth
        self.minHeight = minHeight
        self.minTouchHeight = minTouchHeight
    }
    
    /// :nodoc:
    public func makeBody(configuration: OptionListPickerButtonConfiguration) -> AnyView {
        AnyView(
            HStack(spacing: self.spacing) {
                configuration.leftIcon
                configuration.title
                    .lineLimit(1)
            }
            .padding([.leading, .trailing], configuration.isSelected ? 9 : 20)
            .font(self.font)
            .foregroundColor(configuration.isSelected ? self.foregroundColorSelected : self.foregroundColorUnselected)
            .frame(maxWidth: .infinity, minHeight: self.minHeight)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .fill(configuration.isSelected ? self.fillColorSelected : self.fillColorUnselected)
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .stroke(configuration.isSelected ? self.strokeColorSelected : self.strokeColorUnselected, lineWidth: self.borderWidth)
                }
            )
            .frame(minHeight: self.minTouchHeight)
        )
    }
}

struct OptionListPickerStyleKey: EnvironmentKey {
    static var defaultValue: any OptionListPickerStyle = DefaultOptionListPickerStyle()
}

extension EnvironmentValues {
    var optionListPickerStyle: any OptionListPickerStyle {
        get {
            self[OptionListPickerStyleKey.self]
        }
        set {
            self[OptionListPickerStyleKey.self] = newValue
        }
    }
}

/// Experimental option list picker styling
public extension View {
    /// Experimental option list picker styling
    func optionListPickerStyle(_ style: some OptionListPickerStyle) -> some View {
        self.environment(\.optionListPickerStyle, style)
    }
    
    /// Experimental option list picker styling
    func optionListPickerStyle(font: Font = .system(.body), foregroundColorSelected: Color = .preferredColor(.tintColor), foregroundColorUnselected: Color = .preferredColor(.tertiaryLabel), fillColorSelected: Color = .preferredColor(.primaryFill), fillColorUnselected: Color = .preferredColor(.secondaryFill), strokeColorSelected: Color = .preferredColor(.tintColor), strokeColorUnselected: Color = .preferredColor(.separator), cornerRadius: CGFloat = 16, spacing: CGFloat = 6, borderWidth: CGFloat = 1, minHeight: CGFloat = 44) -> some View {
        self.environment(\.optionListPickerStyle,
                         DefaultOptionListPickerStyle(font: font, foregroundColorSelected: foregroundColorSelected, foregroundColorUnselected: foregroundColorUnselected, fillColorSelected: fillColorSelected, fillColorUnselected: fillColorUnselected, strokeColorSelected: strokeColorSelected, strokeColorUnselected: strokeColorUnselected, cornerRadius: cornerRadius, spacing: spacing, borderWidth: borderWidth, minHeight: minHeight))
    }
}

#Preview {
    VStack {
        Spacer()
        OptionListPickerItem(value: Binding<[Int]>(get: { [0, 1, 2] }, set: { print($0) }), valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review review", "Accepted", "Rejected"], hint: nil)
            .frame(width: 393)
        Spacer()
        OptionListPickerItem(value: Binding<[Int]>(get: { [0, 1, 2] }, set: { print($0) }), valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review", "Accepted", "Rejected"], hint: nil)
            .optionListPickerStyle(font: .title, foregroundColorSelected: Color.red, strokeColorSelected: Color.red, cornerRadius: 25)
            .frame(width: 393)
        Spacer()
    }
}

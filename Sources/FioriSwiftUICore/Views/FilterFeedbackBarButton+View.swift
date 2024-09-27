import FioriThemeManager
import SwiftUI

extension Fiori {
    enum FilterFeedbackBarButton {
        typealias LeftIcon = EmptyModifier
        typealias LeftIconCumulative = EmptyModifier
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier

        static let leftIcon = LeftIcon()
        static let title = Title()
        static let leftIconCumulative = LeftIconCumulative()
        static let titleCumulative = TitleCumulative()
    }
}

extension FilterFeedbackBarButton: View {
    public var body: some View {
        optionListPickerStyle.makeBody(configuration: OptionListPickerButtonConfiguration(leftIcon: AnyView(leftIcon), title: AnyView(title), isSelected: _isSelected))
    }
}

/*
 @available(iOS 14.0, macOS 11.0, *)
 struct OptionChipLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(OptionChip(model: LibraryPreviewData.Person.laurelosborn),
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
    public init(font: Font = .system(.body), foregroundColorSelected: Color = .preferredColor(.tintColor), foregroundColorUnselected: Color = .preferredColor(.tertiaryLabel), fillColorSelected: Color = .preferredColor(.secondaryGroupedBackground), fillColorUnselected: Color = .preferredColor(.tertiaryFill), strokeColorSelected: Color = .preferredColor(.tintColor), strokeColorUnselected: Color = .preferredColor(.separator), cornerRadius: CGFloat = 16, spacing: CGFloat = 4, borderWidth: CGFloat = 1, minHeight: CGFloat = 44, minTouchHeight: CGFloat = 50) {
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

/// Experiemental option list picker styling
public extension View {
    /// Experiemental option list picker styling
    func optionListPickerStyle(_ style: some OptionListPickerStyle) -> some View {
        self.environment(\.optionListPickerStyle, style)
    }
    
    /// Experiemental option list picker styling
    func optionListPickerStyle(font: Font = .system(.body), foregroundColorSelected: Color = .preferredColor(.tintColor), foregroundColorUnselected: Color = .preferredColor(.tertiaryLabel), fillColorSelected: Color = .preferredColor(.primaryFill), fillColorUnselected: Color = .preferredColor(.secondaryFill), strokeColorSelected: Color = .preferredColor(.tintColor), strokeColorUnselected: Color = .preferredColor(.separator), cornerRadius: CGFloat = 16, spacing: CGFloat = 6, borderWidth: CGFloat = 1, minHeight: CGFloat = 44) -> some View {
        self.environment(\.optionListPickerStyle,
                         DefaultOptionListPickerStyle(font: font, foregroundColorSelected: foregroundColorSelected, foregroundColorUnselected: foregroundColorUnselected, fillColorSelected: fillColorSelected, fillColorUnselected: fillColorUnselected, strokeColorSelected: strokeColorSelected, strokeColorUnselected: strokeColorUnselected, cornerRadius: cornerRadius, spacing: spacing, borderWidth: borderWidth, minHeight: minHeight))
    }
}

#Preview {
    VStack {
        Spacer()
        
        FilterFeedbackBarButton(leftIcon: Image(systemName: "airplane"), title: "Airplane", isSelected: true)
        FilterFeedbackBarButton(leftIcon: Image(systemName: "airplane"), title: "Airplane", isSelected: false)
        FilterFeedbackBarButton(title: "Ship", isSelected: true)
        FilterFeedbackBarButton(title: "Ship", isSelected: false)
        FilterFeedbackBarButton(leftIcon: Image(systemName: "bus"), title: "Bus", isSelected: true)
        FilterFeedbackBarButton(leftIcon: Image(systemName: "bus"), title: "Bus", isSelected: false)
        
        Spacer()
        
        FilterFeedbackBarButton(leftIcon: Image(systemName: "airplane"), title: "Air Plane", isSelected: true)
            .optionListPickerStyle(font: .largeTitle, foregroundColorSelected: .red, strokeColorSelected: .red, cornerRadius: 25)
        FilterFeedbackBarButton(leftIcon: Image(systemName: "airplane"), title: "Air Plane", isSelected: false)
            .optionListPickerStyle(font: .footnote, foregroundColorUnselected: .green, strokeColorSelected: .black)
            .optionListPickerStyle(cornerRadius: 16)
        FilterFeedbackBarButton(title: "Ship", isSelected: true)
            .optionListPickerStyle(fillColorSelected: .yellow)
        FilterFeedbackBarButton(title: "Ship", isSelected: false)
            .optionListPickerStyle(fillColorUnselected: .gray)
        FilterFeedbackBarButton(leftIcon: Image(systemName: "bus"), title: "Blue Bus", isSelected: true)
            .optionListPickerStyle(cornerRadius: 20)
        FilterFeedbackBarButton(leftIcon: Image(systemName: "bus"), title: "Gray Bus", isSelected: false)
            .optionListPickerStyle(cornerRadius: 20)
        
        Spacer()
    }
}

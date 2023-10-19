/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum OptionChip {
        typealias LeftIcon = EmptyModifier
        typealias LeftIconCumulative = EmptyModifier
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier

        // TODO: - substitute type-specific ViewModifier for EmptyModifier
        /*
             // replace `typealias Subtitle = EmptyModifier` with:

             struct Subtitle: ViewModifier {
                 func body(content: Content) -> some View {
                     content
                         .font(.body)
                         .foregroundColor(.preferredColor(.primary3))
                 }
             }
         */
        static let leftIcon = LeftIcon()
        static let title = Title()
        static let leftIconCumulative = LeftIconCumulative()
        static let titleCumulative = TitleCumulative()
    }
}

extension OptionChip: View {
    public var body: some View {
        optionChipStyle.makeBody(configuration: OptionChipConfiguration(leftIcon: AnyView(leftIcon), title: AnyView(title), isSelected: _isSelected))
    }
}

/*
 // FIXME: - Implement OptionChip specific LibraryContentProvider

 @available(iOS 14.0, macOS 11.0, *)
 struct OptionChipLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(OptionChip(model: LibraryPreviewData.Person.laurelosborn),
                     category: .control)
     }
 }
 */

public struct OptionChipConfiguration {
    let leftIcon: AnyView
    let title: AnyView
    let isSelected: Bool
    
    public init(leftIcon: AnyView, title: AnyView, isSelected: Bool) {
        self.leftIcon = leftIcon
        self.title = title
        self.isSelected = isSelected
    }
}

public protocol OptionChipStyle {
    associatedtype Body = View
        
    typealias Configuration = OptionChipConfiguration
    
    func makeBody(configuration: Self.Configuration) -> AnyView // Self.Body
}

public struct DefaultOptionChipStyle: OptionChipStyle {
    let font: Font
    let foregroundColorSelected: Color
    let foregroundColorUnselected: Color
    let fillColorSelected: Color
    let fillColorUnselected: Color
    let strokeColorSelected: Color
    let strokeColorUnselected: Color
    let cornerRadius: CGFloat
    let spacing: CGFloat
    let padding: CGFloat
    let borderWidth: CGFloat
    let minHeight: CGFloat
    
    public init(font: Font = .system(.body), foregroundColorSelected: Color = .preferredColor(.tintColor), foregroundColorUnselected: Color = .preferredColor(.tertiaryLabel), fillColorSelected: Color = .preferredColor(.primaryFill), fillColorUnselected: Color = .preferredColor(.secondaryFill), strokeColorSelected: Color = .preferredColor(.tintColor), strokeColorUnselected: Color = .preferredColor(.separator), cornerRadius: CGFloat = 10, spacing: CGFloat = 6, padding: CGFloat = 8, borderWidth: CGFloat = 1, minHeight: CGFloat = 38) {
        self.font = font
        self.foregroundColorSelected = foregroundColorSelected
        self.foregroundColorUnselected = foregroundColorUnselected
        self.fillColorSelected = fillColorSelected
        self.fillColorUnselected = fillColorUnselected
        self.strokeColorSelected = strokeColorSelected
        self.strokeColorUnselected = strokeColorUnselected
        self.cornerRadius = cornerRadius
        self.spacing = spacing
        self.padding = padding
        self.borderWidth = borderWidth
        self.minHeight = minHeight
    }
    
    public func makeBody(configuration: Configuration) -> AnyView {
        AnyView(
            HStack(spacing: self.spacing) {
                configuration.leftIcon
                configuration.title
            }
            .font(self.font)
            .foregroundColor(configuration.isSelected ? self.foregroundColorSelected : self.foregroundColorUnselected)
            .padding(self.padding)
            .frame(maxWidth: .infinity)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(configuration.isSelected ? fillColorSelected : fillColorUnselected)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(configuration.isSelected ? strokeColorSelected : strokeColorUnselected, lineWidth: borderWidth)
                }
            )
        )
    }
}

struct OptionChipStyleKey: EnvironmentKey {
    static var defaultValue: any OptionChipStyle = DefaultOptionChipStyle()
}

extension EnvironmentValues {
    var optionChipStyle: any OptionChipStyle {
        get {
            self[OptionChipStyleKey.self]
        }
        set {
            self[OptionChipStyleKey.self] = newValue
        }
    }
}

public extension View {
    func optionChipStyle<S>(_ style: S) -> some View where S: OptionChipStyle {
        self.environment(\.optionChipStyle, style)
    }
    
    func optionChipStyle(font: Font = .system(.body), foregroundColorSelected: Color = .preferredColor(.tintColor), foregroundColorUnselected: Color = .preferredColor(.tertiaryLabel), fillColorSelected: Color = .preferredColor(.primaryFill), fillColorUnselected: Color = .preferredColor(.secondaryFill), strokeColorSelected: Color = .preferredColor(.tintColor), strokeColorUnselected: Color = .preferredColor(.separator), cornerRadius: CGFloat = 10, spacing: CGFloat = 6, padding: CGFloat = 8, borderWidth: CGFloat = 1, minHeight: CGFloat = 38) -> some View {
        self.environment(\.optionChipStyle,
                         DefaultOptionChipStyle(font: font, foregroundColorSelected: foregroundColorSelected, foregroundColorUnselected: foregroundColorUnselected, fillColorSelected: fillColorSelected, fillColorUnselected: fillColorUnselected, strokeColorSelected: strokeColorSelected, strokeColorUnselected: strokeColorUnselected, cornerRadius: cornerRadius, spacing: spacing, padding: padding, borderWidth: borderWidth, minHeight: minHeight))
    }
}

#Preview {
    VStack {
        Spacer()
        
        OptionChip(leftIcon: Image(systemName: "airplane"), title: "Airplane", isSelected: true)
        OptionChip(leftIcon: Image(systemName: "airplane"), title: "Airplane", isSelected: false)
        OptionChip(title: "Ship", isSelected: true)
        OptionChip(title: "Ship", isSelected: false)
        OptionChip(leftIcon: Image(systemName: "bus"), title: "Bus", isSelected: true)
        OptionChip(leftIcon: Image(systemName: "bus"), title: "Bus", isSelected: false)
        
        Spacer()
        
        OptionChip(leftIcon: Image(systemName: "airplane"), title: "Air Plane", isSelected: true)
            .optionChipStyle(font: .largeTitle, foregroundColorSelected: .red, strokeColorSelected: .red, cornerRadius: 25)
        OptionChip(leftIcon: Image(systemName: "airplane"), title: "Air Plane", isSelected: false)
            .optionChipStyle(font: .footnote, foregroundColorUnselected: .green, strokeColorSelected: .black)

            .optionChipStyle(cornerRadius: 16)
        OptionChip(title: "Ship", isSelected: true)
            .optionChipStyle(fillColorSelected: .yellow)
        OptionChip(title: "Ship", isSelected: false)
            .optionChipStyle(fillColorUnselected: .gray)
        OptionChip(leftIcon: Image(systemName: "bus"), title: "Blue Bus", isSelected: true)
            .optionChipStyle(cornerRadius: 20)
        OptionChip(leftIcon: Image(systemName: "bus"), title: "Gray Bus", isSelected: false)
            .optionChipStyle(cornerRadius: 20)
        
        Spacer()
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct FilterFormViewBaseStyle: FilterFormViewStyle {
    @State private var titleWidth: CGFloat = 0.0
    @State private var optionsContainerWidth: CGFloat = 0.0
    @State private var filterFormContainerWidth: CGFloat = 0.0
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.filterFormOptionAttributes) var filterFormOptionAttributes
    @Environment(\.filterFormOptionMinHeight) var filterFormOptionMinHeight
    @Environment(\.filterFormOptionsItemSpacing) var filterFormOptionsItemSpacing
    @Environment(\.filterFormOptionsLineSpacing) var filterFormOptionsLineSpacing
    @Environment(\.filterFormOptionMinTouchHeight) var filterFormOptionMinTouchHeight
    @Environment(\.filterFormOptionCornerRadius) var filterFormOptionCornerRadius
    @Environment(\.filterFormOptionPadding) var filterFormOptionPadding
    @Environment(\.filterFormOptionTitleSpacing) var filterFormOptionTitleSpacing
    
    private var filterFormOptionDefaultAttributes: [FilterFormOptionState: [NSAttributedString.Key: Any]] = [
        .enabledUnselected: [
            .foregroundColor: Color.preferredColor(.secondaryLabel),
            .backgroundColor: Color.preferredColor(.tertiaryFill),
            .strokeColor: Color.preferredColor(.separator),
            .strokeWidth: 0.5,
            .font: Font.fiori(forTextStyle: .subheadline)
        ],
        .enabledSelected: [
            .foregroundColor: Color.preferredColor(.tintColor),
            .backgroundColor: Color.clear,
            .strokeColor: Color.preferredColor(.tintColor),
            .strokeWidth: 1.0,
            .font: Font.fiori(forTextStyle: .subheadline)
        ],
        .disabledUnselected: [
            .foregroundColor: Color.preferredColor(.quaternaryLabel),
            .backgroundColor: Color.preferredColor(.quaternaryFill),
            .strokeColor: Color.preferredColor(.quaternaryLabel),
            .strokeWidth: 0.5,
            .font: Font.fiori(forTextStyle: .subheadline)
        ],
        .disabledSelected: [
            .foregroundColor: Color.preferredColor(.quaternaryLabel),
            .backgroundColor: Color.clear,
            .strokeColor: Color.preferredColor(.quaternaryLabel),
            .strokeWidth: 1.0,
            .font: Font.fiori(forTextStyle: .subheadline)
        ]
    ]
    
    public func makeBody(_ configuration: FilterFormViewConfiguration) -> some View {
        // Add default layout here
        ZStack {
            // This stack is used to calculate the container's size
            HStack {
                Text("")
                Spacer()
            }
            .sizeReader { size in
                self.filterFormContainerWidth = size.width
            }
            .opacity(0)
            
            if self.filterFormContainerWidth > self.titleWidth + self.optionsContainerWidth + 8,
               configuration.isSingleLine
            {
                HStack(alignment: .center) {
                    self.TitleContainerView(configuration)
                    Spacer()
                    self.FilterFormViewLayoutView(configuration, dynamicTypeSize: self.dynamicTypeSize, horizontalSizeClass: self.horizontalSizeClass)
                }
            } else {
                VStack(alignment: .leading, spacing: configuration.title.isEmpty ? 0 : 8) {
                    HStack {
                        self.TitleContainerView(configuration)
                        Spacer()
                    }
                    self.FilterFormViewLayoutView(configuration, dynamicTypeSize: self.dynamicTypeSize, horizontalSizeClass: self.horizontalSizeClass)
                }
            }
        }
        .informationView(isPresented: .constant(!(configuration.errorMessage?.characters.isEmpty ?? true)), description: configuration.errorMessage ?? "")
        .informationViewStyle(.error)
    }
    
    @ViewBuilder
    func bodyContent(_ configuration: FilterFormViewConfiguration) -> some View {}
    
    @ViewBuilder
    func TitleContainerView(_ configuration: FilterFormViewConfiguration) -> some View {
        configuration.title
            .sizeReader { size in
                self.titleWidth = size.width
            }
    }
    
    @ViewBuilder
    func FilterFormViewLayoutView(_ configuration: FilterFormViewConfiguration, dynamicTypeSize: DynamicTypeSize, horizontalSizeClass: UserInterfaceSizeClass?) -> some View {
        FilterFormViewLayout(buttonSize: configuration.buttonSize, dynamicTypeSize: dynamicTypeSize, horizontalSizeClass: horizontalSizeClass, filterFormOptionsItemSpacing: self.filterFormOptionsItemSpacing, filterFormOptionsLineSpacing: self.filterFormOptionsLineSpacing) {
            ForEach(configuration.options.indices, id: \.self) { index in
                let isSelected = configuration.value.contains(index)
                let option = configuration.options[index]
                
                ZStack {
                    // This stack is used to calculate the container's size with checkmark image
                    HStack(alignment: .center, spacing: self.filterFormOptionTitleSpacing, content: {
                        if !configuration.checkmarkImage.isEmpty {
                            configuration.checkmarkImage
                        }
                        Text(option)
                            .lineLimit(1)
                    })
                    .opacity(0)
                    
                    HStack(alignment: .center, spacing: self.filterFormOptionTitleSpacing, content: {
                        if isSelected, !configuration.checkmarkImage.isEmpty {
                            configuration.checkmarkImage
                        }
                        Text(option)
                            .lineLimit(1)
                    })
                }
                .padding(self.filterFormOptionPadding)
                .foregroundStyle(self.optionsAttributesColor(isSelected, isEnabled: configuration.isEnabled, key: .foregroundColor))
                .font(self.optionsAttributesFont(isSelected, isEnabled: configuration.isEnabled))
                .frame(minHeight: self.filterFormOptionMinHeight)
                .frame(maxWidth: .infinity) // set maxWidth with .infinity can make the view use the proposal size
                .background(self.optionsAttributesColor(isSelected, isEnabled: configuration.isEnabled, key: .backgroundColor))
                .clipShape(RoundedRectangle(cornerRadius: self.filterFormOptionCornerRadius))
                .overlay {
                    RoundedRectangle(cornerRadius: self.filterFormOptionCornerRadius)
                        .stroke(self.optionsAttributesColor(isSelected, isEnabled: configuration.isEnabled, key: .strokeColor), lineWidth: self.optionsStrokeWidth(isSelected, isEnabled: configuration.isEnabled))
                }
                .frame(minHeight: self.filterFormOptionMinTouchHeight)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.handleItemClick(configuration, index: index)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(
                    Text("\(option), \((isSelected ? "selected" : "not selected").localizedFioriString())")
                )
            }
        }
        .sizeReader { size in
            self.optionsContainerWidth = size.width
        }
    }
    
    func optionsAttributesColor(_ isSelected: Bool, isEnabled: Bool, key: NSAttributedString.Key) -> Color {
        var state = FilterFormOptionState.enabledUnselected
        if isEnabled {
            state = isSelected ? .enabledSelected : .enabledUnselected
        } else {
            state = isSelected ? .disabledSelected : .disabledUnselected
        }
        
        if let attributes = self.filterFormOptionAttributes[state],
           let color = attributes[key] as? Color
        {
            return color
        } else if let attributes = self.filterFormOptionDefaultAttributes[state],
                  let color = attributes[key] as? Color
        {
            return color
        } else {
            return .clear
        }
    }
    
    func optionsAttributesFont(_ isSelected: Bool, isEnabled: Bool) -> Font {
        var state = FilterFormOptionState.enabledUnselected
        if isEnabled {
            state = isSelected ? .enabledSelected : .enabledUnselected
        } else {
            state = isSelected ? .disabledSelected : .disabledUnselected
        }
        
        if let attributes = self.filterFormOptionAttributes[state],
           let font = attributes[.font] as? Font
        {
            return font
        } else if let attributes = self.filterFormOptionDefaultAttributes[state],
                  let font = attributes[.font] as? Font
        {
            return font
        } else {
            return .fiori(forTextStyle: .subheadline)
        }
    }
    
    func optionsStrokeWidth(_ isSelected: Bool, isEnabled: Bool) -> CGFloat {
        var state = FilterFormOptionState.enabledUnselected
        if isEnabled {
            state = isSelected ? .enabledSelected : .enabledUnselected
        } else {
            state = isSelected ? .disabledSelected : .disabledUnselected
        }
        
        if let attributes = self.filterFormOptionAttributes[state],
           let strokeWidth = attributes[.strokeWidth]
        {
            return CGFloat(Float("\(strokeWidth)") ?? 1.0)
        } else if let attributes = self.filterFormOptionDefaultAttributes[state],
                  let strokeWidth = attributes[.strokeWidth]
        {
            return CGFloat(Float("\(strokeWidth)") ?? 1.0)
        } else {
            return 1
        }
    }
    
    func handleItemClick(_ configuration: FilterFormViewConfiguration, index: Int) {
        if configuration.value.contains(index) {}
        if let firstIndex = configuration.value.firstIndex(of: index) {
            if configuration.value.count == 1,
               !configuration.allowsEmptySelection
            {
                return
            }
            configuration.value.remove(at: firstIndex)
        } else {
            if !configuration.allowsMultipleSelection {
                configuration.value.removeAll()
            }
            configuration.value.append(index)
        }
        configuration.onValueChange?(configuration.value)
    }
}

// Default fiori styles
extension FilterFormViewFioriStyle {
    struct ContentFioriStyle: FilterFormViewStyle {
        func makeBody(_ configuration: FilterFormViewConfiguration) -> some View {
            FilterFormView(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let filterFormViewConfiguration: FilterFormViewConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                .foregroundStyle(Color.preferredColor(self.filterFormViewConfiguration.isEnabled ? .primaryLabel : .quaternaryLabel))
        }
    }

    struct OptionsFioriStyle: OptionsStyle {
        let filterFormViewConfiguration: FilterFormViewConfiguration

        func makeBody(_ configuration: OptionsConfiguration) -> some View {
            Options(configuration)
            // Add default style for Options
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct FormViewFioriStyle: FormViewStyle {
        let filterFormViewConfiguration: FilterFormViewConfiguration

        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
            // Add default style for FormView
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

private struct FilterFormViewLayout: Layout {
    struct CacheData {
        var itemMaxWidth: CGFloat = 0.0
        var columns: [CGRect]
        
        mutating func clear() {
            self.itemMaxWidth = 0.0
            self.columns.removeAll()
        }
    }
    
    var buttonSize: FilterButtonSize
    var dynamicTypeSize: DynamicTypeSize
    var horizontalSizeClass: UserInterfaceSizeClass?
    var filterFormOptionsItemSpacing: CGFloat
    var filterFormOptionsLineSpacing: CGFloat
    static let minItemWidth: CGFloat = 44
    
    func makeCache(subviews: Subviews) -> CacheData {
        CacheData(columns: [])
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {
        guard let availableWidth = proposal.width, availableWidth > 0 else {
            return .zero
        }
        cache.clear()
        
        var totalHeight = 0.0
        var calculatedSize: CGSize = .zero
        for subview in subviews {
            var size: CGSize
            if self.buttonSize == .fixed {
                var itemWidth = (availableWidth - self.filterFormOptionsItemSpacing) / 2.0
                if self.dynamicTypeSize.isAccessibilitySize,
                   self.dynamicTypeSize >= .accessibility2,
                   self.horizontalSizeClass == .compact
                {
                    itemWidth = availableWidth
                }
                calculatedSize = subview.sizeThatFits(ProposedViewSize(width: itemWidth, height: nil))
                calculatedSize.width = itemWidth
            } else {
                calculatedSize = subview.sizeThatFits(.unspecified)
                
                if calculatedSize.width > availableWidth {
                    // when the size width exceeds the availableWidth, recalculate
                    calculatedSize = subview.sizeThatFits(ProposedViewSize(width: availableWidth, height: nil))
                }
            }
            size = CGSize(width: max(calculatedSize.width, FilterFormViewLayout.minItemWidth), height: calculatedSize.height)
            
            cache.itemMaxWidth = max(cache.itemMaxWidth, size.width)
            
            cache.columns.append(CGRect(origin: .zero, size: size))
        }
        
        var maxWidth = 0.0
        var hasMoreLines = false
        
        var lastItemRect: CGRect = .zero
        for index in cache.columns.indices {
            var rect = cache.columns[index]
            if self.buttonSize != .flexible {
                rect.size.width = cache.itemMaxWidth
            }
            if index == 0 {
                totalHeight += rect.size.height
            } else {
                if rect.size.width + self.filterFormOptionsItemSpacing + lastItemRect.maxX > availableWidth {
                    rect.origin = CGPoint(x: 0, y: lastItemRect.origin.y + lastItemRect.size.height + self.filterFormOptionsLineSpacing)
                    // when spare space is not enough, place the item to the new line
                    totalHeight += rect.size.height
                    hasMoreLines = true
                    if index > 1 {
                        totalHeight += self.filterFormOptionsLineSpacing
                    }
                } else {
                    rect.origin = CGPoint(x: lastItemRect.maxX + self.filterFormOptionsItemSpacing, y: lastItemRect.minY)
                }
            }
            lastItemRect = rect
            cache.columns[index] = rect
            
            maxWidth = rect.maxX
        }
        
        return CGSize(width: hasMoreLines ? availableWidth : maxWidth, height: totalHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        guard let containerWidth = proposal.width, containerWidth > 0 else {
            return
        }
        
        for (index, subview) in subviews.enumerated() where index < cache.columns.count {
            let itemRect = cache.columns[index]
            let pt = CGPoint(x: itemRect.origin.x + bounds.origin.x, y: itemRect.origin.y + bounds.origin.y)
            subview.place(at: pt, proposal: ProposedViewSize(itemRect.size))
        }
    }
}

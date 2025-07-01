import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SortCriterionBaseStyle: SortCriterionStyle {
    @Environment(\.sizeCategory) private var sizeCategory
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject private var modelObject: OrderPickerModelObject
    
    public func makeBody(_ configuration: SortCriterionConfiguration) -> some View {
        HStack(spacing: 0) {
            HStack(alignment: .top, spacing: 0) {
                Checkmark(checkmark: configuration.data.selectedIcon ?? Image(systemName: "checkmark"))
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: self.getWidth(compactWidth: 8)))
                    .setHidden(!configuration.data.isSelected)

                if self.sizeCategory.isAccessibilityCategory {
                    self.configureMainStack(configuration, isVertical: true)
                } else {
                    ViewThatFits {
                        self.configureMainStack(configuration, isVertical: false)
                    }
                }
            }
            .contentShape(Rectangle())
            .background(self.modelObject.highlightedItemID == configuration.data.id ? Color.preferredColor(.quaternaryFill) : Color.clear)
            .gesture(
                LongPressGesture(minimumDuration: 0.2)
                    .onEnded { _ in
                        self.modelObject.highlightedItemID = configuration.data.id
                    }
            )
        }
        .contentShape(Rectangle())
        .onTapGesture {
            let trueCount = self.modelObject.items.filter(\.isSelected).count
            
            if !configuration.data.isSelected || trueCount > (self.modelObject.configuration.isAtLeastOneSelected ? 1 : 0) {
                configuration.data.isSelected.toggle()
                if let index = self.modelObject.items.firstIndex(where: { $0.id == configuration.data.id }) {
                    self.dataChangeHandler(OrderPickerItemModel.Change.selected(index: index, isSelected: configuration.data.isSelected))
                }
                self.modelObject.highlightedItemID = nil
            }
        }
    }
    
    func configureMainStack(_ configuration: SortCriterionConfiguration, isVertical: Bool) -> some View {
        @EnvironmentObject var modelObject: OrderPickerModelObject
        let mainStack = isVertical ? AnyLayout(VStackLayout(alignment: .leading, spacing: 0)) : AnyLayout(HStackLayout())
        return mainStack {
            Title(title: configuration.data.criterion)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing, self.getWidth(compactWidth: 16))
            
            if configuration.data.isSelected {
                ZStack {
                    if configuration.data.isSelected {
                        Subtitle(subtitle: configuration.data.isAscending ? configuration.data.ascendingText : configuration.data.descendingText)
                            .ifApply(isVertical) {
                                $0.frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .ifApply(!isVertical) {
                                $0.frame(minWidth: 44, alignment: .trailing)
                            }
                    }
                }
                .frame(maxHeight: .infinity)
                .padding(.trailing, self.getWidth(compactWidth: 6))
                .contentShape(Rectangle())
                .onTapGesture {
                    configuration.data.isAscending.toggle()
                    if let index = self.modelObject.items.firstIndex(where: { $0.id == configuration.data.id }) {
                        self.dataChangeHandler(OrderPickerItemModel.Change.ascending(index: index, isAscending: configuration.data.isAscending))
                    }
                    self.modelObject.highlightedItemID = nil
                }
            }
        }
    }
    
    func dataChangeHandler(_ change: OrderPickerItemModel.Change) {
        if let onChanged = self.modelObject.configuration.onChangeHandler {
            onChanged(change, self.modelObject.items)
        }
    }
    
    func getWidth(compactWidth: CGFloat) -> CGFloat {
        let width: CGFloat = self.horizontalSizeClass == .regular ? (compactWidth + 4) : compactWidth
        return width
    }
}

// Default fiori styles
extension SortCriterionFioriStyle {
    struct ContentFioriStyle: SortCriterionStyle {
        @EnvironmentObject private var modelObject: OrderPickerModelObject
        func makeBody(_ configuration: SortCriterionConfiguration) -> some View {
            SortCriterion(configuration)
                .foregroundStyle(Color.preferredColor(self.modelObject.configuration.controlState == .disabled ? .quaternaryLabel : .primaryLabel))
        }
    }

    struct CheckmarkFioriStyle: CheckmarkStyle {
        let sortCriterionConfiguration: SortCriterionConfiguration
        @EnvironmentObject private var modelObject: OrderPickerModelObject
    
        func makeBody(_ configuration: CheckmarkConfiguration) -> some View {
            Checkmark(configuration)
                .font(.fiori(forTextStyle: .body, weight: .medium))
                .foregroundStyle(Color.preferredColor(self.modelObject.configuration.controlState == .disabled ? .quaternaryLabel : .tintColor))
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let sortCriterionConfiguration: SortCriterionConfiguration
        @EnvironmentObject private var modelObject: OrderPickerModelObject
    
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .multilineTextAlignment(.leading)
                .frame(maxHeight: .infinity)
                .foregroundStyle(Color.preferredColor(self.modelObject.configuration.controlState == .disabled ? .quaternaryLabel : .primaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        let sortCriterionConfiguration: SortCriterionConfiguration
        @EnvironmentObject private var modelObject: OrderPickerModelObject
    
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color.preferredColor(self.modelObject.configuration.controlState == .disabled ? .quaternaryLabel : .tintColor))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }
    }
}

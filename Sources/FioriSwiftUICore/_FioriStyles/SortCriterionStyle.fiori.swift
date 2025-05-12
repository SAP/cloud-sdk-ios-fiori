import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SortCriterionBaseStyle: SortCriterionStyle {
    @Environment(\.sizeCategory) private var sizeCategory
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @EnvironmentObject private var modelObject: OrderPickerModelObject
    @State private var originalModelObject: [OrderPickerItemModel] = []
        
    public func makeBody(_ configuration: SortCriterionConfiguration) -> some View {
        VStack(spacing: 0) {
            HStack {
                HStack(alignment: .top) {
                    Checkmark(checkmark: configuration.data.selectedIcon ?? Image(systemName: "checkmark"))
                        .frame(minHeight: 44)
                        .padding(EdgeInsets(top: 0, leading: self.getWidth(compactWidth: 16), bottom: 0, trailing: self.getWidth(compactWidth: 8)))
                        .setHidden(!configuration.data.isSelected)
                                    
                    if self.sizeCategory.isAccessibilityCategory {
                        self.configureMainStack(configuration, isVertical: true)
                    } else {
                        ViewThatFits {
                            self.configureMainStack(configuration, isVertical: false)
                        }
                    }
                }
                .frame(minHeight: 44)
                .contentShape(Rectangle())
                .background(self.modelObject.highlightedItemID == configuration.data.id ? Color.preferredColor(.quaternaryFill) : Color.clear)
                .gesture(
                    LongPressGesture(minimumDuration: 0.2)
                        .onEnded { _ in
                            self.modelObject.highlightedItemID = configuration.data.id
                        }
                )
                
                DraggableImage(item: configuration.$data, modelObject: self.modelObject, sortCriterionBaseStyle: self)
            }.accessibilityElement(children: .combine)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    let trueCount = self.modelObject.items.filter(\.isSelected).count
                    if !configuration.data.isSelected || trueCount > (self.modelObject.configuration.isAtLeastOneSelected ? 1 : 0) {
                        configuration.data.isSelected.toggle()
                        let index = self.modelObject.items.firstIndex(where: { $0.id == configuration.data.id })
                        self.dataChangeHandler(OrderPickerItemModel.Change.selected(index: index!, isSelected: configuration.data.isSelected))
                    }
                    self.modelObject.highlightedItemID = nil
                }
            Divider().padding(.leading, self.getWidth(compactWidth: 16))
//            Divider().padding(EdgeInsets(top: 4, leading: getWidth(compactWidth: 16), bottom: 4, trailing: 0))
        }
    }
    
    func configureMainStack(_ configuration: SortCriterionConfiguration, isVertical: Bool) -> some View {
        @EnvironmentObject var modelObject: OrderPickerModelObject
        let mainStack = isVertical ? AnyLayout(VStackLayout(alignment: .leading, spacing: 0)) : AnyLayout(HStackLayout())
        return mainStack {
            HStack {
                Title(title: configuration.data.criterion)
                    .padding(.trailing, self.getWidth(compactWidth: 16))
                if isVertical {
                    Spacer()
                }
            }
            
            if !isVertical {
                Spacer(minLength: 0)
            }
            
            ZStack {
                if configuration.data.isSelected {
                    Subtitle(subtitle: configuration.data.isAscending ? configuration.data.ascendingText : configuration.data.descendingText)
                        .ifApply(isVertical) {
                            $0.frame(maxWidth: .infinity, alignment: .leading)
                        }
                }
            }
            .frame(minWidth: 44, maxHeight: .infinity)
            .padding(.trailing, self.getWidth(compactWidth: 6))
            .contentShape(Rectangle())
            .onTapGesture {
                if configuration.data.isSelected {
                    configuration.data.isAscending.toggle()
                    let index = self.modelObject.items.firstIndex(where: { $0.id == configuration.data.id })
                    self.dataChangeHandler(OrderPickerItemModel.Change.ascending(index: index!, isAscending: configuration.data.isAscending))
                } else {
                    configuration.data.isSelected.toggle()
                    let index = self.modelObject.items.firstIndex(where: { $0.id == configuration.data.id })
                    self.dataChangeHandler(OrderPickerItemModel.Change.selected(index: index!, isSelected: configuration.data.isSelected))
                }
                self.modelObject.highlightedItemID = nil
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
    
    struct DraggableImage: View {
        @Binding var item: OrderPickerItemModel
        var modelObject: OrderPickerModelObject
        var sortCriterionBaseStyle: SortCriterionBaseStyle
        @State private var hasDragged = false
        
        var body: some View {
            AccessoryIcon(accessoryIcon: self.item.accessoryIcon ?? Image(systemName: "line.horizontal.3"))
                .typeErased
                .padding(.trailing, self.sortCriterionBaseStyle.getWidth(compactWidth: 16))
                .frame(width: 44, alignment: .center)
                .frame(maxHeight: .infinity)
                .contentShape(Rectangle())
                .gesture(
                    LongPressGesture(minimumDuration: 0.7)
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                self.hasDragged = false
                                self.sortCriterionBaseStyle.originalModelObject = self.modelObject.items
                                self.modelObject.isDragging = true
                                self.modelObject.draggingItem = self.item
                            }
                        }
                        .sequenced(before: DragGesture())
                        .onChanged { sequence in
                            switch sequence {
                            case .first: break
                            case .second(_, let dragValue):
                                if let dragValue {
                                    self.handleDrag(dragValue.translation)
                                }
                            }
                        }
                )
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onEnded { _ in
                            if self.modelObject.isDragging {
                                withAnimation(.spring()) {
                                    if self.hasDragged, self.modelObject.draggingItem != nil, self.sortCriterionBaseStyle.originalModelObject != self.modelObject.items {
                                        let sourceIndex = self.sortCriterionBaseStyle.originalModelObject.firstIndex(where: { $0.id == self.modelObject.draggingItem?.id })
                                        let destinationIndex = self.modelObject.items.firstIndex(where: { $0.id == self.modelObject.draggingItem?.id })
                                        self.sortCriterionBaseStyle.dataChangeHandler(OrderPickerItemModel.Change.order(sourceIndex: sourceIndex!, destinationIndex: destinationIndex!))
                                    }
                                    self.modelObject.isDragging = false
                                    self.modelObject.draggingItem = nil
                                    self.sortCriterionBaseStyle.originalModelObject = []
                                }
                            }
                        }
                )
        }
        
        private func handleDrag(_ translation: CGSize) {
            guard let draggingItem = self.modelObject.draggingItem,
                  let from = self.modelObject.items.firstIndex(of: draggingItem) else { return }
            
            let offset = translation.height
            let direction: Int = offset + 22 > 0 ? 1 : -1
            let to = from + direction
            
            guard to >= 0, to < self.modelObject.items.count else { return }
            
            withAnimation(.spring()) {
                self.modelObject.items.swapAt(from, to)
                self.hasDragged = true
            }
        }
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
    
    struct AccessoryIconFioriStyle: AccessoryIconStyle {
        let sortCriterionConfiguration: SortCriterionConfiguration
    
        func makeBody(_ configuration: AccessoryIconConfiguration) -> some View {
            AccessoryIcon(configuration)
                .font(.fiori(forTextStyle: .body))
                .foregroundStyle(Color.preferredColor(.quaternaryLabel))
        }
    }
}

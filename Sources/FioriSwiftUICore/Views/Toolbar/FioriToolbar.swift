import FioriThemeManager
import SwiftUI

struct FioriToolbar<Items: IndexedViewContainer>: ViewModifier {
    var helperText: any View
    var moreActionOverflow: any View
    let items: Items

    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @StateObject var sizeHandler: FioriToolbarHandler
    
    @Environment(\.helperTextStyle) var helperTextStyle
    @Environment(\.moreActionOverflowStyle) var moreActionOverflowStyle
    
    init(@ViewBuilder helperText: () -> any View = { EmptyView() },
         moreActionOverflow: () -> any View = { EmptyView() },
         @IndexedViewBuilder items: () -> Items,
         numOfDisplayItems: Int = -1)
    {
        self.helperText = HelperText { helperText().typeErased }
        self.moreActionOverflow = MoreActionOverflow {
            if moreActionOverflow().isEmpty {
                Image(systemName: "ellipsis")
            } else {
                moreActionOverflow().typeErased
            }
        }
        self.items = items()
        _sizeHandler = StateObject(wrappedValue: FioriToolbarHandler(numOfDisplayItems: numOfDisplayItems))
    }
    
    init(helperText: String,
         @ViewBuilder moreActionOverflow: () -> any View = { EmptyView() },
         @IndexedViewBuilder items: () -> Items,
         numOfDisplayItems: Int = -1)
    {
        self.init(helperText: { HelperText { helperText.isEmpty ? nil : Text(helperText) } },
                  moreActionOverflow: moreActionOverflow,
                  items: items,
                  numOfDisplayItems: numOfDisplayItems)
    }
    
    init(@ViewBuilder moreActionOverflow: () -> any View = { EmptyView() },
         @IndexedViewBuilder items: () -> Items,
         numOfDisplayItems: Int = -1)
    {
        self.init(helperText: { EmptyView() },
                  moreActionOverflow: moreActionOverflow,
                  items: items,
                  numOfDisplayItems: numOfDisplayItems)
    }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                if LiquidGlassHelper.usesLiquidGlassUI {
                    #if !os(visionOS)
                        if #available(iOS 26.0, *) {
                            if UIDevice.current.userInterfaceIdiom == .pad {
                                ToolbarSpacer(.flexible, placement: .bottomBar)
                            }
                        }
                    #endif
                    ToolbarItemGroup(placement: .bottomBar) {
                        if self.sizeHandler.needLayoutSubviews {
                            self.toolbarContent()
                        } else {
                            self.sizeCheckView()
                        }
                    }
                } else {
                    ToolbarItemGroup(placement: .bottomBar) {
                        if UIDevice.current.userInterfaceIdiom == .pad {
                            Spacer()
                                .frame(width: 500)
                        }
                        if self.sizeHandler.needLayoutSubviews {
                            HStack(spacing: 0) {
                                self.toolbarContent()
                            }
                        } else {
                            self.sizeCheckView()
                        }
                    }
                }
            }
            .sizeReader { size in
                self.sizeHandler.containerSize = size
                if self.horizontalSizeClass == .compact || UIDevice.current.userInterfaceIdiom == .pad {
                    self.sizeHandler.rtlMargin = 40
                } else {
                    self.sizeHandler.rtlMargin = 160
                }
            }
    }
    
    @ViewBuilder
    func toolbarContent() -> some View {
        ForEach(0 ..< self.sizeHandler.itemsWidth.count, id: \.self) { index in
            let itemIndex = self.sizeHandler.itemsWidth[index].0
            let itemWidth = self.sizeHandler.itemsWidth[index].1
            
            if itemIndex >= 0 {
                self.items.view(at: itemIndex)
                    .fixedSize()
                    .frame(width: itemWidth)
                    .onChange(of: self.dynamicTypeSize) { _, _ in
                        self.sizeHandler.calculateItemsSize(self.dynamicTypeSize)
                    }
                    .fixedSize()
            } else {
                if itemIndex == -1 {
                    self.helperTextView()
                        .frame(width: itemWidth)
                } else if itemIndex == -2 {
                    self.moreAction()
                        .frame(width: itemWidth)
                }
            }
            
            if !LiquidGlassHelper.usesLiquidGlassUI, index < self.sizeHandler.itemsWidth.count - 1 {
                if itemIndex == -1 || !self.sizeHandler.useFixedPadding {
                    Spacer().frame(minWidth: self.sizeHandler.defaultFixedPadding)
                } else {
                    Spacer().frame(width: self.sizeHandler.defaultFixedPadding)
                }
            }
        }
    }
    
    @ViewBuilder
    func sizeCheckView() -> some View {
        ZStack {
            HStack(spacing: 0) {
                Spacer()
                self.helperTextView().fixedSize()
                    .sizeReader { size in
                        self.sizeHandler.helperTextWidth = size.width
                    }
            }
            ForEach(0 ..< self.items.count, id: \.self) { index in
                HStack(spacing: 0) {
                    Spacer()
                    self.items.view(at: index).fixedSize()
                        .sizeReader { size in
                            self.sizeHandler.itemsSize[index] = CGSize(width: ceil(size.width), height: ceil(size.height))
                        }
                }
                .border(Color.black, width: 2)
            }.background {
                HStack(spacing: 0) {
                    Spacer()
                    self.moreAction().fixedSize()
                        .sizeReader(size: { size in
                            self.sizeHandler.totalItemsCount = self.items.count
                            self.sizeHandler.moreActionWidth = ceil(size.width)
                        })
                        .hidden()
                }
            }
        }
    }
    
    @ViewBuilder
    func moreAction() -> some View {
        Menu {
            if !self.sizeHandler.moreActionsIndex.isEmpty {
                ForEach(self.sizeHandler.moreActionsIndex, id: \.self) { index in
                    self.items.view(at: index)
                }
            } else {
                ForEach(0 ..< self.items.count, id: \.self) { index in
                    self.items.view(at: index)
                }
            }
        } label: {
            self.moreActionOverflow.typeErased
        }
    }
    
    @ViewBuilder
    func helperTextView() -> some View {
        self.helperText.typeErased
    }
}

#Preview {
    NavigationStack {
        Color.preferredColor(.red1)
            .fioriToolbar(helperText: "helper text",
                          items: {
                              Button(action: {}, label: {
                                  Text("This is a very very very very very long button title")
                              })
                              Button(action: {}, label: {
                                  Text("Save")
                              })
                              Button(action: {}, label: {
                                  Text("Submit")
                              })
                          })
    }
}

class FioriToolbarHandler: ObservableObject {
    var containerSize: CGSize = .zero {
        didSet {
            if oldValue != self.containerSize {
                self.calculateItemsSize()
            }
        }
    }
    
    var totalItemsCount = 0
    
    var itemsSize: [Int: CGSize] = [:] {
        didSet {
            if oldValue != self.itemsSize {
                self.calculateItemsSize()
            }
        }
    }

    var helperTextWidth: CGFloat = 0 {
        didSet {
            if oldValue != self.helperTextWidth {
                self.calculateItemsSize()
            }
        }
    }
    
    var moreActionWidth: CGFloat = 0 {
        didSet {
            if oldValue != self.moreActionWidth {
                self.calculateItemsSize()
            }
        }
    }
    
    var showFirstItem = true
    var needLayoutSubviews = false
    var moreActionsIndex: [Int] = []
    
    var useFixedPadding: Bool = true
    var rtlMargin: CGFloat = 40
    var defaultFixedPadding: CGFloat {
        if LiquidGlassHelper.usesLiquidGlassUI, UIDevice.current.userInterfaceIdiom == .phone {
            // more padding for iOS 26.
            return 12
        } else {
            return 8
        }
    }
    
    var liquidGlassContainerPadding: CGFloat {
        if LiquidGlassHelper.usesLiquidGlassUI {
            // Liquid glass container need more padding for iOS 26.
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 10
            } else {
                return 8
            }
        } else {
            return 0
        }
    }
    
    // Display item count: -1 = dynamic (content-based), >0 = fixed (limits item count)
    var numOfDisplayItems: Int = -1
    private let minHelperTextWidth: CGFloat = 64
    // [index: width] when index is -1, helper text, -2 is overflow action
    var itemsWidth: [(Int, CGFloat?)] = []
    var itemsCurrentWidth: CGFloat? = nil
    
    init(numOfDisplayItems: Int) {
        self.numOfDisplayItems = numOfDisplayItems
    }
    
    // swiftlint:disable:next cyclomatic_complexity function_body_length
    func calculateItemsSize(_ dynamicTypeSize: DynamicTypeSize? = nil) {
        guard self.totalItemsCount == self.itemsSize.count, self.containerSize.width > 0 else {
            return
        }
        self.moreActionsIndex.removeAll()
        self.itemsWidth.removeAll()
        self.useFixedPadding = true
        var availableItemWidth: CGFloat
        if self.helperTextWidth > 0 {
            availableItemWidth = self.containerSize.width - self.rtlMargin - min(self.minHelperTextWidth, self.helperTextWidth) - self.defaultFixedPadding
        } else {
            availableItemWidth = self.containerSize.width - self.rtlMargin
        }
        switch self.itemsSize.count {
        case 0:
            if self.helperTextWidth > 0 {
                self.itemsWidth = [(-1, nil)]
                self.needLayoutSubviews = true
                objectWillChange.send()
            } else {
                return
            }
        case 1:
            if self.helperTextWidth > 0 {
                availableItemWidth -= self.liquidGlassContainerPadding * 2.0
                if let itemWidth = itemsSize[0]?.width {
                    if itemWidth > availableItemWidth {
                        self.itemsWidth = [(-1, min(self.minHelperTextWidth, self.helperTextWidth)), (0, availableItemWidth)]
                    } else {
                        self.itemsWidth = [(-1, min(self.containerSize.width - self.rtlMargin - itemWidth - self.defaultFixedPadding - self.liquidGlassContainerPadding * 2.0, self.helperTextWidth)), (0, itemWidth)]
                    }
                }
                self.useFixedPadding = false
            } else {
                self.itemsWidth = [(0, nil)]
            }
            self.needLayoutSubviews = true
            objectWillChange.send()
        default:
            var textWidth: CGFloat = 0
            var currentWidth: CGFloat = 0
            var allWidth = self.itemsSize.sorted(by: { $0.key < $1.key }).map(\.value.width).reduce(0, +)
            allWidth += CGFloat(self.itemsSize.count - 1) * self.defaultFixedPadding
            allWidth += CGFloat(self.itemsSize.count) * self.liquidGlassContainerPadding
            if self.itemsSize.count < self.numOfDisplayItems {
                self.numOfDisplayItems = self.itemsSize.count
            }
            
            var hasMoreItems = allWidth > availableItemWidth

            if self.numOfDisplayItems > 0 {
                let itemsPadding = CGFloat(numOfDisplayItems - 1) * self.defaultFixedPadding
                availableItemWidth -= itemsPadding
                currentWidth += itemsPadding
                hasMoreItems = self.itemsSize.count > self.numOfDisplayItems
            }
            
            if hasMoreItems {
                var fixedItemWidth = 0.0

                self.itemsWidth.append((-2, self.moreActionWidth))
                if self.moreActionWidth > 0 {
                    availableItemWidth -= self.moreActionWidth + self.defaultFixedPadding + self.liquidGlassContainerPadding
                }
                currentWidth += self.moreActionWidth
                currentWidth += self.moreActionWidth > 0 ? self.defaultFixedPadding + self.liquidGlassContainerPadding : 0
                
                if self.numOfDisplayItems > 0 {
                    let count = CGFloat(self.numOfDisplayItems)
                    let displayedItems = self.itemsSize.sorted(by: { $0.key < $1.key }).prefix(self.numOfDisplayItems)
                    let maxItemWidth = displayedItems.map(\.value.width).max() ?? 0
                    
                    if (maxItemWidth + self.liquidGlassContainerPadding) * count + self.helperTextWidth >= availableItemWidth + min(self.minHelperTextWidth, self.helperTextWidth) {
                        // Use max items size for items so helper text will get enough space.
                        fixedItemWidth = maxItemWidth
                    } else {
                        // items will split the left space
                        let leftItemsSpace = availableItemWidth + min(self.minHelperTextWidth, self.helperTextWidth) - self.helperTextWidth
                        fixedItemWidth = leftItemsSpace / count - self.liquidGlassContainerPadding
                    }
                }

                var noItemForAvailableWidth = true
                let someItemsMayBeCompressed = someItemsMayBeCompressed(in: availableItemWidth)
                for (index, item) in self.itemsSize.sorted(by: { $0.key < $1.key }).enumerated() {
                    if self.numOfDisplayItems > 0 {
                        noItemForAvailableWidth = false
                        if (index + 1) > self.numOfDisplayItems {
                            self.moreActionsIndex.append(item.key)
                        } else {
                            if UIDevice.current.userInterfaceIdiom != .pad {
                                self.itemsWidth.append((item.key, fixedItemWidth))
                                currentWidth += fixedItemWidth + self.liquidGlassContainerPadding
                            } else {
                                var itemWidth = 0.0
                                if let dynamicTypeSize {
                                    itemWidth = dynamicTypeSize > .large ? item.value.width * 1.2 : item.value.width
                                } else {
                                    itemWidth = item.value.width
                                }
                                if someItemsMayBeCompressed {
                                    itemWidth = min(itemWidth, fixedItemWidth)
                                }
                                self.itemsWidth.append((item.key, itemWidth))
                                currentWidth += itemWidth + self.liquidGlassContainerPadding
                            }
                        }
                    } else {
                        currentWidth += item.value.width + self.liquidGlassContainerPadding
                        if currentWidth > availableItemWidth {
                            self.moreActionsIndex.append(item.key)
                            currentWidth -= item.value.width + self.liquidGlassContainerPadding
                        } else {
                            self.itemsWidth.append((item.key, item.value.width))
                            currentWidth += self.defaultFixedPadding
                            noItemForAvailableWidth = false
                        }
                    }
                }
                
                if noItemForAvailableWidth {
                    // truncated first item
                    let firstItemWidth = availableItemWidth - self.moreActionWidth - self.defaultFixedPadding - self.liquidGlassContainerPadding
                    self.itemsWidth.append((0, firstItemWidth))
                    textWidth = self.minHelperTextWidth
                } else {
                    textWidth = self.containerSize.width - self.rtlMargin - currentWidth + self.defaultFixedPadding
                }
                self.itemsCurrentWidth = currentWidth
            } else {
                if self.numOfDisplayItems > 0, UIDevice.current.userInterfaceIdiom != .pad {
                    let count = min(CGFloat(self.itemsSize.count), CGFloat(self.numOfDisplayItems))
                    let fixedItemWidth: CGFloat
                    let maxItemWidth = self.itemsSize.map(\.value.width).max() ?? 0
                    
                    if (maxItemWidth + self.liquidGlassContainerPadding) * count + self.helperTextWidth >= availableItemWidth + min(self.minHelperTextWidth, self.helperTextWidth) {
                        // Use max items size for items so helper text will get enough space.
                        fixedItemWidth = maxItemWidth
                    } else {
                        // items will split the left space
                        let leftItemsSpace = availableItemWidth + min(self.minHelperTextWidth, self.helperTextWidth) - self.helperTextWidth
                        fixedItemWidth = leftItemsSpace / count - self.liquidGlassContainerPadding
                    }
                    self.itemsWidth = self.itemsSize.sorted(by: { $0.key < $1.key }).map { ($0.key, fixedItemWidth) }
                    self.itemsCurrentWidth = availableItemWidth
                    allWidth = (fixedItemWidth + self.liquidGlassContainerPadding) * count
                } else {
                    if self.numOfDisplayItems < 1 {
                        self.itemsWidth = self.itemsSize.sorted(by: { $0.key < $1.key }).map { ($0.key, $0.value.width) }
                    } else {
                        let someItemsMayBeCompressed = someItemsMayBeCompressed(in: availableItemWidth)
                        self.itemsWidth = self.itemsSize.sorted(by: { $0.key < $1.key }).map { item in
                            var itemWidth: CGFloat
                            if let dynamicTypeSize {
                                itemWidth = dynamicTypeSize > .large ? item.value.width * 1.2 : item.value.width
                            } else {
                                itemWidth = item.value.width
                            }
                            if someItemsMayBeCompressed {
                                let maxItemWidth = availableItemWidth / CGFloat(self.numOfDisplayItems)
                                itemWidth = min(itemWidth, maxItemWidth)
                            }
                            currentWidth += (itemWidth + self.liquidGlassContainerPadding)
                            return (item.key, itemWidth)
                        }
                    }
                    self.itemsCurrentWidth = currentWidth
                }
                textWidth = self.containerSize.width - self.rtlMargin - allWidth - (self.helperTextWidth > 0 ? self.defaultFixedPadding : 0)
                self.useFixedPadding = false
            }
            
            if self.helperTextWidth > 0 {
                if self.itemsSize.count == 2, self.moreActionsIndex.isEmpty {
                    self.itemsWidth.insert((-1, min(self.helperTextWidth, textWidth)), at: 1)
                } else {
                    self.itemsWidth.insert((-1, min(self.helperTextWidth, textWidth)), at: 0)
                }
            } else {
                self.useFixedPadding = false
            }
            self.needLayoutSubviews = true
            objectWillChange.send()
        }
    }
    
    func someItemsMayBeCompressed(in availableItemWidth: CGFloat) -> Bool {
        let someItemsMayBeCompressed: Bool
        if self.numOfDisplayItems > 0 {
            let allDisplayedItemsWidth = self.itemsSize.sorted(by: { $0.key < $1.key }).prefix(self.numOfDisplayItems).map(\.value.width).reduce(0, +)
            let allItemsPadding = CGFloat(numOfDisplayItems) * self.liquidGlassContainerPadding
            let allItemsSpacer = CGFloat(numOfDisplayItems - 1) * self.defaultFixedPadding
            someItemsMayBeCompressed = allDisplayedItemsWidth + allItemsPadding + allItemsSpacer > availableItemWidth
        } else {
            someItemsMayBeCompressed = false
        }
        return someItemsMayBeCompressed
    }
}

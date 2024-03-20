import FioriThemeManager
import SwiftUI

struct FioriToolbar<Items: IndexedViewContainer>: ViewModifier {
    var helperText: any View
    var moreActionOverflow: any View
    let items: Items
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @ObservedObject var sizeHandler = FioriToolbarHandler()
    
    @Environment(\.helperTextStyle) var helperTextStyle
    @Environment(\.moreActionOverflowStyle) var moreActionOverflowStyle
    
    init(@ViewBuilder helperText: () -> any View = { EmptyView() },
         moreActionOverflow: () -> any View = { EmptyView() },
         @IndexedViewBuilder items: () -> Items)
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
    }
    
    init(helperText: String,
         @ViewBuilder moreActionOverflow: () -> any View = { EmptyView() },
         @IndexedViewBuilder items: () -> Items)
    {
        self.init(helperText: { HelperText { helperText.isEmpty ? nil : Text(helperText) } },
                  moreActionOverflow: moreActionOverflow,
                  items: items)
    }
    
    init(@ViewBuilder moreActionOverflow: () -> any View = { EmptyView() },
         @IndexedViewBuilder items: () -> Items)
    {
        self.init(helperText: { EmptyView() },
                  moreActionOverflow: moreActionOverflow,
                  items: items)
    }
    
    func body(content: Content) -> some View {
        content.toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                if self.sizeHandler.needLayoutSubviews {
                    HStack(spacing: 0) {
                        ForEach(0 ..< self.sizeHandler.itemsWidth.count, id: \.self) { index in
                            let itemIndex = self.sizeHandler.itemsWidth[index].0
                            let itemWidth = self.sizeHandler.itemsWidth[index].1
                            if itemIndex >= 0 {
                                self.items.view(at: itemIndex)
                                    .frame(width: itemWidth)
                            } else {
                                if itemIndex == -1 {
                                    self.helperTextView()
                                        .frame(width: itemWidth)
                                } else if itemIndex == -2 {
                                    self.moreAction()
                                        .frame(width: itemWidth)
                                }
                            }
                            if index < self.sizeHandler.itemsWidth.count - 1 {
                                if itemIndex == -1 || !self.sizeHandler.useFixedPadding {
                                    Spacer().frame(minWidth: 8)
                                } else {
                                    Spacer().frame(width: self.sizeHandler.defaultFixedPadding)
                                }
                            }
                        }
                    }
                } else {
                    LazyHStack(spacing: self.sizeHandler.defaultFixedPadding) {
                        self.helperTextView()
                            .sizeReader { size in
                                self.sizeHandler.helperTextWidth = size.width
                            }
                        ForEach(0 ..< self.items.count,
                                id: \.self)
                        { index in
                            self.items.view(at: index)
                                .sizeReader { size in
                                    self.sizeHandler.itemsSize[index] = size
                                }
                        }.background {
                            self.moreAction()
                                .sizeReader(size: { size in
                                    self.sizeHandler.totalItemsCount = self.items.count
                                    self.sizeHandler.moreActionWidth = size.width
                                })
                                .hidden()
                        }
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
        self.helperText.typeErased.frame(height: 44)
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
            self.calculateItemsSize()
        }
    }
    
    var totalItemsCount = 0
    
    var itemsSize: [Int: CGSize] = [:] {
        didSet {
            self.calculateItemsSize()
        }
    }

    var helperTextWidth: CGFloat = 0 {
        didSet {
            self.calculateItemsSize()
        }
    }
    
    var moreActionWidth: CGFloat = 0 {
        didSet {
            self.calculateItemsSize()
        }
    }
    
    var showFirstItem = true
    var needLayoutSubviews = false
    var moreActionsIndex: [Int] = []
    
    var useFixedPadding: Bool = true
    var rtlMargin: CGFloat = 40
    let defaultFixedPadding: CGFloat = 8
    private let minHelperTextWidth: CGFloat = 64
    // [index: width] when index is -1, helper text, -2 is overflow action
    var itemsWidth: [(Int, CGFloat?)] = []
    
    // swiftlint:disable:next cyclomatic_complexity function_body_length
    func calculateItemsSize() {
        guard self.totalItemsCount == self.itemsSize.count, self.containerSize.width > 0 else { return }
        self.moreActionsIndex.removeAll()
        self.itemsWidth.removeAll()
        self.useFixedPadding = true
        let availableItemWidth: CGFloat
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
                if let itemWidth = itemsSize[0]?.width {
                    if itemWidth > availableItemWidth {
                        self.itemsWidth = [(-1, min(self.minHelperTextWidth, self.helperTextWidth)), (0, availableItemWidth)]
                    } else {
                        self.itemsWidth = [(-1, min(self.containerSize.width - self.rtlMargin - itemWidth - self.defaultFixedPadding, self.helperTextWidth)), (0, itemWidth)]
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
            if allWidth > availableItemWidth {
                // need more action menu
                self.itemsWidth.append((-2, self.moreActionWidth))
                
                currentWidth += (self.moreActionWidth + self.defaultFixedPadding)
                var noItemForAvailableWidth = true
                for item in self.itemsSize.sorted(by: { $0.key < $1.key }) {
                    currentWidth += item.value.width
                    if currentWidth > availableItemWidth {
                        self.moreActionsIndex.append(item.key)
                        currentWidth -= item.value.width
                    } else {
                        self.itemsWidth.append((item.key, item.value.width))
                        currentWidth += self.defaultFixedPadding
                        noItemForAvailableWidth = false
                    }
                }
                
                if noItemForAvailableWidth {
                    // truncated first item
                    let firstItemWidth = availableItemWidth - self.moreActionWidth - self.defaultFixedPadding
                    self.itemsWidth.append((0, firstItemWidth))
                    textWidth = self.minHelperTextWidth
                } else {
                    textWidth = self.containerSize.width - self.rtlMargin - currentWidth + self.defaultFixedPadding
                }
            } else {
                self.itemsWidth = self.itemsSize.sorted(by: { $0.key < $1.key }).map { ($0.key, $0.value.width) }
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
}

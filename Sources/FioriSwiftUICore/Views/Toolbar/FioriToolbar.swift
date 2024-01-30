import FioriThemeManager
import SwiftUI

struct FioriToolbar<Items: IndexedViewContainer>: ViewModifier {
    var helperText: (any View)?
    let items: Items
    var customOverflow: (any View)?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @ObservedObject var sizeHandler = FioriToolbarHandler()
    
    init(helperText: (any View)? = nil,
         customOverflow: (any View)? = nil,
         @IndexedViewBuilder items: () -> Items)
    {
        self.helperText = helperText
        self.customOverflow = customOverflow
        self.items = items()
    }
    
    init(helperText: String,
         customOverflow: (any View)? = nil,
         @IndexedViewBuilder items: () -> Items)
    {
        self.init(helperText: helperText.isEmpty ? nil : Text(helperText).foregroundStyle(Color.preferredColor(.tertiaryLabel).opacity(0.9)).font(Font.fiori(forTextStyle: .caption1)),
                  customOverflow: customOverflow,
                  items: items)
    }
    
    init(customOverflow: (any View)? = nil,
         @IndexedViewBuilder items: () -> Items)
    {
        self.init(helperText: nil,
                  customOverflow: customOverflow,
                  items: items)
    }
    
    func body(content: Content) -> some View {
        content.toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                if sizeHandler.needLayoutSubviews {
                    HStack(spacing: 0) {
                        ForEach(0 ..< sizeHandler.itemsWidth.count, id: \.self) { index in
                            let itemIndex = sizeHandler.itemsWidth[index].0
                            let itemWidth = sizeHandler.itemsWidth[index].1
                            if itemIndex >= 0 {
                                items.view(at: itemIndex)
                                    .frame(width: itemWidth)
                            } else {
                                if itemIndex == -1 {
                                    helperTextView()
                                        .frame(width: abs(itemWidth))
                                } else if itemIndex == -2 {
                                    moreAction()
                                        .frame(width: itemWidth)
                                }
                            }
                            if index < sizeHandler.itemsWidth.count - 1 {
                                if itemIndex == -1 || !sizeHandler.useFixedPadding {
                                    Spacer().frame(minWidth: 8)
                                } else {
                                    Spacer().frame(width: sizeHandler.defaultFixedPadding)
                                }
                            }
                        }
                    }
                } else {
                    if helperText != nil {
                        helperTextView()
                            .sizeReader { size in
                                sizeHandler.helperTextWidth = size.width
                            }
                    }
                    ForEach(0 ..< items.count,
                            id: \.self) { index in
                        items.view(at: index)
                            .sizeReader { size in
                                sizeHandler.itemsSize[index] = size
                            }
                    }
                    .background {
                        moreAction()
                            .sizeReader(size: { size in
                                sizeHandler.totalItemsCount = items.count
                                sizeHandler.moreActionWidth = size.width
                            })
                            .hidden()
                    }
                }
            }
        }
        .sizeReader { size in
            sizeHandler.containerSize = size
            if horizontalSizeClass == .compact || UIDevice.current.userInterfaceIdiom == .pad {
                sizeHandler.rtlMargin = 40
            } else {
                sizeHandler.rtlMargin = 160
            }
        }
    }
    
    @ViewBuilder
    func moreAction() -> some View {
        Menu {
            if !sizeHandler.moreActionsIndex.isEmpty {
                ForEach(sizeHandler.moreActionsIndex, id: \.self) { index in
                    items.view(at: index)
                }
            } else {
                ForEach(0 ..< items.count, id: \.self) { index in
                    items.view(at: index)
                }
            }
        } label: {
            if let overflowView = customOverflow {
                overflowView.typeErased
            } else {
                Image(systemName: "ellipsis")
            }
        }
    }
    
    @ViewBuilder
    func helperTextView() -> some View {
        Group {
            if let text = helperText {
                text.typeErased.lineLimit(2)
            } else {
                EmptyView()
            }
        }.frame(height: 44)
    }
}

#Preview {
    NavigationStack {
        Color.preferredColor(.red1)
            .fioriToolbar(helperText: "eqwe1 ",
                          items: {
                              Button(action: {}, label: {
                                  Text("Button 232 23232233Button 232 23232233Button 232 23232233Button 232 23232233qq")
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
    var itemsWidth: [(Int, CGFloat)] = []
    
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
            return
        case 1:
            if self.helperTextWidth > 0 {
                if let itemWidth = itemsSize[0]?.width {
                    if itemWidth > availableItemWidth {
                        self.itemsWidth = [(-1, self.minHelperTextWidth), (0, availableItemWidth)]
                    } else {
                        self.itemsWidth = [(-1, .infinity), (0, itemWidth)]
                    }
                }
                self.useFixedPadding = false
            } else {
                self.itemsWidth = [(0, .infinity)]
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

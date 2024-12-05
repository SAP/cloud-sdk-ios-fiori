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
    /// create a filter picker which used in FilterFeedbackBarItem
    /// - Parameters:
    ///   - value: Selected value indexs.
    ///   - valueOptions: The data for constructing the list picker.
    ///   - hint: Hint message.
    ///   - itemLayout: Option item layout type.
    ///   - barItemFrame: The frame of the bar item, which toggle to show this view.
    ///   - onTap: The closure when tap on item.
    ///   - updateSearchListPickerHeight: The closure to update the parent view.
    init(value: Binding<[Int]>, valueOptions: [String] = [], hint: String? = nil, itemLayout: OptionListPickerItemLayoutType = .fixed, barItemFrame: CGRect = .zero, onTap: ((_ index: Int) -> Void)? = nil, updateSearchListPickerHeight: ((CGFloat) -> Void)? = nil) {
        self.init(value: value, valueOptions: valueOptions, hint: hint, itemLayout: itemLayout, onTap: onTap)
        
        self.barItemFrame = barItemFrame
        self.updateSearchListPickerHeight = updateSearchListPickerHeight
    }
}

extension OptionListPickerItem: View {
    public var body: some View {
        if _itemLayout == .flexible {
            self.generateFlexibleContent()
        } else {
            self.generateFixedContent()
        }
    }
    
    private func generateFixedContent() -> some View {
        ScrollView(.vertical) {
            Grid(horizontalSpacing: 16) {
                ForEach(0 ..< Int(ceil(Double(_valueOptions.count) / 2.0)), id: \.self) { rowIndex in
                    GridRow {
                        FilterFeedbackBarButton(
                            leftIcon: _value.wrappedValue.contains(rowIndex * 2) ? Image(systemName: "checkmark") : nil,
                            title: _valueOptions[rowIndex * 2],
                            isSelected: _value.wrappedValue.contains(rowIndex * 2)
                        )
                        .onTapGesture {
                            _onTap?(rowIndex * 2)
                        }
                        if rowIndex * 2 + 1 < _valueOptions.count {
                            FilterFeedbackBarButton(
                                leftIcon: _value.wrappedValue.contains(rowIndex * 2 + 1) ? Image(systemName: "checkmark") : nil,
                                title: _valueOptions[rowIndex * 2 + 1],
                                isSelected: _value.wrappedValue.contains(rowIndex * 2 + 1)
                            )
                            .onTapGesture {
                                _onTap?(rowIndex * 2 + 1)
                            }
                        }
                    }
                }
            }
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.updateSearchListPickerHeight?(self.calculateHeight(scrollViewContentHeight: geometry.size.height))
                        }
                }
            )
        }
    }
    
    private func generateFlexibleContent() -> some View {
        ScrollView(.vertical) {
            OptionListPickerCustomLayout {
                ForEach(0 ..< _valueOptions.count, id: \.self) { optionIndex in
                    FilterFeedbackBarButton(
                        leftIcon: _value.wrappedValue.contains(optionIndex) ? Image(systemName: "checkmark") : nil,
                        title: _valueOptions[optionIndex],
                        isSelected: _value.wrappedValue.contains(optionIndex)
                    )
                    .onTapGesture {
                        _onTap?(optionIndex)
                    }
                }
            }
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.updateSearchListPickerHeight?(self.calculateHeight(scrollViewContentHeight: geometry.size.height))
                        }
                        .onChange(of: geometry.size) { _ in
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

struct OptionListPickerCustomLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard let containerWidth = proposal.width else {
            return .zero
        }
        var containerHeight = 0.0
        var currentRowX = 0.0
        let padding = UIDevice.current.userInterfaceIdiom != .phone ? 13.0 : 16.0
        for index in 0 ..< subviews.count {
            let subview = subviews[index]
            let subviewSize = subview.sizeThatFits(.unspecified)
            let subviewWidth = min(subviewSize.width, containerWidth - CGFloat(padding * 2))
            if index == 0 {
                containerHeight += subviewSize.height
            }
            if currentRowX + subviewWidth + padding > containerWidth - CGFloat(padding * 2) {
                containerHeight += subviewSize.height
                containerHeight += 6
                currentRowX = 0.0
            }
            currentRowX += subviewWidth + 6.0
        }
        return CGSize(width: containerWidth, height: containerHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard let containerWidth = proposal.width else { return }
        var currentY: CGFloat = bounds.minY
        var currentRowX = 0.0
        let padding = UIDevice.current.userInterfaceIdiom != .phone ? 13.0 : 16.0
        for subview in subviews {
            let subviewSize = subview.sizeThatFits(.unspecified)
            let subviewWidth = min(subviewSize.width, containerWidth - CGFloat(padding * 2))
            if currentRowX + subviewWidth + padding > containerWidth - CGFloat(padding * 2) {
                currentY += subviewSize.height
                currentY += 6
                currentRowX = 0.0
                subview.place(at: CGPoint(x: currentRowX, y: currentY), proposal: ProposedViewSize(width: subviewWidth, height: subviewSize.height))
            } else {
                subview.place(at: CGPoint(x: currentRowX, y: currentY), proposal: ProposedViewSize(width: subviewWidth, height: subviewSize.height))
            }
            currentRowX += subviewWidth + 6.0
        }
    }
}

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
                            let popverHeight = Screen.bounds.size.height
                            let totalSpacing: CGFloat = (UIDevice.current.userInterfaceIdiom != .phone ? 8 : 16) * 2
                            let totalPadding: CGFloat = (UIDevice.current.userInterfaceIdiom != .phone ? 13 : 16) * 2
                            let safeAreaInset = self.getSafeAreaInsets()
                            let maxScrollViewHeight = popverHeight - totalSpacing - totalPadding - safeAreaInset.top - safeAreaInset.bottom - (UIDevice.current.userInterfaceIdiom != .phone ? 210 : 60)
                            self._height = min(geometry.size.height, maxScrollViewHeight)
                        }
                }
            )
        }
        .ifApply(UIDevice.current.userInterfaceIdiom == .phone, content: { v in
            v.frame(height: _height)
        })
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
                            let popverHeight = Screen.bounds.size.height
                            let totalSpacing: CGFloat = (UIDevice.current.userInterfaceIdiom != .phone ? 8 : 16) * 2
                            let totalPadding: CGFloat = (UIDevice.current.userInterfaceIdiom != .phone ? 13 : 16) * 2
                            let safeAreaInset = self.getSafeAreaInsets()
                            let maxScrollViewHeight = popverHeight - totalSpacing - totalPadding - safeAreaInset.top - safeAreaInset.bottom - (UIDevice.current.userInterfaceIdiom != .phone ? 210 : 60)
                            self._height = min(geometry.size.height, maxScrollViewHeight)
                        }
                }
            )
        }
        .ifApply(UIDevice.current.userInterfaceIdiom == .phone, content: { v in
            v.frame(height: _height)
        })
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

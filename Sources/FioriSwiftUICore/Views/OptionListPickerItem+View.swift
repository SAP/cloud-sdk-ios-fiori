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
    /// create a filter picker which is used in FilterFeedbackBarItem
    /// - Parameters:
    ///   - value: Indexes for selected values.
    ///   - valueOptions: The data for constructing the list picker.
    ///   - hint: Hint message.
    ///   - title: Title label of the options.
    ///   - itemLayout: Option item layout type.
    ///   - allowsMultipleSelection: A boolean value to indicate to allow multiple selections or not.
    ///   - allowsEmptySelection: A boolean value to indicate to allow empty selections or not.
    ///   - barItemFrame: The frame of the item in FilterFeedbackBar, which toggle to show this view.
    ///   - onTap: The closure when tap on item.
    ///   - updateSearchListPickerHeight: The closure to update the parent view.
    init(value: Binding<[Int]>, valueOptions: [String] = [], title: String? = nil, hint: String? = nil, itemLayout: OptionListPickerItemLayoutType = .fixed, allowsMultipleSelection: Bool = true, allowsEmptySelection: Bool = false, barItemFrame: CGRect = .zero, onTap: ((_ index: Int) -> Void)? = nil, updateSearchListPickerHeight: ((CGFloat) -> Void)? = nil) {
        self.init(value: value, valueOptions: valueOptions, hint: hint, title: title, itemLayout: itemLayout, allowsMultipleSelection: allowsMultipleSelection, allowsEmptySelection: allowsEmptySelection, onTap: onTap)
        
        self.barItemFrame = barItemFrame
        self.updateSearchListPickerHeight = updateSearchListPickerHeight
    }
}

extension OptionListPickerItem: View {
    public var body: some View {
        ScrollView(.vertical) {
            FilterFormView(title: {
                if let title = _title, !title.isEmpty {
                    Text(title)
                        .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                } else {
                    EmptyView()
                }
            }, options: _valueOptions.map { AttributedString($0) }, isEnabled: true, allowsMultipleSelection: _allowsMultipleSelection, allowsEmptySelection: _allowsEmptySelection, value: _value, buttonSize: _itemLayout == .flexible ? .flexible : .fixed, isSingleLine: false) { _ in
            }
            .padding([.leading, .trailing], 16)
            .filterFormOptionsLineSpacing(10)
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.updateSearchListPickerHeight?(self.calculateHeight(scrollViewContentHeight: geometry.size.height))
                        }
                        .onChange(of: geometry.size) {
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

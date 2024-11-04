import SwiftUI
import UIKit

public extension SearchListPickerItem {
    /// create a list picker which used in FilterFeedbackBarItem
    /// - Parameters:
    ///   - value: Selected value indexs.
    ///   - valueOptions: The data for constructing the list picker.
    ///   - hint: Hint message.
    ///   - allowsMultipleSelection: A boolean value to indicate to allow multiple selections or not.
    ///   - allowsEmptySelection: A boolean value to indicate to allow empty selection or not.
    ///   - onTap: The closure when tap on item.
    ///   - selectAll: The closure when click 'Select All' button.
    ///   - updateSearchListPickerHeight: The closure to update the parent view.
    init(value: Binding<[Int]>, valueOptions: [String] = [], hint: String? = nil, allowsMultipleSelection: Bool, allowsEmptySelection: Bool, isSearchBarHidden: Bool = false, onTap: ((_ index: Int) -> Void)? = nil, selectAll: ((_ isAll: Bool) -> Void)? = nil, updateSearchListPickerHeight: ((CGFloat) -> Void)? = nil) {
        self.init(value: value, valueOptions: valueOptions, hint: hint, onTap: onTap)
        
        self.allowsMultipleSelection = allowsMultipleSelection
        self.allowsEmptySelection = allowsEmptySelection
        self.isSearchBarHidden = isSearchBarHidden
        self.selectAll = selectAll
        self.updateSearchListPickerHeight = updateSearchListPickerHeight
    }
}

extension SearchListPickerItem: View {
    public var body: some View {
        VStack(spacing: 0) {
            if allowsMultipleSelection {
                if _value.count != _valueOptions.count || allowsEmptySelection {
                    self.selectAllView()
                }
            } else if _value.count == _valueOptions.count {
                self.selectAllView()
            }
            
            Divider().edgesIgnoringSafeArea(.all)
            List {
                ForEach(_valueOptions.filter { _searchText.isEmpty || $0.localizedStandardContains(_searchText) }, id: \.self) { item in
                    let isSelected = self.isItemSelected(item)
                    HStack {
                        Text(item)
                            .lineLimit(1)
                            .foregroundStyle(Color.preferredColor(.primaryLabel))
                            .font(.fiori(forTextStyle: .body, weight: .regular))
                        Spacer()
                        if isSelected {
                            Image(systemName: "checkmark")
                            #if !os(visionOS)
                                .foregroundStyle(Color.preferredColor(.tintColor))
                            #else
                                .foregroundStyle(Color.preferredColor(.primaryLabel))
                            #endif
                        }
                    }
                    .padding(0)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        guard let index = findIndex(of: item) else {
                            return
                        }
                        _onTap?(index)
                    }
                }
            }
            .modifier(FioriIntrospectModifier<UIScrollView> { scrollView in
                if !_searchText.isEmpty {
                    return
                }
                DispatchQueue.main.async {
                    let popverHeight = Screen.bounds.size.height - StatusBar.height
                    let totalSpacing: CGFloat = (UIDevice.current.userInterfaceIdiom == .pad ? 8 : 16) * 2
                    let totalPadding: CGFloat = (UIDevice.current.userInterfaceIdiom == .pad ? 13 : 16) * 2
                    let safeAreaInset = self.getSafeAreaInsets()
                    var maxScrollViewHeight = popverHeight - totalSpacing - totalPadding - (self.isSearchBarHidden ? 0 : 52) - 56 - safeAreaInset.top - safeAreaInset.bottom - (UIDevice.current.userInterfaceIdiom == .pad ? 250 : 30)
                    maxScrollViewHeight -= self._keyboardHeight
                    self._height = min(scrollView.contentSize.height, maxScrollViewHeight)
                    var isSelectAllViewShow = false
                    if allowsMultipleSelection {
                        if _value.count != _valueOptions.count || allowsEmptySelection {
                            isSelectAllViewShow = true
                        }
                    } else if _value.count == _valueOptions.count {
                        isSelectAllViewShow = true
                    }
                    updateSearchListPickerHeight?(isSelectAllViewShow ? self._height + 44 : self._height)
                }
            })
            .listStyle(PlainListStyle())
            .frame(minWidth: UIDevice.current.userInterfaceIdiom != .phone ? popoverWidth : nil)
            .scrollContentBackground(.hidden)
            .padding(0)
            .ifApply(!isSearchBarHidden, content: { v in
                v.searchable(text: $_searchText, placement: .automatic)
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidShowNotification)) { notif in
                        let rect = (notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) ?? .zero
                        self._keyboardHeight = rect.height
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidHideNotification)) { _ in
                        self._keyboardHeight = 0
                    }
            })
        }
    }
    
    private func selectAllView() -> some View {
        HStack {
            Text(NSLocalizedString("All", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                .foregroundStyle(Color.preferredColor(.secondaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .regular))
            Spacer()
            Button(action: {
                selectAll?(_value.count != _valueOptions.count)
            }) {
                Text(_value.count == _valueOptions.count ? NSLocalizedString("Deselect All", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "") : NSLocalizedString("Select All", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
            }
        }
        .padding([.leading, .trailing], UIDevice.current.userInterfaceIdiom == .pad ? 13 : 16)
        .padding([.top, .bottom], 8)
    }
    
    private func isItemSelected(_ item: String) -> Bool {
        guard let index = findIndex(of: item) else {
            return false
        }
        return _value.wrappedValue.contains(index)
    }
    
    private func findIndex(of item: String) -> Int? {
        _valueOptions.firstIndex(where: { $0 == item })
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

#Preview {
    VStack {
        Spacer()
        SearchListPickerItem(value: Binding<[Int]>(get: { [0, 1, 2] }, set: { print($0) }), valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review review", "Accepted", "Rejected"], hint: nil)
            .frame(width: 393)
        Spacer()
    }
}

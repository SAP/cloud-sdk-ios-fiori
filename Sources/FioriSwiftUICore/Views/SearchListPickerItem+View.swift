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
    init(value: Binding<[Int]>, valueOptions: [String] = [], hint: String? = nil, allowsMultipleSelection: Bool, allowsEmptySelection: Bool, onTap: ((_ index: Int) -> Void)? = nil, selectAll: ((_ isAll: Bool) -> Void)? = nil, updateSearchListPickerHeight: ((CGFloat) -> Void)? = nil) {
        self.init(value: value, valueOptions: valueOptions, hint: hint, onTap: onTap)
        
        self.allowsMultipleSelection = allowsMultipleSelection
        self.allowsEmptySelection = allowsEmptySelection
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
                                .foregroundColor(.preferredColor(.tintColor))
                        }
                    }
                    .frame(maxWidth: .infinity)
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
                DispatchQueue.main.async {
                    let popverHeight = Screen.bounds.size.height - StatusBar.height
                    let totalSpacing: CGFloat = (UIDevice.current.userInterfaceIdiom == .pad ? 8 : 16) * 2
                    let totalPadding: CGFloat = (UIDevice.current.userInterfaceIdiom == .pad ? 13 : 16) * 2
                    let maxScrollViewHeight = popverHeight - totalSpacing - totalPadding - 52 - 56 - 120
                    
                    self._height = UIDevice.current.userInterfaceIdiom != .phone ? min(scrollView.contentSize.height, 396) : min(min(scrollView.contentSize.height, maxScrollViewHeight), 396)
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
            .frame(maxWidth: .infinity)
            .frame(minWidth: UIDevice.current.userInterfaceIdiom != .phone ? 393 : nil)
            .frame(height: self._height)
            .scrollContentBackground(.hidden)
            .padding(0)
            .searchable(text: $_searchText, placement: .automatic)
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
}

#Preview {
    VStack {
        Spacer()
        SearchListPickerItem(value: Binding<[Int]>(get: { [0, 1, 2] }, set: { print($0) }), valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review review", "Accepted", "Rejected"], hint: nil)
            .frame(width: 375)
        Spacer()
    }
}

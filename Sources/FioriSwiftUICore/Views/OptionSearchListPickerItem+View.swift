import SwiftUI
import UIKit

public extension OptionSearchListPickerItem {
    init(value: Binding<[Int]>, valueOptions: [String] = [], hint: String? = nil, allowsMultipleSelection: Bool, allowsEmptySelection: Bool, onTap: ((_ index: Int) -> Void)? = nil, selectAll: ((_ isAll: Bool) -> Void)? = nil) {
        self.init(value: value, valueOptions: valueOptions, hint: hint, onTap: onTap)
        
        self.allowsMultipleSelection = allowsMultipleSelection
        self.allowsEmptySelection = allowsEmptySelection
        self.selectAll = selectAll
    }
}

extension OptionSearchListPickerItem: View {
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
            .listStyle(PlainListStyle())
            .frame(maxWidth: .infinity)
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
        for (index, value) in _valueOptions.enumerated() {
            if value == item {
                return index
            }
        }
        return nil
    }
}

#Preview {
    VStack {
        Spacer()
        OptionSearchListPickerItem(value: Binding<[Int]>(get: { [0, 1, 2] }, set: { print($0) }), valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review review", "Accepted", "Rejected"], hint: nil)
            .frame(width: 375)
        Spacer()
    }
}

// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery

import SwiftUI

extension OptionListPicker: View {
    public var body: some View {
        Grid(horizontalSpacing: 16) {
            ForEach(0 ..< Int(ceil(Double(_valueOptions.count) / 2.0))) { rowIndex in
                GridRow {
                    OptionChip(
                        leftIcon: _value.wrappedValue.contains(rowIndex * 2) ? Image(systemName: "checkmark") : nil,
                        title: _valueOptions[rowIndex * 2],
                        isSelected: _value.wrappedValue.contains(rowIndex * 2)
                    )
                    .onTapGesture {
                        _onTap?(rowIndex * 2)
                    }
                    if rowIndex * 2 + 1 < _valueOptions.count {
                        OptionChip(
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
        OptionListPicker(value: Binding<[Int]>(get: { [0, 1, 2] }, set: { print($0) }), valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review", "Accepted", "Rejected"], hint: nil)
            .frame(width: 375)
        Spacer()
        OptionListPicker(value: Binding<[Int]>(get: { [0, 1, 2] }, set: { print($0) }), valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review", "Accepted", "Rejected"], hint: nil)
            .optionChipStyle(font: .title, foregroundColorSelected: Color.red, strokeColorSelected: Color.red, cornerRadius: 25)
            .frame(width: 375)
        Spacer()
    }
}

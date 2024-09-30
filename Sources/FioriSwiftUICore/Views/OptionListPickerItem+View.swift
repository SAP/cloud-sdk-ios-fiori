import SwiftUI

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
    }
    
    private func generateFlexibleContent() -> some View {
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
            .frame(width: 375)
        Spacer()
        OptionListPickerItem(value: Binding<[Int]>(get: { [0, 1, 2] }, set: { print($0) }), valueOptions: ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review", "Accepted", "Rejected"], hint: nil)
            .optionListPickerStyle(font: .title, foregroundColorSelected: Color.red, strokeColorSelected: Color.red, cornerRadius: 25)
            .frame(width: 375)
        Spacer()
    }
}

struct OptionListPickerCustomLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard let containerWidth = proposal.width else {
            return .zero
        }
        var containerHeight = 0.0
        var currentRowX = 16.0
        for index in 0 ..< subviews.count {
            let subview = subviews[index]
            let subviewSize = subview.sizeThatFits(.unspecified)
            let subviewWidth = min(subviewSize.width, containerWidth)
            if index == 0 {
                containerHeight += subviewSize.height
            }
            if currentRowX + subviewWidth + 16.0 > containerWidth {
                containerHeight += subviewSize.height
                containerHeight += 6
                currentRowX = 16.0
            }
            currentRowX += subviewWidth + 6.0
        }
        return CGSize(width: containerWidth, height: containerHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard let containerWidth = proposal.width else { return }
        var currentY: CGFloat = bounds.minY
        var currentRowX = 16.0
        for subview in subviews {
            let subviewSize = subview.sizeThatFits(.unspecified)
            let subviewWidth = min(subviewSize.width, containerWidth)
            if currentRowX + subviewWidth + 16.0 > containerWidth {
                currentY += subviewSize.height
                currentY += 6
                currentRowX = 16.0
                subview.place(at: CGPoint(x: currentRowX, y: currentY), proposal: ProposedViewSize(width: subviewWidth, height: subviewSize.height))
            } else {
                subview.place(at: CGPoint(x: currentRowX, y: currentY), proposal: ProposedViewSize(width: subviewWidth, height: subviewSize.height))
            }
            currentRowX += subviewWidth + 6.0
        }
    }
}

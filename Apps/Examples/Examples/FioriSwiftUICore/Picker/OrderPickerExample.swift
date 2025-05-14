import FioriSwiftUICore
import FioriThemeManager
import Foundation
import SwiftUI

struct OrderPickerExample: View {
    @State var stateIndex: Int = 0
    @State var stateArray: [ControlState] = [.normal, .disabled, .readOnly]
    
    @State var items: [OrderPickerItemModel] = [
        OrderPickerItemModel(criterion: "Priority", isSelected: false, isAscending: true, ascendingText: "Lowest first", descendingText: "Highest first"),
        OrderPickerItemModel(criterion: "Status", isSelected: true, isAscending: false, ascendingText: "Ascending", descendingText: "Descending"),
        OrderPickerItemModel(criterion: "Due Date", isSelected: true, isAscending: false, ascendingText: "Earliest first", descendingText: "L"),
        OrderPickerItemModel(criterion: "Really long criterion text that requires wrapping", isSelected: true, isAscending: false, ascendingText: "Really long sort direction text up", descendingText: "Really long sort direction down")
    ]
        
    @State var items2: [OrderPickerItemModel] = {
        func createCustomText(_ string: String, color: Color, size: CGFloat? = UIFont.preferredFont(forTextStyle: .body).pointSize) -> AttributedString {
            var text = AttributedString(string)
            text.foregroundColor = color
            text.font = .system(size: size!, weight: .bold)
            return text
        }
        let customAsc = createCustomText("custom ascending text", color: .red, size: 10)
        let customDesc = createCustomText("1 line descending text", color: .green, size: 20)
        let customSelectedIcon = Image(systemName: "checkmark.circle.fill")
        
        return [
            OrderPickerItemModel(criterion: "Priority", isSelected: false, isAscending: true, ascendingText: "Lowest first", descendingText: "Highest first"),
            OrderPickerItemModel(selectedIcon: customSelectedIcon, criterion: "Order Picker sort criterion 2 lines (Custom Style: First line Second line)", isSelected: true, isAscending: false, ascendingText: customAsc, descendingText: customDesc, customStyle: CustomSortCriterionStyle()),
            OrderPickerItemModel(criterion: "Name", isSelected: false, isAscending: true, ascendingText: "Ascending", descendingText: "Descending")
        ]
    }()
    
    struct CustomSortCriterionStyle: SortCriterionStyle {
        func makeBody(_ configuration: SortCriterionConfiguration) -> some View {
            SortCriterion(configuration)
                .checkmarkStyle { c in
                    c.checkmark
                        .foregroundStyle(Color.preferredColor(.pink9))
                }
                .titleStyle { c in
                    c.title
                        .lineLimit(2)
                        .foregroundStyle(Color.preferredColor(.blue6))
                }
                .subtitleStyle { c in
                    c.subtitle
                        .lineLimit(1)
                }
                .accessoryIconStyle { c in
                    c.accessoryIcon
                        .foregroundStyle(Color.preferredColor(.baseBlack))
                }
        }
    }
    
    struct CustomOrderPickerStyle: OrderPickerStyle {
        func makeBody(_ configuration: OrderPickerConfiguration) -> some View {
            OrderPicker(configuration)
                .optionalTitleStyle { c in
                    c.optionalTitle
                        .lineLimit(2)
                        .font(.fiori(forTextStyle: .largeTitle))
                        .foregroundStyle(Color.preferredColor(.red6))
                }
        }
    }

    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Text("Control State:").font(.headline)
                Picker("", selection: self.$stateIndex) {
                    ForEach(0 ..< self.stateArray.count, id: \.self) { index in
                        let state = self.stateArray[index]
                        Text(self.valueForState(state: state))
                    }
                }
                Spacer()
            }.padding(.leading, 16)
            Divider()
            
            OrderPicker(
                data: self.$items,
                onChangeHandler: { change, newModel in
                    print(change)
                    print("The value:")
                    if newModel.count > 0 {
                        for item in newModel {
                            print(item)
                        }
                    } else {
                        print("No data changed")
                    }
                },
                controlState: self.stateArray[self.stateIndex]
            ).padding(.bottom, 32)
            
            OrderPicker(
                optionalTitle: "Information",
                data: self.$items2,
                isAtLeastOneSelected: false,
                onChangeHandler: { change, newModel in
                    print(change)
                    print("The value:")
                    if newModel.count > 0 {
                        for item in newModel {
                            print(item)
                        }
                    } else {
                        print("No data changed")
                    }
                },
                controlState: self.stateArray[self.stateIndex]
            )
            .orderPickerStyle(CustomOrderPickerStyle())
            
            Spacer()
        }.navigationTitle("Order Picker")
    }
    
    func valueForState(state: ControlState) -> String {
        var stateString = ""
        switch state {
        case .disabled:
            stateString = "Disabled"
        case .readOnly:
            stateString = "Read Only"
        default:
            stateString = "Normal"
        }
        return stateString
    }
}

struct OrderPickerExample_Previews: PreviewProvider {
    static var previews: some View {
        OrderPickerExample()
    }
}

@testable import FioriSwiftUICore
import FioriThemeManager
import SwiftUI
import XCTest

final class OrderPickerTests: XCTestCase {
    @EnvironmentObject var modelObject: OrderPickerModelObject
    
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
        }
    }
    
    @State var data: [OrderPickerItemModel] = {
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
            OrderPickerItemModel(criterion: "criterion 1", isSelected: false, isAscending: true, ascendingText: "asc 1", descendingText: "des 1"),
            OrderPickerItemModel(criterion: "criterion 2", isSelected: true, isAscending: false, ascendingText: "asc 2", descendingText: "des 2"),
            OrderPickerItemModel(criterion: "criterion 3", isSelected: true, isAscending: true, ascendingText: customAsc, descendingText: customDesc),
            OrderPickerItemModel(criterion: "criterion 4", isSelected: false, isAscending: false, ascendingText: "asc 4", descendingText: "des 4", customStyle: CustomSortCriterionStyle())
        ]
    }()
    
    @State var data1: [OrderPickerItemModel] = {
        func createCustomText(_ string: String, color: Color, size: CGFloat? = UIFont.preferredFont(forTextStyle: .body).pointSize) -> AttributedString {
            var text = AttributedString(string)
            text.foregroundColor = color
            text.font = .system(size: size!, weight: .bold)
            return text
        }
        let customAsc = createCustomText("data 1_custom ascending text", color: .green, size: 15)
        let customDesc = createCustomText("data 1_custom descending text", color: .red, size: 25)
        
        return [
            OrderPickerItemModel(criterion: "data1_criterion 1", isSelected: false, isAscending: true, ascendingText: "data1_asc 1", descendingText: "data1_des 1"),
            OrderPickerItemModel(criterion: "data1_criterion 2", isSelected: true, isAscending: false, ascendingText: "data1_asc 2", descendingText: "data1_des 2"),
            OrderPickerItemModel(criterion: "data1_criterion 3", isSelected: true, isAscending: true, ascendingText: customAsc, descendingText: customDesc),
            OrderPickerItemModel(criterion: "data1_criterion 4", isSelected: false, isAscending: false, ascendingText: "data1_asc 4", descendingText: "data1_des 4", customStyle: CustomSortCriterionStyle()),
            OrderPickerItemModel(criterion: "data1_criterion 5", isSelected: true, isAscending: false, ascendingText: "data1_asc 5", descendingText: "data1_des 5")
        ]
    }()
    
    func changeHandle(_ change: OrderPickerItemModel.Change, _ newModel: [OrderPickerItemModel]) {
        print(change)
        print("The value:")
        if newModel.count > 0 {
            for item in newModel {
                print(item)
            }
        } else {
            print("No data changed")
        }
    }
    
    func compareData(_ viewData: any View, _ modelData: AttributedString) -> Bool {
        let viewText = String(describing: viewData)
        if viewText.contains(NSAttributedString(modelData).string) {
            print("mainString contains subString")
            return true
        } else {
            print("viewText : \(viewText)")
            return false
        }
    }
    
    func testSortCriterionInit() throws {
        let orderPickerItemModel = OrderPickerItemModel(criterion: "Price", isSelected: false, isAscending: true, ascendingText: "asc", descendingText: "des")
        
        let sortCriterionView = SortCriterion(title: orderPickerItemModel.criterion, data: .constant(orderPickerItemModel))

        XCTAssertTrue(type(of: sortCriterionView.checkmark) == FioriSwiftUICore.Checkmark.self, "type error")
        XCTAssertTrue(type(of: sortCriterionView.title) == FioriSwiftUICore.Title.self, "type error")
        XCTAssertTrue(type(of: sortCriterionView.subtitle) == FioriSwiftUICore.Subtitle.self, "type error")
        XCTAssertFalse(sortCriterionView.checkmark.isEmpty)
        
        XCTAssertEqual(sortCriterionView.data.criterion, orderPickerItemModel.criterion)
        XCTAssertEqual(sortCriterionView.data.isSelected, orderPickerItemModel.isSelected)
        XCTAssertEqual(sortCriterionView.data.isAscending, orderPickerItemModel.isAscending)
        XCTAssertEqual(sortCriterionView.data.ascendingText, orderPickerItemModel.ascendingText)
        XCTAssertEqual(sortCriterionView.data.descendingText, orderPickerItemModel.descendingText)
        XCTAssertEqual(sortCriterionView.data.selectedIcon, orderPickerItemModel.selectedIcon)

        XCTAssertTrue(self.compareData(sortCriterionView.title, orderPickerItemModel.criterion))
    }
    
    func testSortCriterion() throws {
        let orderPickerItemModel = OrderPickerItemModel(selectedIcon: Image(systemName: "checkmark.circle.fill"), criterion: "Price 1", isSelected: true, isAscending: false, ascendingText: "asc", descendingText: "des", customStyle: CustomSortCriterionStyle())
        
        let sortCriterionView = SortCriterion(title: orderPickerItemModel.criterion, data: .constant(orderPickerItemModel))
        
        XCTAssertEqual(sortCriterionView.data.criterion, orderPickerItemModel.criterion)
        XCTAssertEqual(sortCriterionView.data.isSelected, orderPickerItemModel.isSelected)
        XCTAssertEqual(sortCriterionView.data.isAscending, orderPickerItemModel.isAscending)
        XCTAssertEqual(sortCriterionView.data.ascendingText, orderPickerItemModel.ascendingText)
        XCTAssertEqual(sortCriterionView.data.descendingText, orderPickerItemModel.descendingText)
        
        XCTAssertEqual(sortCriterionView.data.selectedIcon, orderPickerItemModel.selectedIcon)
        
        XCTAssertTrue(self.compareData(sortCriterionView.title, orderPickerItemModel.criterion))
    }
    
    func testOrderPickerInit() throws {
        let orderPickerView = OrderPicker(
            data: self.$data,
            onChangeHandler: self.changeHandle
        )
        
        XCTAssertEqual(orderPickerView.isAtLeastOneSelected, true)
        XCTAssertEqual(orderPickerView.data, self.data)
    }
    
    func testOrderPickerInit2() throws {
        let orderPickerView = OrderPicker(
            optionalTitle: "Information",
            data: self.$data1,
            isAtLeastOneSelected: false,
            onChangeHandler: self.changeHandle
        )

        XCTAssertTrue(self.compareData(orderPickerView.optionalTitle, AttributedString("Information")))
        XCTAssertEqual(orderPickerView.isAtLeastOneSelected, false)
        XCTAssertEqual(orderPickerView.data, self.data1)
    }
    
    func testOrderPickerItemList() throws {
        let orderPickerView = OrderPicker(
            optionalTitle: "Information",
            data: self.$data1,
            isAtLeastOneSelected: false,
            onChangeHandler: self.changeHandle
        )
        
        XCTAssertEqual(orderPickerView.data.count, self.data1.count)
        
        XCTAssertEqual(orderPickerView.data[0].criterion, self.data1[0].criterion)
        XCTAssertEqual(orderPickerView.data[0].isSelected, self.data1[0].isSelected)
        XCTAssertEqual(orderPickerView.data[0].isAscending, self.data1[0].isAscending)
        XCTAssertEqual(orderPickerView.data[0].ascendingText, self.data1[0].ascendingText)
        XCTAssertEqual(orderPickerView.data[0].descendingText, self.data1[0].descendingText)
        
        XCTAssertEqual(orderPickerView.data[1].criterion, self.data1[1].criterion)
        XCTAssertEqual(orderPickerView.data[1].isSelected, self.data1[1].isSelected)
        XCTAssertEqual(orderPickerView.data[1].isAscending, self.data1[1].isAscending)
        XCTAssertEqual(orderPickerView.data[1].ascendingText, self.data1[1].ascendingText)
        XCTAssertEqual(orderPickerView.data[1].descendingText, self.data1[1].descendingText)
        
        XCTAssertEqual(orderPickerView.data[2].criterion, self.data1[2].criterion)
        XCTAssertEqual(orderPickerView.data[2].isSelected, self.data1[2].isSelected)
        XCTAssertEqual(orderPickerView.data[2].isAscending, self.data1[2].isAscending)
        XCTAssertEqual(orderPickerView.data[2].ascendingText, self.data1[2].ascendingText)
        XCTAssertEqual(orderPickerView.data[2].descendingText, self.data1[2].descendingText)
    }
}

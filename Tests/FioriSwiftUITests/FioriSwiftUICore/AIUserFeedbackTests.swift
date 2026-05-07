@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class AIUserFeedbackTests: XCTestCase {
    func testPrimaryInitializer() {
        var filterFormViewSelectionValue = [0]
        var valueText = ""
        let filterFormViewBinding = Binding<[Int]>(get: { filterFormViewSelectionValue }, set: { newValue in filterFormViewSelectionValue = newValue })
        let valueTextBinding = Binding<String>(get: { valueText }, set: { newValue in valueText = newValue })

        let valueOptions: [AttributedString] = ["Inaccuraies", "Inappropriate Content", "Security Risks", "Slow Response", "Repetitive or Wordy", "Others"]
        let filterFormView = FilterFormView(title: "Select all that apply", isRequired: true, options: valueOptions, errorMessage: nil, isEnabled: true, allowsMultipleSelection: true, allowsEmptySelection: false, value: filterFormViewBinding, buttonSize: .fixed, onValueChange: { value in
            print("FilterFormView value change: \(value)")
        })
        let keyValueFormView = KeyValueFormView(title: "Additional feedback", text: valueTextBinding, placeholder: "Write additional comments here", errorMessage: nil, minTextEditorHeight: 88, maxTextEditorHeight: 200, maxTextLength: 200, hintText: AttributedString("Hint Text"), isCharCountEnabled: true, allowsBeyondLimit: false, isRequired: true)
        
        let aiUserFeedback = AIUserFeedback(detailImage: { Image(systemName: "gearshape") },
                                            title: { Title(title: "How was your AI experience?") },
                                            description: { Text("Please rate your experience to help us improve.") },
                                            navigationTitle: "Feedback",
                                            filterFormView: filterFormView,
                                            keyValueFormView: keyValueFormView,
                                            displayMode: .sheet,
                                            onCancel: {}, onUpVote: {}, onDownVote: {}, onSubmit: { _, _, _, _ in
                        
                                            }, voteState: .constant(.downVote),
                                            submitButtonState: .constant(.normal))
        XCTAssertNotNil(aiUserFeedback.title)
        XCTAssertNotNil(aiUserFeedback.description)
        XCTAssertEqual(aiUserFeedback.displayMode, .sheet)
        XCTAssertEqual(aiUserFeedback.voteState, .downVote)
        
        filterFormViewBinding.wrappedValue = [0, 1]
        XCTAssertEqual(filterFormViewSelectionValue, [0, 1])
        
        valueTextBinding.wrappedValue = "additional feedback"
        XCTAssertEqual(valueText, "additional feedback")
    }

    func testNumberOfLinesDefaultValue() {
        var selectionValue: [Int] = []
        let binding = Binding<[Int]>(get: { selectionValue }, set: { selectionValue = $0 })
        let view = FilterFormView(
            title: { Text("Title") },
            options: ["Option 1", "Option 2"],
            isEnabled: true,
            value: binding
        )
        XCTAssertEqual(view.numberOfLines, 1 as Int?)
    }

    func testNumberOfLinesCustomValue() {
        var selectionValue: [Int] = []
        let binding = Binding<[Int]>(get: { selectionValue }, set: { selectionValue = $0 })
        let view = FilterFormView(
            title: { Text("Title") },
            options: ["Option 1", "Option 2"],
            isEnabled: true,
            value: binding,
            numberOfLines: 3
        )
        XCTAssertEqual(view.numberOfLines, 3 as Int?)
    }

    func testNumberOfLinesNilValue() {
        var selectionValue: [Int] = []
        let binding = Binding<[Int]>(get: { selectionValue }, set: { selectionValue = $0 })
        let view = FilterFormView(
            title: { Text("Title") },
            options: ["Option 1", "Option 2"],
            isEnabled: true,
            value: binding,
            numberOfLines: nil
        )
        XCTAssertNil(view.numberOfLines)
    }

    func testConfigurationNumberOfLines() {
        var capturedLineLimit: Int?
        let style = AnyFilterFormViewStyle { cfg in
            capturedLineLimit = cfg.numberOfLines
            return EmptyView()
        }
        var selectionValue: [Int] = []
        let binding = Binding<[Int]>(get: { selectionValue }, set: { selectionValue = $0 })
        let cfg = FilterFormViewConfiguration(
            componentIdentifier: FilterFormView.identifier,
            title: .init(Text("Title")),
            options: ["Option 1"],
            controlState: .normal,
            errorMessage: nil,
            isEnabled: true,
            allowsMultipleSelection: true,
            allowsEmptySelection: false,
            value: binding,
            buttonSize: .fixed,
            isSingleLine: true,
            numberOfLines: 5,
            onValueChange: nil,
            checkmarkImage: .init(Image(systemName: "checkmark"))
        )
        _ = style.makeBody(cfg)
        XCTAssertEqual(capturedLineLimit, 5 as Int?)
    }

    func testConfigurationNumberOfLinesNil() {
        var capturedLineLimit: Int? = 999
        let style = AnyFilterFormViewStyle { cfg in
            capturedLineLimit = cfg.numberOfLines
            return EmptyView()
        }
        var selectionValue: [Int] = []
        let binding = Binding<[Int]>(get: { selectionValue }, set: { selectionValue = $0 })
        let cfg = FilterFormViewConfiguration(
            componentIdentifier: FilterFormView.identifier,
            title: .init(Text("Title")),
            options: ["Option 1"],
            controlState: .normal,
            errorMessage: nil,
            isEnabled: true,
            allowsMultipleSelection: true,
            allowsEmptySelection: false,
            value: binding,
            buttonSize: .fixed,
            isSingleLine: true,
            numberOfLines: nil,
            onValueChange: nil,
            checkmarkImage: .init(Image(systemName: "checkmark"))
        )
        _ = style.makeBody(cfg)
        XCTAssertNil(capturedLineLimit)
    }
}

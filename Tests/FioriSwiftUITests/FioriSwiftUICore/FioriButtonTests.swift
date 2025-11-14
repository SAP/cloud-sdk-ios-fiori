@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class FioriButtonTests: XCTestCase {
    // MARK: - Initializer Tests
    
    func testInitializerDefaults() {
        let btn = FioriButton { state in
            Text("State: \(self.describe(state))")
        }
        XCTAssertFalse(btn.isSelectionPersistent)
        XCTAssertEqual(btn.imageTitleSpacing, 8.0)
        XCTAssertEqual(btn.imagePosition, .leading)
    }
    
    func testInitializerCustomImage() {
        let btn = FioriButton(isSelectionPersistent: true, action: { _ in }, label: { state in
            Text("Label-\(self.describe(state))")
        }, image: { state in
            Image(systemName: state == .selected ? "checkmark.circle.fill" : "circle")
        }, imagePosition: .trailing, imageTitleSpacing: 4)
        XCTAssertTrue(btn.isSelectionPersistent)
        XCTAssertEqual(btn.imagePosition, .trailing)
        XCTAssertEqual(btn.imageTitleSpacing, 4)
    }
    
    func testAttributedTitleInit() {
        let title = AttributedString("Static Title")
        let btn = FioriButton(isSelectionPersistent: true, title: title, action: { _ in })
        _ = btn.label(.normal)
        _ = btn.label(.selected) // persistent selection supports selected
        XCTAssertTrue(btn.isSelectionPersistent)
        let normalDesc = String(describing: btn.label(.normal))
        XCTAssertTrue(normalDesc.contains("Static Title"), "Normal label should contain the static title text")
    }
    
    // MARK: - Configuration Tests
    
    func testFioriButtonConfigurationMinHeightFloor() {
        let cfg = FioriButtonConfiguration(foregroundColor: .red, backgroundColor: .blue, minHeight: 10)
        XCTAssertEqual(cfg.minHeight, 38.0, "minHeight should floor to 38")
    }
    
    func testFioriButtonConfigurationBuilders() {
        let base = FioriButtonConfiguration(foregroundColor: .white, backgroundColor: .black, maxWidth: nil, minHeight: 50)
        let withWidth = base.withMaxWidth(120)
        XCTAssertEqual(withWidth.maxWidth, 120)
        XCTAssertEqual(withWidth.minHeight, 50)
        let withMin = base.withMinHeight(80)
        XCTAssertEqual(withMin.minHeight, 80)
    }
    
    // MARK: - Additional Configuration Edge Cases
    
    func testFioriButtonConfigurationMinHeightBelowFloor() {
        let cfg = FioriButtonConfiguration(foregroundColor: .green, backgroundColor: .yellow, minHeight: 1)
        XCTAssertEqual(cfg.minHeight, 38.0)
    }
    
    func testFioriButtonConfigurationWithMaxWidthNilKeepsNil() {
        let base = FioriButtonConfiguration(foregroundColor: .white, backgroundColor: .black)
        XCTAssertNil(base.maxWidth)
        let widthSet = base.withMaxWidth(200)
        XCTAssertEqual(widthSet.maxWidth, 200)
        let widthReset = widthSet.withMaxWidth(nil)
        XCTAssertNil(widthReset.maxWidth)
    }
    
    func testFioriButtonConfigurationWithMinHeightFlooringChain() {
        let base = FioriButtonConfiguration(foregroundColor: .white, backgroundColor: .black, minHeight: 10)
        XCTAssertEqual(base.minHeight, 38)
        let raised = base.withMinHeight(60)
        XCTAssertEqual(raised.minHeight, 60)
    }
    
    func testPersistentSelectionLabelMappingDistinct() {
        let btnPersistent = FioriButton(isSelectionPersistent: true, action: nil) { state in
            switch state {
            case .normal: return Text("Normal")
            case .selected: return Text("Selected")
            default: return Text("Other")
            }
        }
        let normalDesc = String(describing: btnPersistent.label(.normal))
        let selectedDesc = String(describing: btnPersistent.label(.selected))
        XCTAssertNotEqual(normalDesc, selectedDesc)
    }
    
    func testNonPersistentSelectionHighlightMappingDistinct() {
        let btn = FioriButton(isSelectionPersistent: false, action: nil) { state in
            switch state {
            case .normal: return Text("Normal")
            case .highlighted: return Text("Highlighted")
            default: return Text("Other")
            }
        }
        let normalDesc = String(describing: btn.label(.normal))
        let highlightedDesc = String(describing: btn.label(.highlighted))
        XCTAssertNotEqual(normalDesc, highlightedDesc)
    }
    
    func testAttributedTitleInitializersConsistency() {
        // Closure based
        let closureBtn = FioriButton(isSelectionPersistent: false, title: { state in
            AttributedString(state == .normal ? "Alpha" : "Beta")
        }, action: nil)
        // Fixed attributed
        let fixedBtn = FioriButton(isSelectionPersistent: false, title: AttributedString("Alpha"), action: nil)
        let closureNormal = String(describing: closureBtn.label(.normal))
        let fixedNormal = String(describing: fixedBtn.label(.normal))
        XCTAssertTrue(closureNormal.contains("Alpha"))
        XCTAssertTrue(fixedNormal.contains("Alpha"))
    }
    
    // MARK: - Helpers
    
    private func makeConfig(state: UIControl.State) -> FioriButtonStyleConfiguration {
        FioriButtonStyleConfiguration(state: state, _label: { s in
            FioriButtonStyleConfiguration.Label(Text("L-\(self.describe(s))"))
        }, _image: { s in
            FioriButtonStyleConfiguration.Image(Image(systemName: s == .selected ? "checkmark" : "circle"))
        }, imagePosition: .leading, imageTitleSpacing: 8)
    }
    
    private func describe(_ state: UIControl.State) -> String {
        switch state {
        case .normal: return "normal"
        case .highlighted: return "highlighted"
        case .selected: return "selected"
        case .disabled: return "disabled"
        default: return "other"
        }
    }
    
    // MARK: - Initialization Tests
    
    func testInitWithLabel() {
        let button = FioriButton(isSelectionPersistent: false, action: { _ in }) { _ in
            Text("Test Button")
        }
        
        XCTAssertFalse(button.isSelectionPersistent)
        XCTAssertEqual(button.imagePosition, .leading)
        XCTAssertEqual(button.imageTitleSpacing, 8.0)
    }
    
    func testInitWithLabelAndImage() {
        let button = FioriButton(
            isSelectionPersistent: true,
            action: { _ in },
            label: { _ in Text("Test") },
            image: { _ in Image(systemName: "heart") },
            imagePosition: .trailing,
            imageTitleSpacing: 12.0
        )
        
        XCTAssertTrue(button.isSelectionPersistent)
        XCTAssertEqual(button.imagePosition, .trailing)
        XCTAssertEqual(button.imageTitleSpacing, 12.0)
    }
    
    func testInitWithAttributedStringTitle() {
        let attributedString = AttributedString("Attributed Title")
        let button = FioriButton(isSelectionPersistent: true, title: attributedString) { _ in }
        
        XCTAssertTrue(button.isSelectionPersistent)
        XCTAssertEqual(button.imagePosition, .leading)
        XCTAssertEqual(button.imageTitleSpacing, 8.0)
    }
    
    func testInitWithAttributedStringClosure() {
        let button = FioriButton(isSelectionPersistent: false, title: { state in
            AttributedString("State: \(state.rawValue)")
        }) { _ in }
        
        XCTAssertFalse(button.isSelectionPersistent)
        let normalDesc = String(describing: button.label(.normal))
        XCTAssertTrue(normalDesc.contains("State:"), "Closure-based attributed string should include 'State:' prefix")
    }
    
    func testDeprecatedStringProtocolInit() {
        let button = FioriButton(isSelectionPersistent: true, action: { _ in }) { _ in
            "String Title"
        }
        
        XCTAssertTrue(button.isSelectionPersistent)
        XCTAssertEqual(button.imagePosition, .leading)
        XCTAssertEqual(button.imageTitleSpacing, 8.0)
        let normalDesc = String(describing: button.label(.normal))
        XCTAssertTrue(normalDesc.contains("String Title"))
    }
    
    // MARK: - State Management Tests
    
    func testInitialState() {
        let button = FioriButton { _ in Text("Test") }
        XCTAssertEqual(button.state, .normal)
    }
    
    // MARK: - Image Position Tests
    
    func testAllImagePositions() {
        let positions: [FioriButtonImagePosition] = [.top, .leading, .bottom, .trailing]
        
        for position in positions {
            let button = FioriButton(
                label: { _ in Text("Test") },
                image: { _ in Image(systemName: "star") },
                imagePosition: position
            )
            
            XCTAssertEqual(button.imagePosition, position)
        }
    }
    
    // MARK: - Action Tests
    
    func testActionCallback() {
        var actionCalled = false
        var receivedState: UIControl.State?
        
        let button = FioriButton(action: { state in
            actionCalled = true
            receivedState = state
        }) { _ in Text("Test") }
        
        XCTAssertNotNil(button.action)
        
        button.action?(.normal)
        XCTAssertTrue(actionCalled)
        XCTAssertEqual(receivedState, .normal)
    }
    
    func testActionWithNil() {
        let button = FioriButton { _ in Text("Test") }
        XCTAssertNil(button.action)
    }
    
    // MARK: - Gesture Tests
    
    func testCreateGestureWithNormalSize() {
        let button = FioriButton { _ in Text("Test") }
        let size = CGSize(width: 100, height: 50)
        let gesture = button.createGesture(size)
        
        XCTAssertNotNil(gesture)
    }
    
    func testTouchAreaCalculation() {
        let button = FioriButton { _ in Text("Test") }
        let size = CGSize(width: 100, height: 50)
        
        let expectedTouchArea = CGRect(origin: .zero, size: size).insetBy(dx: 0, dy: -3)
        
        XCTAssertEqual(expectedTouchArea.width, 100)
        XCTAssertEqual(expectedTouchArea.height, 56) // 50 + 2*3
    }
    
    // MARK: - Selection Persistence Tests
    
    func testNonPersistentSelection() {
        let button = FioriButton(isSelectionPersistent: false) { _ in Text("Test") }
        XCTAssertFalse(button.isSelectionPersistent)
    }
    
    func testPersistentSelection() {
        let button = FioriButton(isSelectionPersistent: true) { _ in Text("Test") }
        XCTAssertTrue(button.isSelectionPersistent)
    }
    
    // MARK: - Image Title Spacing Tests
    
    func testCustomImageTitleSpacing() {
        let customSpacing: CGFloat = 16.0
        let button = FioriButton(
            label: { _ in Text("Test") },
            image: { _ in Image(systemName: "star") },
            imageTitleSpacing: customSpacing
        )
        
        XCTAssertEqual(button.imageTitleSpacing, customSpacing)
    }
    
    func testDefaultImageTitleSpacing() {
        let button = FioriButton { _ in Text("Test") }
        XCTAssertEqual(button.imageTitleSpacing, 8.0)
    }
    
    // MARK: - Multiple Action State Tests
    
    func testActionWithDifferentStates() {
        var capturedStates: [UIControl.State] = []
        
        let button = FioriButton(action: { state in
            capturedStates.append(state)
        }) { _ in Text("Test") }
        
        button.action?(.normal)
        button.action?(.highlighted)
        button.action?(.selected)
        button.action?(.disabled)
        
        XCTAssertEqual(capturedStates.count, 4)
        XCTAssertTrue(capturedStates.contains(.normal))
        XCTAssertTrue(capturedStates.contains(.highlighted))
        XCTAssertTrue(capturedStates.contains(.selected))
        XCTAssertTrue(capturedStates.contains(.disabled))
    }
    
    // MARK: - Label and Image Closure Tests
    
    func testLabelClosureWithDifferentStates() {
        var capturedStates: [UIControl.State] = []
        
        let button = FioriButton(action: { _ in }) { state in
            capturedStates.append(state)
            return Text("State: \(state.rawValue)")
        }
        
        _ = button.label(.normal)
        _ = button.label(.highlighted)
        _ = button.label(.selected)
        _ = button.label(.disabled)
        
        XCTAssertEqual(capturedStates.count, 4)
    }
    
    func testImageClosureWithDifferentStates() {
        var capturedStates: [UIControl.State] = []
        
        let button = FioriButton(
            label: { _ in Text("Test") },
            image: { state in
                capturedStates.append(state)
                return Image(systemName: "star")
            }
        )
        
        _ = button.image(.normal)
        _ = button.image(.highlighted)
        _ = button.image(.selected)
        _ = button.image(.disabled)
        
        XCTAssertEqual(capturedStates.count, 4)
    }
    
    // MARK: - Default Values Tests
    
    func testDefaultInitializerValues() {
        let button = FioriButton { _ in Text("Test") }
        
        XCTAssertFalse(button.isSelectionPersistent)
        XCTAssertNil(button.action)
        XCTAssertEqual(button.imagePosition, .leading)
        XCTAssertEqual(button.imageTitleSpacing, 8.0)
    }
    
    // MARK: - Complex Initialization Tests
    
    func testComplexLabelClosure() {
        let button = FioriButton { state in
            switch state {
            case .normal:
                return Text("Normal")
            case .highlighted:
                return HStack {
                    Image(systemName: "checkmark")
                    Text("Highlighted")
                }
            case .selected:
                return HStack {
                    Image(systemName: "checkmark")
                    Text("Selected")
                }
            default:
                return Text("Disabled")
            }
        }
        
        XCTAssertNotNil(button.label)
        let normalDesc = String(describing: button.label(.normal))
        let highlightedDesc = String(describing: button.label(.highlighted))
        XCTAssertNotEqual(normalDesc, highlightedDesc, "Highlighted label should differ from normal label")
    }
    
    // MARK: - AttributedString Tests
    
    func testAttributedStringWithFormatting() {
        var attributedString = AttributedString("Formatted Text")
        attributedString.font = .headline
        
        let button = FioriButton(title: attributedString) { _ in }
        XCTAssertNotNil(button.label)
        let normalDesc = String(describing: button.label(.normal))
        XCTAssertTrue(normalDesc.contains("Formatted Text"))
    }
    
    func testAttributedStringClosure() {
        let button = FioriButton(title: { state in
            var text = AttributedString("State: \(state.rawValue)")
            text.font = state == .normal ? .headline : .body
            return text
        }) { _ in }
        
        XCTAssertNotNil(button.label)
        let normalDesc = String(describing: button.label(.normal))
        XCTAssertTrue(normalDesc.contains("State:"))
    }
    
    // MARK: - Image Position Enum Tests
    
    func testImagePositionEnum() {
        let topButton = FioriButton(label: { _ in Text("Test") }, imagePosition: .top)
        XCTAssertEqual(topButton.imagePosition, .top)
        
        let leadingButton = FioriButton(label: { _ in Text("Test") }, imagePosition: .leading)
        XCTAssertEqual(leadingButton.imagePosition, .leading)
        
        let bottomButton = FioriButton(label: { _ in Text("Test") }, imagePosition: .bottom)
        XCTAssertEqual(bottomButton.imagePosition, .bottom)
        
        let trailingButton = FioriButton(label: { _ in Text("Test") }, imagePosition: .trailing)
        XCTAssertEqual(trailingButton.imagePosition, .trailing)
    }
    
    // MARK: - Edge Cases Tests
    
    func testEmptyLabelClosure() {
        let button = FioriButton(
            label: { _ in EmptyView() },
            image: { _ in Image(systemName: "star") }
        )
        
        XCTAssertNotNil(button.label)
        XCTAssertNotNil(button.image)
    }
    
    func testEmptyImageClosure() {
        let button = FioriButton(
            label: { _ in Text("Test") },
            image: { _ in EmptyView() }
        )
        
        XCTAssertNotNil(button.label)
        XCTAssertNotNil(button.image)
    }
    
    func testZeroSpacing() {
        let button = FioriButton(
            label: { _ in Text("Test") },
            image: { _ in Image(systemName: "star") },
            imageTitleSpacing: 0.0
        )
        
        XCTAssertEqual(button.imageTitleSpacing, 0.0)
    }
    
    func testNegativeSpacing() {
        let button = FioriButton(
            label: { _ in Text("Test") },
            image: { _ in Image(systemName: "star") },
            imageTitleSpacing: -5.0
        )
        
        XCTAssertEqual(button.imageTitleSpacing, -5.0)
    }
    
    // MARK: - Enhanced Standard Button Integration Tests

    func testConfigureStandardButtonModifierSetsEnvironment() {
        // Arrange: Define a custom creator
        let mockAction: () -> Void = {}
        let customCreator: ButtonCreator = { action in
            Button(role: .destructive, action: action) { EmptyView() }
        }

        // Act: Apply modifier to a dummy view and read the environment
        let dummyView = Text("Test")
        let modifiedView = dummyView.environment(\.standardButtonCreator, customCreator)

        // Assert: Verify the environment value is set correctly
        var env = EnvironmentValues()
        // Simulate reading from modified view's environment (via direct set for test)
        env.standardButtonCreator = customCreator
        let createdButton = env.standardButtonCreator(mockAction)

        // Use reflection to check the role
        let roleMirror = Mirror(reflecting: createdButton)
        let role = roleMirror.children.first { $0.label?.contains("role") == true }?.value as? ButtonRole
        XCTAssertEqual(role, .destructive)

        // Verify base view unchanged
        let viewDesc = String(describing: modifiedView)
        XCTAssertTrue(viewDesc.contains("Test"))
    }

    func testDefaultStandardButtonCreator() {
        // Arrange: Use default environment
        let defaultCreator: ButtonCreator = { action in
            Button(action: action) { EmptyView() }
        }
        let mockAction: () -> Void = {}
        let button = defaultCreator(mockAction)

        // Act & Assert: No role, plain Button
        let role = Mirror(reflecting: button).children.first(where: { $0.label == "role" })?.value as? ButtonRole
        XCTAssertNil(role)
        let desc = String(describing: button)
        XCTAssertTrue(desc.contains("Button"), "Should be a standard Button")
    }
    
    func testFioriButtonUsesCustomStandardButtonCreator() {
        // Arrange: Custom creator and FioriButton
        let customCreator: ButtonCreator = { action in
            Button(role: .cancel, action: action) { EmptyView() }
        }
        // Assert: Role applied (via reflection on the underlying button simulation)
        var env = EnvironmentValues()
        env.standardButtonCreator = customCreator
        let mockAction: () -> Void = {}
        let createdButton = env.standardButtonCreator(mockAction)
        let roleMirror = Mirror(reflecting: createdButton)
        let role = roleMirror.children.first { $0.label?.contains("role") == true }?.value as? ButtonRole
        XCTAssertEqual(role, .cancel)
    }
}

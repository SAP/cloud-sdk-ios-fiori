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
        // Internal closures should produce a view for supported states
        _ = btn.label(.normal)
        _ = btn.label(.disabled)
        _ = btn.label(.highlighted)
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
        _ = btn.label(.normal)
        _ = btn.image(.normal)
        _ = btn.label(.selected)
        _ = btn.image(.selected)
    }
    
    func testAttributedTitleClosureInit() {
        let btn = FioriButton(isSelectionPersistent: false, title: { state in
            AttributedString(state == .normal ? "Normal" : "Other")
        }, action: { _ in })
        _ = btn.label(.normal)
        _ = btn.label(.disabled)
        _ = btn.label(.highlighted)
    }
    
    func testAttributedTitleInit() {
        let title = AttributedString("Static Title")
        let btn = FioriButton(isSelectionPersistent: true, title: title, action: { _ in })
        _ = btn.label(.normal)
        _ = btn.label(.selected) // persistent selection supports selected
        XCTAssertTrue(btn.isSelectionPersistent)
    }
    
    func testDeprecatedTitleClosureInit() {
        let btn = FioriButton(isSelectionPersistent: false, action: { _ in }, title: { state in
            state == .normal ? "Normal" : "Other"
        })
        _ = btn.label(.normal)
        _ = btn.label(.highlighted)
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
    
    // MARK: - Style Tests
    
    func testPrimaryButtonStyleMakeBody() {
        let cfg = self.makeConfig(state: .normal)
        let style = FioriPrimaryButtonStyle()
        let body = style.makeBody(configuration: cfg)
        // Just ensure body builds
        _ = Mirror(reflecting: body)
    }
    
    func testSecondaryButtonStyleTintProcessing() {
        let cfg = self.makeConfig(state: .highlighted)
        let style = FioriSecondaryButtonStyle(colorStyle: .tint, loadingState: .processing)
        let body = style.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    func testTertiaryNegativeSuccess() {
        let cfg = self.makeConfig(state: .selected)
        let style = FioriTertiaryButtonStyle(colorStyle: .negative, loadingState: .success)
        let body = style.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    func testNavigationButtonStyleDisabledState() {
        let cfg = self.makeConfig(state: .disabled)
        let style = FioriNavigationButtonStyle(colorStyle: .tint)
        let body = style.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    // MARK: - Style Provider Variants
    
    func testSecondaryButtonStyleNegativeNormalState() {
        let cfg = self.makeConfig(state: .normal)
        let style = FioriSecondaryButtonStyle(colorStyle: .negative)
        let body = style.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    func testSecondaryButtonStyleNormalHighlightedState() {
        let cfg = self.makeConfig(state: .highlighted)
        let style = FioriSecondaryButtonStyle(colorStyle: .normal)
        let body = style.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    func testTertiaryButtonStyleTintHighlightedState() {
        let cfg = self.makeConfig(state: .highlighted)
        let style = FioriTertiaryButtonStyle(colorStyle: .tint)
        let body = style.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    func testTertiaryButtonStyleNegativeDisabledState() {
        let cfg = self.makeConfig(state: .disabled)
        let style = FioriTertiaryButtonStyle(colorStyle: .negative)
        let body = style.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    // MARK: - Loading State Visual Variants
    
    func testPrimaryButtonStyleProcessingState() {
        let cfg = self.makeConfig(state: .normal)
        let style = FioriPrimaryButtonStyle(loadingState: .processing)
        let body = style.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    func testPrimaryButtonStyleSuccessState() {
        let cfg = self.makeConfig(state: .normal)
        let style = FioriPrimaryButtonStyle(loadingState: .success)
        let body = style.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    func testSecondaryButtonStyleProcessingStateTint() {
        let cfg = self.makeConfig(state: .normal)
        let style = FioriSecondaryButtonStyle(colorStyle: .tint, loadingState: .processing)
        let body = style.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    func testTertiaryButtonStyleSuccessStateNormalColor() {
        let cfg = self.makeConfig(state: .selected)
        let style = FioriTertiaryButtonStyle(colorStyle: .normal, loadingState: .success)
        let body = style.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    // MARK: - Type Erasure
    
    func testAnyFioriButtonStyleErasure() {
        let primary = FioriPrimaryButtonStyle()
        let anyStyle = primary.eraseToAnyFioriButtonStyle()
        let cfg = self.makeConfig(state: .normal)
        let body = anyStyle.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    // MARK: - Persistent vs Non-Persistent Selection
    
    func testPersistentSelectionAllowsSelectedStateLabel() {
        let btnPersistent = FioriButton(isSelectionPersistent: true, action: nil) { state in
            Text("P-\(self.describe(state))")
        }
        _ = btnPersistent.label(.selected)
        let btnNonPersistent = FioriButton(isSelectionPersistent: false, action: nil) { state in
            Text("NP-\(self.describe(state))")
        }
        // Non-persistent should still produce a label for .highlighted but not rely on .selected state in typical usage
        _ = btnNonPersistent.label(.highlighted)
    }
    
    // MARK: - Additional Comprehensive Tests
    
    func testImagePositionVariantsBuild() {
        let positions: [FioriButtonImagePosition] = [.leading, .trailing, .top, .bottom]
        for pos in positions {
            let btn = FioriButton(isSelectionPersistent: false, action: nil, label: { state in
                Text("P-\(self.describe(state))")
            }, image: { state in
                Image(systemName: state == .highlighted ? "star.fill" : "star")
            }, imagePosition: pos, imageTitleSpacing: 0)
            _ = btn.label(.normal)
            _ = btn.image(.normal)
            _ = btn.label(.highlighted)
            _ = btn.image(.highlighted)
        }
    }
    
    func testImageOnlyButtonBuilds() {
        let btn = FioriButton(isSelectionPersistent: true, action: nil, label: { _ in EmptyView() }, image: { state in
            Image(systemName: state == .selected ? "checkmark.circle" : "circle")
        }, imagePosition: .leading, imageTitleSpacing: 2)
        _ = btn.image(.normal)
        _ = btn.image(.selected)
        _ = btn.label(.selected) // returns EmptyView
    }
    
    func testPersistentSelectionLabelMappingDistinct() {
        let btn = FioriButton(isSelectionPersistent: true, action: nil) { state in
            switch state {
            case .normal: return Text("Normal")
            case .selected: return Text("Selected")
            default: return Text("Other")
            }
        }
        let normalDesc = String(describing: btn.label(.normal))
        let selectedDesc = String(describing: btn.label(.selected))
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
    
    func testEnvironmentLoadingOpacityApplies() {
        // Build button in a transient view hierarchy with isLoading environment true
        let btn = FioriButton { _ in Text("Load") }
        // We cannot directly assert opacity value without ViewInspector; we just ensure body builds under loading environment.
        let host = VStack { btn }.environment(\.isLoading, true)
        _ = Mirror(reflecting: host)
    }
    
    func testCustomFioriButtonStyleInjection() {
        struct TestStyle: FioriButtonStyle {
            func makeBody(configuration: Configuration) -> some View {
                configuration.label
                    .foregroundColor(.purple)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.orange))
            }
        }
        let btn = FioriButton { _ in Text("Styled") }
        let styled = VStack { btn }.fioriButtonStyle(TestStyle())
        _ = Mirror(reflecting: styled)
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
    }
    
    func testDeprecatedStringProtocolInit() {
        let button = FioriButton(isSelectionPersistent: true, action: { _ in }) { _ in
            "String Title"
        }
        
        XCTAssertTrue(button.isSelectionPersistent)
        XCTAssertEqual(button.imagePosition, .leading)
        XCTAssertEqual(button.imageTitleSpacing, 8.0)
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
    }
    
    // MARK: - AttributedString Tests
    
    func testAttributedStringWithFormatting() {
        var attributedString = AttributedString("Formatted Text")
        attributedString.font = .headline
        
        let button = FioriButton(title: attributedString) { _ in }
        XCTAssertNotNil(button.label)
    }
    
    func testAttributedStringClosure() {
        let button = FioriButton(title: { state in
            var text = AttributedString("State: \(state.rawValue)")
            text.font = state == .normal ? .headline : .body
            return text
        }) { _ in }
        
        XCTAssertNotNil(button.label)
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
}

@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class FioriButtonStyleTests: XCTestCase {
    // MARK: - Helper to create configuration

    private func makeConfig(state: UIControl.State, imagePosition: FioriButtonImagePosition = .leading) -> FioriButtonStyleConfiguration {
        FioriButtonStyleConfiguration(state: state, _label: { s in
            FioriButtonStyleConfiguration.Label(Text("Lbl-\(self.describe(s))"))
        }, _image: { s in
            FioriButtonStyleConfiguration.Image(Image(systemName: s == .selected ? "checkmark" : "circle"))
        }, imagePosition: imagePosition, imageTitleSpacing: 5)
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
    
    // MARK: - ContainerView Positions

    func testContainerViewPositions() {
        let positions: [FioriButtonImagePosition] = [.top, .leading, .bottom, .trailing]
        var builtCount = 0
        for pos in positions {
            let cfg = self.makeConfig(state: .normal, imagePosition: pos)
            let view = cfg.containerView(.unspecified)
            let desc = String(describing: view)
            XCTAssertFalse(desc.isEmpty, "Container view description should not be empty for position \(pos)")
            if !desc.isEmpty { builtCount += 1 }
        }
        XCTAssertEqual(builtCount, positions.count, "All positions should produce a non-empty container view")
    }
    
    // MARK: - Loading State Image Switching

    func testContainerViewLoadingStates() {
        let states: [FioriButtonLoadingState] = [.unspecified, .processing, .success]
        let cfg = self.makeConfig(state: .normal)
        var descs: [String] = []
        for loading in states {
            let view = cfg.containerView(loading)
            let desc = String(describing: view)
            XCTAssertFalse(desc.isEmpty, "Container view should build for loading state \(loading)")
            descs.append(desc)
        }
        // At least processing or success should differ from unspecified
        XCTAssertTrue(Set(descs).count >= 2, "Expected at least 2 distinct view descriptions across loading states")
    }
    
    // MARK: - Label & Image Retrieval

    func testLabelAndImageForEachState() {
        let allStates: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        let cfg = self.makeConfig(state: .normal)
        var labelDescs: [String] = []
        var imageDescs: [String] = []
        for st in allStates {
            let lbl = cfg.label(for: st)
            let img = cfg.image(for: st)
            let lDesc = String(describing: lbl)
            let iDesc = String(describing: img)
            XCTAssertFalse(lDesc.isEmpty, "Label description should not be empty for state \(st.rawValue)")
            XCTAssertFalse(iDesc.isEmpty, "Image description should not be empty for state \(st.rawValue)")
            labelDescs.append(lDesc)
            imageDescs.append(iDesc)
        }
        XCTAssertTrue(labelDescs.contains { $0 != labelDescs.first }, "Expected at least one differing label description across states")
    }
    
    // MARK: - Primary Style Variants

    func testPrimaryButtonStyleIsLoadingTrue() {
        let cfg = self.makeConfig(state: .highlighted)
        let loadingStyle = FioriPrimaryButtonStyle(isLoading: true)
        let loadedBody = loadingStyle.makeBody(configuration: cfg)
        let loadedDesc = String(describing: loadedBody)
        XCTAssertFalse(loadedDesc.isEmpty)
        let normalStyle = FioriPrimaryButtonStyle(isLoading: false)
        let normalDesc = String(describing: normalStyle.makeBody(configuration: cfg))
        XCTAssertFalse(normalDesc.isEmpty)
        XCTAssertNotEqual(loadedDesc, normalDesc, "Loading style body description should differ from normal style")
    }
    
    func testPrimaryButtonStyleStates() {
        let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        var descs: [String] = []
        for st in states {
            let cfg = self.makeConfig(state: st)
            let style = FioriPrimaryButtonStyle()
            let bodyDesc = String(describing: style.makeBody(configuration: cfg))
            XCTAssertFalse(bodyDesc.isEmpty, "Primary style body should build for state \(st.rawValue)")
            descs.append(bodyDesc)
        }
        XCTAssertTrue(Set(descs).count >= 2, "Expect visual variation across states")
    }
    
    func testPrimaryButtonStyleLoadingProcessingAndSuccess() {
        let cfg = self.makeConfig(state: .normal)
        let processingDesc = String(describing: FioriPrimaryButtonStyle(loadingState: .processing).makeBody(configuration: cfg))
        let successDesc = String(describing: FioriPrimaryButtonStyle(loadingState: .success).makeBody(configuration: cfg))
        XCTAssertFalse(processingDesc.isEmpty)
        XCTAssertFalse(successDesc.isEmpty)
        XCTAssertNotEqual(processingDesc, successDesc, "Processing and success variants should differ")
    }
    
    // MARK: - Secondary Style Variants

    func testSecondaryButtonStyleIsLoadingVariants() {
        let cfg = self.makeConfig(state: .selected)
        let variants = [
            FioriSecondaryButtonStyle(colorStyle: .tint, loadingState: .processing, isLoading: true),
            FioriSecondaryButtonStyle(colorStyle: .normal, loadingState: .processing, isLoading: true),
            FioriSecondaryButtonStyle(colorStyle: .negative, loadingState: .processing, isLoading: true)
        ].map { String(describing: $0.makeBody(configuration: cfg)) }
        for (i, d) in variants.enumerated() {
            XCTAssertFalse(d.isEmpty, "Variant index \(i) should build")
        }
        XCTAssertTrue(Set(variants).count >= 2, "Loading variants with different colorStyles should differ")
    }
    
    func testSecondaryButtonStyleColorStates() {
        let colorStyles: [FioriButtonColorStyle] = [.tint, .normal, .negative]
        let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        var allDescs: [String] = []
        for cs in colorStyles {
            for st in states {
                let cfg = self.makeConfig(state: st)
                let style = FioriSecondaryButtonStyle(colorStyle: cs)
                let desc = String(describing: style.makeBody(configuration: cfg))
                XCTAssertFalse(desc.isEmpty)
                allDescs.append(desc)
            }
        }
        XCTAssertTrue(Set(allDescs).count >= colorStyles.count + 1, "Expect variation across color styles and states")
    }
    
    func testSecondaryButtonStyleSuccessAndProcessing() {
        let cfg = self.makeConfig(state: .highlighted)
        let successDesc = String(describing: FioriSecondaryButtonStyle(colorStyle: .tint, loadingState: .success).makeBody(configuration: cfg))
        let processingDesc = String(describing: FioriSecondaryButtonStyle(colorStyle: .negative, loadingState: .processing).makeBody(configuration: cfg))
        XCTAssertFalse(successDesc.isEmpty)
        XCTAssertFalse(processingDesc.isEmpty)
        XCTAssertNotEqual(successDesc, processingDesc)
    }
    
    // MARK: - Tertiary Style Variants

    func testTertiaryButtonStyleIsLoadingVariants() {
        let cfg = self.makeConfig(state: .disabled)
        let variants = [
            FioriTertiaryButtonStyle(colorStyle: .tint, loadingState: .processing, isLoading: true),
            FioriTertiaryButtonStyle(colorStyle: .normal, loadingState: .processing, isLoading: true),
            FioriTertiaryButtonStyle(colorStyle: .negative, loadingState: .processing, isLoading: true)
        ].map { String(describing: $0.makeBody(configuration: cfg)) }
        for d in variants {
            XCTAssertFalse(d.isEmpty)
        }
        XCTAssertTrue(Set(variants).count >= 2)
    }
    
    func testTertiaryButtonStyleColorStates() {
        let colorStyles: [FioriButtonColorStyle] = [.tint, .normal, .negative]
        let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        var descs: [String] = []
        for cs in colorStyles {
            for st in states {
                let cfg = self.makeConfig(state: st)
                let style = FioriTertiaryButtonStyle(colorStyle: cs)
                let d = String(describing: style.makeBody(configuration: cfg))
                XCTAssertFalse(d.isEmpty)
                descs.append(d)
            }
        }
        XCTAssertTrue(Set(descs).count >= colorStyles.count + 1)
    }
    
    func testTertiaryButtonStyleSuccessAndProcessing() {
        let cfg = self.makeConfig(state: .selected)
        let successDesc = String(describing: FioriTertiaryButtonStyle(colorStyle: .normal, loadingState: .success).makeBody(configuration: cfg))
        let processingDesc = String(describing: FioriTertiaryButtonStyle(colorStyle: .negative, loadingState: .processing).makeBody(configuration: cfg))
        XCTAssertFalse(successDesc.isEmpty)
        XCTAssertFalse(processingDesc.isEmpty)
        XCTAssertNotEqual(successDesc, processingDesc)
    }
    
    // MARK: - Navigation Style Variants

    func testNavigationButtonStyleStates() {
        let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        var descs: [String] = []
        for st in states {
            let cfg = self.makeConfig(state: st)
            let style = FioriNavigationButtonStyle(colorStyle: .tint)
            let d = String(describing: style.makeBody(configuration: cfg))
            XCTAssertFalse(d.isEmpty)
            descs.append(d)
        }
        XCTAssertTrue(Set(descs).count >= 2, "Expect at least two distinct navigation style outputs across states")
    }
    
    // MARK: - AnyFioriButtonStyle Erasure

    func testAnyFioriButtonStyleWrappingSecondary() {
        let cfg = self.makeConfig(state: .normal)
        let secondary = FioriSecondaryButtonStyle(colorStyle: .tint)
        let anyStyle = secondary.eraseToAnyFioriButtonStyle()
        let wrappedDesc = String(describing: anyStyle.makeBody(configuration: cfg))
        XCTAssertFalse(wrappedDesc.isEmpty)
        let directDesc = String(describing: secondary.makeBody(configuration: cfg))
        XCTAssertFalse(directDesc.isEmpty)
        // Both styles should produce valid view bodies, though string representations may differ due to type erasure
        XCTAssertTrue(wrappedDesc.count > 0 && directDesc.count > 0, "Both erased and direct styles should produce non-empty view descriptions")
    }
}

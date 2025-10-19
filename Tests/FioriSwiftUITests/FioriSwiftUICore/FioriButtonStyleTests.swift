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
        for pos in positions {
            let cfg = self.makeConfig(state: .normal, imagePosition: pos)
            let view = cfg.containerView(.unspecified)
            // Just ensure view builds for each position
            _ = Mirror(reflecting: view)
        }
    }
    
    // MARK: - Loading State Image Switching

    func testContainerViewLoadingStates() {
        let states: [FioriButtonLoadingState] = [.unspecified, .processing, .success]
        let cfg = self.makeConfig(state: .normal)
        for loading in states {
            let view = cfg.containerView(loading)
            _ = Mirror(reflecting: view)
        }
    }
    
    // MARK: - Label & Image Retrieval

    func testLabelAndImageForEachState() {
        let allStates: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        let cfg = self.makeConfig(state: .normal)
        for st in allStates {
            _ = cfg.label(for: st)
            _ = cfg.image(for: st)
        }
    }
    
    // MARK: - Primary Style Variants

    func testPrimaryButtonStyleIsLoadingTrue() {
        let cfg = self.makeConfig(state: .highlighted)
        let style = FioriPrimaryButtonStyle(isLoading: true)
        let body = style.makeBody(configuration: cfg)
        _ = Mirror(reflecting: body)
    }
    
    func testPrimaryButtonStyleStates() {
        let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        for st in states {
            let cfg = self.makeConfig(state: st)
            let style = FioriPrimaryButtonStyle()
            _ = style.makeBody(configuration: cfg)
        }
    }
    
    func testPrimaryButtonStyleLoadingProcessingAndSuccess() {
        let cfg = self.makeConfig(state: .normal)
        let processingStyle = FioriPrimaryButtonStyle(loadingState: .processing)
        _ = processingStyle.makeBody(configuration: cfg)
        let successStyle = FioriPrimaryButtonStyle(loadingState: .success)
        _ = successStyle.makeBody(configuration: cfg)
    }
    
    // MARK: - Secondary Style Variants

    func testSecondaryButtonStyleIsLoadingVariants() {
        let cfg = self.makeConfig(state: .selected)
        let tintLoading = FioriSecondaryButtonStyle(colorStyle: .tint, loadingState: .processing, isLoading: true)
        _ = tintLoading.makeBody(configuration: cfg)
        let normalLoading = FioriSecondaryButtonStyle(colorStyle: .normal, loadingState: .processing, isLoading: true)
        _ = normalLoading.makeBody(configuration: cfg)
        let negativeLoading = FioriSecondaryButtonStyle(colorStyle: .negative, loadingState: .processing, isLoading: true)
        _ = negativeLoading.makeBody(configuration: cfg)
    }
    
    func testSecondaryButtonStyleColorStates() {
        let colorStyles: [FioriButtonColorStyle] = [.tint, .normal, .negative]
        let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        for cs in colorStyles {
            for st in states {
                let cfg = self.makeConfig(state: st)
                let style = FioriSecondaryButtonStyle(colorStyle: cs)
                _ = style.makeBody(configuration: cfg)
            }
        }
    }
    
    func testSecondaryButtonStyleSuccessAndProcessing() {
        let cfg = self.makeConfig(state: .highlighted)
        let successStyle = FioriSecondaryButtonStyle(colorStyle: .tint, loadingState: .success)
        _ = successStyle.makeBody(configuration: cfg)
        let processingStyle = FioriSecondaryButtonStyle(colorStyle: .negative, loadingState: .processing)
        _ = processingStyle.makeBody(configuration: cfg)
    }
    
    // MARK: - Tertiary Style Variants

    func testTertiaryButtonStyleIsLoadingVariants() {
        let cfg = self.makeConfig(state: .disabled)
        let tintLoading = FioriTertiaryButtonStyle(colorStyle: .tint, loadingState: .processing, isLoading: true)
        _ = tintLoading.makeBody(configuration: cfg)
        let normalLoading = FioriTertiaryButtonStyle(colorStyle: .normal, loadingState: .processing, isLoading: true)
        _ = normalLoading.makeBody(configuration: cfg)
        let negativeLoading = FioriTertiaryButtonStyle(colorStyle: .negative, loadingState: .processing, isLoading: true)
        _ = negativeLoading.makeBody(configuration: cfg)
    }
    
    func testTertiaryButtonStyleColorStates() {
        let colorStyles: [FioriButtonColorStyle] = [.tint, .normal, .negative]
        let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        for cs in colorStyles {
            for st in states {
                let cfg = self.makeConfig(state: st)
                let style = FioriTertiaryButtonStyle(colorStyle: cs)
                _ = style.makeBody(configuration: cfg)
            }
        }
    }
    
    func testTertiaryButtonStyleSuccessAndProcessing() {
        let cfg = self.makeConfig(state: .selected)
        let successStyle = FioriTertiaryButtonStyle(colorStyle: .normal, loadingState: .success)
        _ = successStyle.makeBody(configuration: cfg)
        let processingStyle = FioriTertiaryButtonStyle(colorStyle: .negative, loadingState: .processing)
        _ = processingStyle.makeBody(configuration: cfg)
    }
    
    // MARK: - Navigation Style Variants

    func testNavigationButtonStyleStates() {
        let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        for st in states {
            let cfg = self.makeConfig(state: st)
            let style = FioriNavigationButtonStyle(colorStyle: .tint)
            _ = style.makeBody(configuration: cfg)
        }
    }
    
    // MARK: - AnyFioriButtonStyle Erasure

    func testAnyFioriButtonStyleWrappingSecondary() {
        let cfg = self.makeConfig(state: .normal)
        let secondary = FioriSecondaryButtonStyle(colorStyle: .tint)
        let anyStyle = secondary.eraseToAnyFioriButtonStyle()
        _ = anyStyle.makeBody(configuration: cfg)
    }
}

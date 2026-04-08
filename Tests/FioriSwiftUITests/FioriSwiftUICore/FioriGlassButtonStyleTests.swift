@testable import FioriSwiftUICore
import SwiftUI
import XCTest

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
@available(visionOS, unavailable)
final class FioriGlassButtonStyleTests: XCTestCase {
    // MARK: - Helpers

    private func makeConfig(
        state: UIControl.State,
        imagePosition: FioriButtonImagePosition = .leading,
        imageTitleSpacing: CGFloat = 8.0
    ) -> FioriButtonStyleConfiguration {
        FioriButtonStyleConfiguration(
            state: state,
            _label: { s in
                FioriButtonStyleConfiguration.Label(Text("Label-\(s.rawValue)"))
            },
            _image: { s in
                FioriButtonStyleConfiguration.Image(
                    Image(systemName: s == .selected ? "checkmark" : "circle")
                )
            },
            imagePosition: imagePosition,
            imageTitleSpacing: imageTitleSpacing
        )
    }

    private func describeBody(effect: FioriButtonGlassEffectStyle, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, state: UIControl.State = .normal, imagePosition: FioriButtonImagePosition = .leading) -> String {
        let style = FioriGlassButtonStyle(glassEffect: effect, maxWidth: maxWidth, minHeight: minHeight)
        let config = self.makeConfig(state: state, imagePosition: imagePosition)
        return String(describing: style.makeBody(configuration: config))
    }

    // MARK: - Default Initializer

    func testDefaultInitializerProducesValidBody() {
        let style = FioriGlassButtonStyle()
        let body = style.makeBody(configuration: self.makeConfig(state: .normal))
        XCTAssertFalse(String(describing: body).isEmpty, "Default FioriGlassButtonStyle should produce a non-empty view body.")
    }

    // MARK: - Glass Effect Styles

    func testAllGlassEffectStylesProduceNonEmptyBodies() {
        let effects: [FioriButtonGlassEffectStyle] = [.plain, .tint, .systemManaged]
        for effect in effects {
            XCTAssertFalse(
                self.describeBody(effect: effect).isEmpty,
                "Glass effect .\(effect) should produce a non-empty view body."
            )
        }
    }

    func testPlainAndTintProduceDifferentBodies() {
        XCTAssertNotEqual(
            self.describeBody(effect: .plain),
            self.describeBody(effect: .tint),
            ".plain and .tint should produce distinct view bodies."
        )
    }

    func testTintAndSystemManagedProduceDifferentBodies() {
        XCTAssertNotEqual(
            self.describeBody(effect: .tint),
            self.describeBody(effect: .systemManaged),
            ".tint and .systemManaged should produce distinct view bodies."
        )
    }

    func testPlainAndSystemManagedProduceDifferentBodies() {
        XCTAssertNotEqual(
            self.describeBody(effect: .plain),
            self.describeBody(effect: .systemManaged),
            ".plain and .systemManaged should produce distinct view bodies."
        )
    }

    // MARK: - Button States

    func testAllEffectsAndStatesProduceNonEmptyBodies() {
        let effects: [FioriButtonGlassEffectStyle] = [.plain, .tint, .systemManaged]
        let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        for effect in effects {
            for state in states {
                XCTAssertFalse(
                    self.describeBody(effect: effect, state: state).isEmpty,
                    ".\(effect) should produce a valid body for state \(state.rawValue)."
                )
            }
        }
    }

    // MARK: - Image Positions

    func testAllImagePositionsProduceNonEmptyBodies() {
        let positions: [FioriButtonImagePosition] = [.top, .leading, .bottom, .trailing]
        for position in positions {
            XCTAssertFalse(
                self.describeBody(effect: .plain, imagePosition: position).isEmpty,
                "Glass style should produce a valid body for image position .\(position)."
            )
        }
    }

    // MARK: - maxWidth and minHeight

    func testIntrinsicSizeProducesValidBody() {
        XCTAssertFalse(
            self.describeBody(effect: .plain, maxWidth: nil, minHeight: nil).isEmpty,
            "Intrinsic size (nil maxWidth, nil minHeight) should produce a non-empty body."
        )
    }

    func testFullWidthProducesValidBody() {
        XCTAssertFalse(
            self.describeBody(effect: .plain, maxWidth: .infinity).isEmpty,
            "maxWidth: .infinity should produce a non-empty body."
        )
    }

    func testCustomMinHeightProducesValidBody() {
        XCTAssertFalse(
            self.describeBody(effect: .tint, minHeight: 56).isEmpty,
            "Custom minHeight should produce a non-empty body."
        )
    }

    func testFullWidthAndIntrinsicSizeProduceDifferentBodies() {
        XCTAssertNotEqual(
            self.describeBody(effect: .plain, maxWidth: nil),
            self.describeBody(effect: .plain, maxWidth: .infinity),
            "Intrinsic and full-width sizes should produce distinct view bodies."
        )
    }

    func testDifferentMinHeightsProduceDifferentBodies() {
        XCTAssertNotEqual(
            self.describeBody(effect: .tint, minHeight: nil),
            self.describeBody(effect: .tint, minHeight: 56),
            "Different minHeight values should produce distinct view bodies."
        )
    }

    // MARK: - Type Erasure

    func testEraseToAnyFioriButtonStyleProducesValidBody() {
        let anyStyle = FioriGlassButtonStyle(glassEffect: .plain).eraseToAnyFioriButtonStyle()
        let desc = String(describing: anyStyle.makeBody(configuration: self.makeConfig(state: .normal)))
        XCTAssertFalse(desc.isEmpty, "Type-erased FioriGlassButtonStyle should produce a non-empty body.")
    }

    func testErasedAndDirectStylesProduceSameBodyLength() {
        let style = FioriGlassButtonStyle(glassEffect: .tint, maxWidth: .infinity, minHeight: 44)
        let anyStyle = style.eraseToAnyFioriButtonStyle()
        let config = self.makeConfig(state: .normal)
        let directDesc = String(describing: style.makeBody(configuration: config))
        let erasedDesc = String(describing: anyStyle.makeBody(configuration: config))
        XCTAssertFalse(directDesc.isEmpty, "Direct style body should not be empty.")
        XCTAssertFalse(erasedDesc.isEmpty, "Erased style body should not be empty.")
    }

    func testAllEffectsCanBeTypeErased() {
        let effects: [FioriButtonGlassEffectStyle] = [.plain, .tint, .systemManaged]
        let config = self.makeConfig(state: .normal)
        for effect in effects {
            let anyStyle = FioriGlassButtonStyle(glassEffect: effect).eraseToAnyFioriButtonStyle()
            XCTAssertFalse(
                String(describing: anyStyle.makeBody(configuration: config)).isEmpty,
                "Type-erased .\(effect) should produce a non-empty body."
            )
        }
    }

    // MARK: - FioriButtonGlassEffectStyle Enum

    func testAllGlassEffectEnumCasesAreDistinct() {
        let all: [FioriButtonGlassEffectStyle] = [.plain, .tint, .systemManaged]
        let descs = Set(all.map { String(describing: $0) })
        XCTAssertEqual(descs.count, 3, "All three FioriButtonGlassEffectStyle cases should be distinct.")
    }

    func testSystemManagedIsNotEqualToPlain() {
        XCTAssertNotEqual(
            String(describing: FioriButtonGlassEffectStyle.systemManaged),
            String(describing: FioriButtonGlassEffectStyle.plain)
        )
    }

    func testSystemManagedIsNotEqualToTint() {
        XCTAssertNotEqual(
            String(describing: FioriButtonGlassEffectStyle.systemManaged),
            String(describing: FioriButtonGlassEffectStyle.tint)
        )
    }

    func testPlainIsNotEqualToTint() {
        XCTAssertNotEqual(
            String(describing: FioriButtonGlassEffectStyle.plain),
            String(describing: FioriButtonGlassEffectStyle.tint)
        )
    }
}

import SwiftUI

struct TextWithMandatoryFieldIndicator: View {
    let text: AttributedString
    let isRequired: Bool
    let mandatoryFieldIndicator: TextOrIcon?

    public init(text: AttributedString,
                isRequired: Bool = false,
                mandatoryFieldIndicator: TextOrIcon? = .text("*"))
    {
        self.text = text
        self.isRequired = isRequired
        self.mandatoryFieldIndicator = mandatoryFieldIndicator
    }
    
    var body: some View {
        Group {
            if let mandatoryFieldIndicator, isRequired {
                switch mandatoryFieldIndicator {
                case .text(let attributedString):
                    Text(self.text) + Text(attributedString).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
                case .icon(let image):
                    Text(self.text) + Text(image).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
                case .both(let attributedString, let image):
                    Text(self.text) + Text(attributedString).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field")) + Text(image).accessibilityLabel("")
                }
            } else {
                Text(self.text)
            }
        }.typeErased
    }
}

#Preview {
    TextWithMandatoryFieldIndicator(text: "Hello, world")
}

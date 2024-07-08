import FioriSwiftUICore
import SwiftUI

struct RatingControlFormViewExample: View {
    @State var rating1: Int = 1

    @State var rating2: Int = 2

    @State var rating3: Int = 3

    @State var rating4: Int = 4

    @State var rating5: Int = 1

    @State var rating6: Int = 2

    @State var rating7: Int = 3

    @State var rating8: Int = 4

    @State var rating9: Int = 1

    @State var rating10: Int = 2

    @State var rating11: Int = 3

    @State var rating12: Int = 4

    @State var showsErrorMessage = false
    @State var usesCustomColors = false
    @State var usesCustomImages = false

    var errorMessage = AttributedString("Error Message")

    var body: some View {
        List {
            Text("RatingControlFormView Example")
            Toggle("Shows Error Message", isOn: self.$showsErrorMessage)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            Toggle("Custom Colors", isOn: self.$usesCustomColors)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            Toggle("Custom Images", isOn: self.$usesCustomImages)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            Text("Default Examples")
            RatingControlFormView(title: "Rating 1", rating: self.$rating1, onImage: self.getOnImage(), offImage: self.getOffImage(), onColor: self.getOnColor(.normal), offColor: self.getOffColor(), errorMessage: self.getErrorMessage())
            RatingControlFormView(title: "Rating 2 (Disabled)", rating: self.$rating2, onImage: self.getOnImage(), offImage: self.getOffImage(), onColor: self.getOnColor(.disabled), offColor: self.getOffColor(), controlState: .disabled, errorMessage: self.getErrorMessage())
            RatingControlFormView(title: "Rating 3 (Read Only) Rating 3 (Read Only)", rating: self.$rating3, onImage: self.getOnImage(), offImage: self.getOffImage(), onColor: self.getOnColor(.readOnly), offColor: self.getOffColor(), controlState: .readOnly, errorMessage: self.getErrorMessage())
            RatingControlFormView(title: "Rating 4 (Highlighted)", rating: self.$rating4, onImage: self.getOnImage(), offImage: self.getOffImage(), onColor: self.getOnColor(.highlighted), offColor: self.getOffColor(), controlState: .highlighted, errorMessage: self.getErrorMessage())

            Text("Stacked")
            RatingControlFormView(title: "Rating 5", rating: self.$rating5, onImage: self.getOnImage(), offImage: self.getOffImage(), onColor: self.getOnColor(.normal), offColor: self.getOffColor(), errorMessage: self.getErrorMessage(), isStacked: true)
            RatingControlFormView(title: "Rating 6 (Disabled)", rating: self.$rating6, onImage: self.getOnImage(), offImage: self.getOffImage(), onColor: self.getOnColor(.disabled), offColor: self.getOffColor(), controlState: .disabled, errorMessage: self.getErrorMessage(), isStacked: true)
            RatingControlFormView(title: "Rating 7 (Read Only)", rating: self.$rating7, onImage: self.getOnImage(), offImage: self.getOffImage(), onColor: self.getOnColor(.readOnly), offColor: self.getOffColor(), controlState: .readOnly, errorMessage: self.getErrorMessage(), isStacked: true)
            RatingControlFormView(title: "Rating 8 (Highlighted)", rating: self.$rating8, onImage: self.getOnImage(), offImage: self.getOffImage(), onColor: self.getOnColor(.highlighted), offColor: self.getOffColor(), controlState: .highlighted, errorMessage: self.getErrorMessage(), isStacked: true)

            Text("With Subtitle")
            RatingControlFormView(title: "Rating 9", rating: self.$rating9, onImage: self.getOnImage(), offImage: self.getOffImage(), onColor: self.getOnColor(.normal), offColor: self.getOffColor(), subtitle: "Rating 9 Subtitle", errorMessage: self.getErrorMessage())
            RatingControlFormView(title: "Rating 10 (Disabled)", rating: self.$rating10, onImage: self.getOnImage(), offImage: self.getOffImage(), onColor: self.getOnColor(.disabled), offColor: self.getOffColor(), subtitle: "Rating 10 Subtitle", controlState: .disabled, errorMessage: self.getErrorMessage())
            RatingControlFormView(title: "Rating 11 (Read Only)", rating: self.$rating11, onImage: self.getOnImage(), offImage: self.getOffImage(), onColor: self.getOnColor(.readOnly), offColor: self.getOffColor(), subtitle: "Rating 11 Subtitle", controlState: .readOnly, errorMessage: self.getErrorMessage())
            RatingControlFormView(title: "Rating 12 (Highlighted)", rating: self.$rating12, onImage: self.getOnImage(), offImage: self.getOffImage(), onColor: self.getOnColor(.highlighted), offColor: self.getOffColor(), subtitle: "Rating 12 Subtitle", controlState: .highlighted, errorMessage: self.getErrorMessage())
        }
    }

    func getErrorMessage() -> AttributedString? {
        self.showsErrorMessage ? self.errorMessage : nil
    }

    func getOnColor(_ controlState: ControlState) -> Color? {
        guard self.usesCustomColors else {
            return nil
        }
        switch controlState {
        case .disabled:
            return .orange
        case .readOnly:
            return .brown
        case .highlighted:
            return .black
        default:
            return .red
        }
    }

    func getOffColor() -> Color? {
        self.usesCustomColors ? .yellow : nil
    }

    func getOnImage() -> Image? {
        self.usesCustomImages ? Image(systemName: "hand.thumbsup.fill") : nil
    }

    func getOffImage() -> Image? {
        self.usesCustomImages ? Image(systemName: "hand.thumbsdown.fill") : nil
    }
}

#Preview {
    RatingControlExample()
}

import FioriSwiftUICore
import SwiftUI

struct RatingControlFormViewExample: View {
    @State var rating1: Int = 1
    @State var rating2: Int = 2
    @State var rating3: Int = 3
    @State var rating4: Int = 4
    @State var rating5: Int = 5
    @State var rating6: Int = 1
    @State var rating7: Int = 2
    @State var rating8: Int = 3
    @State var rating9: Int = 4
    @State var rating10: Int = 5
    @State var rating11: Int = 1
    @State var rating12: Int = 2
    @State var rating13: Int = 3
    @State var rating14: Int = 4
    @State var rating15: Int = 5
    @State var rating16: Int = 1
    @State var rating17: Int = 2
    @State var rating18: Int = 3

    @State var showsHintMessage = false
    @State var usesCustomColors = false
    @State var usesCustomImages = false

    var errorMessage = AttributedString("Error Message")

    @State var showsValueLabel = false
    @State var showsReviewCountLabel = false
    @State var setsAverageRating = false
    @State var setsReviewCount = false
    @State var setsReviewCountCeiling = false

    var body: some View {
        List {
            Text("RatingControlFormView Examples")
            Toggle("Shows Hint Message", isOn: self.$showsHintMessage)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            Toggle("Custom Colors", isOn: self.$usesCustomColors)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            Toggle("Custom Images", isOn: self.$usesCustomImages)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            Toggle("Shows Value Label", isOn: self.$showsValueLabel)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            Toggle("Shows Review Count Label", isOn: self.$showsReviewCountLabel)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            Toggle("Sets Average Rating", isOn: self.$setsAverageRating)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            Toggle("Sets Review Count", isOn: self.$setsReviewCount)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            Toggle("Sets Review Count Ceiling", isOn: self.$setsReviewCountCeiling)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            Text("Default Examples")
            RatingControlFormView(title: "Rating 1", rating: self.$rating1, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.normal), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 2 (Disabled)", rating: self.$rating2, ratingControlStyle: .editableDisabled, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.disabled), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 3 (Read Only) Rating 3 (Read Only)", rating: self.$rating3, ratingControlStyle: .standard, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.readOnly), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 4 (Read Only Large) Rating 4 (Read Only Large)", rating: self.$rating4, ratingControlStyle: .standardLarge, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.readOnly), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 5 (Accented)", rating: self.$rating5, ratingControlStyle: .accented, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.highlighted), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 6 (Accented Large)", rating: self.$rating6, ratingControlStyle: .accentedLarge, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.highlighted), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))

            Text("Stacked")
            RatingControlFormView(title: "Rating 7", rating: self.$rating7, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.normal), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, axis: .vertical)
            RatingControlFormView(title: "Rating 8 (Disabled)", rating: self.$rating8, ratingControlStyle: .editableDisabled, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.disabled), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, axis: .vertical)
            RatingControlFormView(title: "Rating 9 (Read Only)", rating: self.$rating9, ratingControlStyle: .standard, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.readOnly), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, axis: .vertical)
            RatingControlFormView(title: "Rating 10 (Read Only Large)", rating: self.$rating10, ratingControlStyle: .standardLarge, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.readOnly), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, axis: .vertical)
            RatingControlFormView(title: "Rating 11 (Accented)", rating: self.$rating11, ratingControlStyle: .accented, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.highlighted), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, axis: .vertical)
            RatingControlFormView(title: "Rating 12 (Accented Large)", rating: self.$rating12, ratingControlStyle: .accentedLarge, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.highlighted), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, axis: .vertical)

            Text("With Subtitle")
            RatingControlFormView(title: "Rating 13", rating: self.$rating13, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.normal), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, subtitle: "Rating 13 Subtitle")
            RatingControlFormView(title: "Rating 14 (Disabled)", rating: self.$rating14, ratingControlStyle: .editableDisabled, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.disabled), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, subtitle: "Rating 14 Subtitle")
            RatingControlFormView(title: "Rating 15 (Read Only)", rating: self.$rating15, ratingControlStyle: .standard, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.readOnly), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, subtitle: "Rating 15 Subtitle")
            RatingControlFormView(title: "Rating 16 (Read Only Large)", rating: self.$rating16, ratingControlStyle: .standardLarge, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.readOnly), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, subtitle: "Rating 16 Subtitle")
            RatingControlFormView(title: "Rating 17 (Accented)", rating: self.$rating17, ratingControlStyle: .accented, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.highlighted), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, subtitle: "Rating 17 Subtitle")
            RatingControlFormView(title: "Rating 18 (Accented Large)", rating: self.$rating18, ratingControlStyle: .accentedLarge, onImage: self.getOnImage(), offImage: self.getOffImage(), halfImage: self.getHalfImage(), onColor: self.getOnColor(.highlighted), offColor: self.getOffColor(), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, subtitle: "Rating 18 Subtitle")
        }
    }

    func getAverageRatingValue() -> CGFloat? {
        guard self.setsAverageRating else {
            return nil
        }
        return 2.6
    }

    func getReviewCount() -> Int? {
        guard self.setsReviewCount else {
            return nil
        }
        return 1234
    }

    func getReviewCountCeiling() -> Int? {
        guard self.setsReviewCountCeiling else {
            return nil
        }
        return 1000
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

    func getHalfImage() -> Image? {
        self.usesCustomImages ? Image(systemName: "hand.thumbsup.circle") : nil
    }
}

#Preview {
    RatingControlExample()
}

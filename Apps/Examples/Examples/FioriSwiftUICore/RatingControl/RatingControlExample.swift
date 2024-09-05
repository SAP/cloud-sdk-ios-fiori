import FioriSwiftUICore
import SwiftUI

struct RatingControlExample: View {
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

    @State var rating13: Int = 1

    @State var rating14: Int = 2

    @State var rating15: Int = 3

    @State var rating16: Int = 4

    @State var rating17: Int = 1

    @State var rating18: Int = 2

    @State var rating19: Int = 3

    @State var rating20: Int = 4

    @State var rating21: Int = 1

    @State var rating22: Int = 2

    @State var rating23: Int = 3

    @State var rating24: Int = 4

    @State var showsValueLabel = false
    @State var showsReviewCountLabel = false
    @State var setsAverageRating = false
    @State var setsReviewCount = false
    @State var setsReviewCountCeiling = false

    var body: some View {
        List {
            Text("RatingControl Examples")
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

            Text("RatingControl Default Example")
            RatingControl(rating: self.$rating1, ratingControlStyle: .editable, showsValueLabel: self.showsValueLabel)
            RatingControl(rating: self.$rating2, ratingControlStyle: .editableDisabled, showsValueLabel: self.showsValueLabel)
            RatingControl(rating: self.$rating3, ratingControlStyle: .standard, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating4, ratingControlStyle: .standardLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating5, ratingControlStyle: .accented, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating6, ratingControlStyle: .accentedLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)

            Text("Custom Color and Font Example")
            RatingControl(rating: self.$rating7, ratingControlStyle: .editable, onColor: .red, offColor: .yellow, showsValueLabel: self.showsValueLabel)
            RatingControl(rating: self.$rating8, ratingControlStyle: .editableDisabled, onColor: .orange, offColor: .yellow, showsValueLabel: self.showsValueLabel)
            RatingControl(rating: self.$rating9, ratingControlStyle: .standard, onColor: .brown, offColor: .yellow, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating10, ratingControlStyle: .standardLarge, onColor: .brown, offColor: .yellow, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating11, ratingControlStyle: .accented, onColor: .black, offColor: .yellow, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating12, ratingControlStyle: .accentedLarge, onColor: .black, offColor: .yellow, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)

            Text("Larger Size Example")
            RatingControl(rating: self.$rating13, ratingControlStyle: .editable, itemSize: CGSize(width: 40, height: 40), showsValueLabel: self.showsValueLabel)
            RatingControl(rating: self.$rating14, ratingControlStyle: .editableDisabled, itemSize: CGSize(width: 30, height: 30), showsValueLabel: self.showsValueLabel)
            RatingControl(rating: self.$rating15, ratingControlStyle: .standard, itemSize: CGSize(width: 10, height: 10), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating16, ratingControlStyle: .standardLarge, itemSize: CGSize(width: 20, height: 20), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating17, ratingControlStyle: .accented, itemSize: CGSize(width: 5, height: 5), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating18, ratingControlStyle: .accentedLarge, itemSize: CGSize(width: 10, height: 10), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)

            Text("Custom Image Example")
            RatingControl(rating: self.$rating19, ratingControlStyle: .editable, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"), halfImage: Image(systemName: "hand.thumbsup.circle"), showsValueLabel: self.showsValueLabel)
            RatingControl(rating: self.$rating20, ratingControlStyle: .editableDisabled, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"), halfImage: Image(systemName: "hand.thumbsup.circle"), showsValueLabel: self.showsValueLabel)
            RatingControl(rating: self.$rating21, ratingControlStyle: .standard, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"), halfImage: Image(systemName: "hand.thumbsup.circle"), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating22, ratingControlStyle: .standardLarge, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"), halfImage: Image(systemName: "hand.thumbsup.circle"), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating23, ratingControlStyle: .accented, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"), halfImage: Image(systemName: "hand.thumbsup.circle"), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating24, ratingControlStyle: .accentedLarge, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"), halfImage: Image(systemName: "hand.thumbsup.circle"), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
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
}

#Preview {
    RatingControlExample()
}

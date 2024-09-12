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

            Text("RatingControl Default Examples")
            RatingControl(rating: self.$rating1, ratingControlStyle: .editable, showsValueLabel: self.showsValueLabel)
            RatingControl(rating: self.$rating2, ratingControlStyle: .editableDisabled, showsValueLabel: self.showsValueLabel)
            RatingControl(rating: self.$rating3, ratingControlStyle: .standard, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating4, ratingControlStyle: .standardLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating5, ratingControlStyle: .accented, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating6, ratingControlStyle: .accentedLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)

            Text("Custom Color and Font Examples")
            RatingControl(rating: self.$rating7, ratingControlStyle: .editable, showsValueLabel: self.showsValueLabel)
                .onStarImageStyle { style in
                    OnStarImage(style)
                        .foregroundStyle(.red)
                }
                .offStarImageStyle { style in
                    OffStarImage(style)
                        .foregroundStyle(.yellow)
                }
                .valueLabelStyle { style in
                    ValueLabel(style)
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundStyle(.brown)
                }
                .reviewCountLabelStyle { style in
                    ReviewCountLabel(style)
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundStyle(.brown)
                }
            RatingControl(rating: self.$rating8, ratingControlStyle: .editableDisabled, showsValueLabel: self.showsValueLabel)
                .onStarImageStyle { style in
                    OnStarImage(style)
                        .foregroundStyle(.red)
                }
                .offStarImageStyle { style in
                    OffStarImage(style)
                        .foregroundStyle(.yellow)
                }
                .valueLabelStyle { style in
                    ValueLabel(style)
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundStyle(.brown)
                }
                .reviewCountLabelStyle { style in
                    ReviewCountLabel(style)
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundStyle(.brown)
                }
            RatingControl(rating: self.$rating9, ratingControlStyle: .standard, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .onStarImageStyle { style in
                    OnStarImage(style)
                        .foregroundStyle(.red)
                }
                .offStarImageStyle { style in
                    OffStarImage(style)
                        .foregroundStyle(.yellow)
                }
                .halfStarImageStyle { style in
                    HalfStarImage(style)
                        .foregroundStyle(.green)
                }
                .valueLabelStyle { style in
                    ValueLabel(style)
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundStyle(.brown)
                }
                .reviewCountLabelStyle { style in
                    ReviewCountLabel(style)
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundStyle(.brown)
                }
            RatingControl(rating: self.$rating10, ratingControlStyle: .standardLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .onStarImageStyle { style in
                    OnStarImage(style)
                        .foregroundStyle(.red)
                }
                .offStarImageStyle { style in
                    OffStarImage(style)
                        .foregroundStyle(.yellow)
                }
                .halfStarImageStyle { style in
                    HalfStarImage(style)
                        .foregroundStyle(.green)
                }
                .valueLabelStyle { style in
                    ValueLabel(style)
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundStyle(.brown)
                }
                .reviewCountLabelStyle { style in
                    ReviewCountLabel(style)
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundStyle(.brown)
                }
            RatingControl(rating: self.$rating11, ratingControlStyle: .accented, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .onStarImageStyle { style in
                    OnStarImage(style)
                        .foregroundStyle(.red)
                }
                .offStarImageStyle { style in
                    OffStarImage(style)
                        .foregroundStyle(.yellow)
                }
                .halfStarImageStyle { style in
                    HalfStarImage(style)
                        .foregroundStyle(.green)
                }
                .valueLabelStyle { style in
                    ValueLabel(style)
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundStyle(.brown)
                }
                .reviewCountLabelStyle { style in
                    ReviewCountLabel(style)
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundStyle(.brown)
                }
            RatingControl(rating: self.$rating12, ratingControlStyle: .accentedLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .onStarImageStyle {
                    OnStarImage($0)
                        .foregroundStyle(.red)
                }
                .offStarImageStyle { config in
                    OffStarImage(config)
                        .foregroundStyle(.yellow)
                }
                .halfStarImageStyle { config in
                    HalfStarImage(config)
                        .foregroundStyle(.green)
                }
                .valueLabelStyle { config in
                    ValueLabel(config)
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundStyle(.brown)
                }
                .reviewCountLabelStyle { config in
                    ReviewCountLabel(config)
                        .font(.fiori(forTextStyle: .headline))
                        .foregroundStyle(.brown)
                }

            Text("Custom Size Examples")
            RatingControl(rating: self.$rating13, ratingControlStyle: .editable, itemSize: CGSize(width: 40, height: 40), showsValueLabel: self.showsValueLabel)
            RatingControl(rating: self.$rating14, ratingControlStyle: .editableDisabled, itemSize: CGSize(width: 30, height: 30), showsValueLabel: self.showsValueLabel)
            RatingControl(rating: self.$rating15, ratingControlStyle: .standard, itemSize: CGSize(width: 10, height: 10), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating16, ratingControlStyle: .standardLarge, itemSize: CGSize(width: 20, height: 20), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating17, ratingControlStyle: .accented, itemSize: CGSize(width: 5, height: 5), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(rating: self.$rating18, ratingControlStyle: .accentedLarge, itemSize: CGSize(width: 10, height: 10), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)

            Text("Custom Image Examples")
            RatingControl(onStarImage: Image(systemName: "hand.thumbsup.fill").renderingMode(.template).resizable(), offStarImage: Image(systemName: "hand.thumbsdown.fill").renderingMode(.template).resizable(), halfStarImage: Image(systemName: "hand.thumbsup.circle").renderingMode(.template).resizable(), rating: self.$rating19, ratingControlStyle: .editable, showsValueLabel: self.showsValueLabel)
            RatingControl(onStarImage: Image(systemName: "hand.thumbsup.fill").renderingMode(.template).resizable(), offStarImage: Image(systemName: "hand.thumbsdown.fill").renderingMode(.template).resizable(), halfStarImage: Image(systemName: "hand.thumbsup.circle").renderingMode(.template).resizable(), rating: self.$rating20, ratingControlStyle: .editableDisabled, showsValueLabel: self.showsValueLabel)
            RatingControl(onStarImage: Image(systemName: "hand.thumbsup.fill").renderingMode(.template).resizable(), offStarImage: Image(systemName: "hand.thumbsdown.fill").renderingMode(.template).resizable(), halfStarImage: Image(systemName: "hand.thumbsup.circle").renderingMode(.template).resizable(), rating: self.$rating21, ratingControlStyle: .standard, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(onStarImage: Image(systemName: "hand.thumbsup.fill").renderingMode(.template).resizable(), offStarImage: Image(systemName: "hand.thumbsdown.fill").renderingMode(.template).resizable(), halfStarImage: Image(systemName: "hand.thumbsup.circle").renderingMode(.template).resizable(), rating: self.$rating22, ratingControlStyle: .standardLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(onStarImage: Image(systemName: "hand.thumbsup.fill").renderingMode(.template).resizable(), offStarImage: Image(systemName: "hand.thumbsdown.fill").renderingMode(.template).resizable(), halfStarImage: Image(systemName: "hand.thumbsup.circle").renderingMode(.template).resizable(), rating: self.$rating23, ratingControlStyle: .accented, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
            RatingControl(onStarImage: Image(systemName: "hand.thumbsup.fill").renderingMode(.template).resizable(), offStarImage: Image(systemName: "hand.thumbsdown.fill").renderingMode(.template).resizable(), halfStarImage: Image(systemName: "hand.thumbsup.circle").renderingMode(.template).resizable(), rating: self.$rating24, ratingControlStyle: .accentedLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
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

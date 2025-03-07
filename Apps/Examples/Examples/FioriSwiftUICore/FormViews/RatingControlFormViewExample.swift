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
    @State var rating19: Int = 3
    @State var rating20: Int = 3
    @State var rating21: Int = 3
    @State var rating22: Int = 3
    @State var rating23: Int = 3
    @State var rating24: Int = 3

    @State var showsHintMessage = false

    var errorMessage = AttributedString("Error Message")

    @State var showsValueLabel = false
    @State var showsReviewCountLabel = false
    @State var setsAverageRating = false
    @State var setsReviewCount = false
    @State var setsReviewCountCeiling = false
    @State var showAINotice: Bool = false
    @State var showBottomSheet: Bool = false
    
    var customizeNoticeMsg: AttributedString {
        var msgText = AttributedString("Customized AI Notice. ")
        msgText.font = .footnote.italic()
        msgText.foregroundColor = .purple
        return msgText
    }

    var customizeNoticeActionLabel: AttributedString {
        var msgText = AttributedString(" View Details ")
        msgText.font = .footnote.bold()
        msgText.foregroundColor = .purple
        return msgText
    }

    var body: some View {
        List {
            Text("RatingControlFormView Examples")
            Toggle("Shows Hint Message", isOn: self.$showsHintMessage)
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
            Toggle("AI Notice", isOn: self.$showAINotice)
                .padding(.leading, 16)
                .padding(.trailing, 16)

            Text("Default Examples")
            RatingControlFormView(title: "Rating 1", rating: self.$rating1, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
                .aiNoticeView(isPresented: self.$showAINotice)
            
            RatingControlFormView(title: "Rating 2 (Disabled)", rating: self.$rating2, ratingControlStyle: .editableDisabled, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
                .aiNoticeView(isPresented: self.$showAINotice, icon: Image(fioriName: "fiori.ai"), description: "AI Notice message. ", actionLabel: "View more link", viewMoreAction: self.openURL)
                .disabled(true)

            RatingControlFormView(title: "Rating 3 (Read Only) Rating 3 (Read Only)", rating: self.$rating3, ratingControlStyle: .standard, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
                .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
            
            RatingControlFormView(title: "Rating 4 (Read Only Large) Rating 4 (Read Only Large)", rating: self.$rating4, ratingControlStyle: .standardLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
                .aiNoticeView(isPresented: self.$showAINotice, icon: Image(fioriName: "fiori.ai"), description: "AI Notice with icon. ", actionLabel: "View more details", viewMoreAction: self.toggleShowSheet)
                .sheet(isPresented: self.$showBottomSheet) {
                    Text("detail information")
                        .presentationDetents([.height(250), .medium])
                        .presentationDragIndicator(.visible)
                }
            
            RatingControlFormView(title: "Rating 5 (Accented)", rating: self.$rating5, ratingControlStyle: .accented, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
                .aiNoticeView(isPresented: self.$showAINotice, icon: Image(fioriName: "fiori.ai"), description: "AI Notice with icon, long long long long long long message. ", actionLabel: "View more link", viewMoreAction: self.openURL)
            
            RatingControlFormView(title: "Rating 6 (Accented Large)", rating: self.$rating6, ratingControlStyle: .accentedLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
                .aiNoticeView(isPresented: self.$showAINotice, icon: Image(systemName: "wand.and.sparkles"), description: self.customizeNoticeMsg, actionLabel: self.customizeNoticeActionLabel, viewMoreAction: self.openURL)
                .iconStyle(content: { config in
                    config.icon.foregroundStyle(Color.purple)
                })
            
            Text("Stacked")
            RatingControlFormView(title: "Rating 7", rating: self.$rating7, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, axis: .vertical)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 8 (Disabled)", rating: self.$rating8, ratingControlStyle: .editableDisabled, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, axis: .vertical)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 9 (Read Only)", rating: self.$rating9, ratingControlStyle: .standard, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, axis: .vertical)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 10 (Read Only Large)", rating: self.$rating10, ratingControlStyle: .standardLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, axis: .vertical)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 11 (Accented)", rating: self.$rating11, ratingControlStyle: .accented, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, axis: .vertical)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 12 (Accented Large)", rating: self.$rating12, ratingControlStyle: .accentedLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, axis: .vertical)
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))

            Text("With Subtitle")
            RatingControlFormView(title: "Rating 13", rating: self.$rating13, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, subtitle: "Rating 13 Subtitle")
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 14 (Disabled)", rating: self.$rating14, ratingControlStyle: .editableDisabled, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, subtitle: "Rating 14 Subtitle")
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 15 (Read Only)", rating: self.$rating15, ratingControlStyle: .standard, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, subtitle: "Rating 15 Subtitle")
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 16 (Read Only Large)", rating: self.$rating16, ratingControlStyle: .standardLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, subtitle: "Rating 16 Subtitle")
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 17 (Accented)", rating: self.$rating17, ratingControlStyle: .accented, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, subtitle: "Rating 17 Subtitle")
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 18 (Accented Large)", rating: self.$rating18, ratingControlStyle: .accentedLarge, showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel, subtitle: "Rating 18 Subtitle")
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))

            Text("Customized")
            RatingControlFormView(title: "Rating 19", onStarImage: Image(systemName: "hand.thumbsup.fill").renderingMode(.template).resizable(), offStarImage: Image(systemName: "hand.thumbsdown.fill").renderingMode(.template).resizable(), halfStarImage: Image(systemName: "hand.thumbsup.circle").renderingMode(.template).resizable(), rating: self.$rating19, itemSize: CGSize(width: 40, height: 40), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
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
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 20 (Disabled)", onStarImage: Image(systemName: "hand.thumbsup.fill").renderingMode(.template).resizable(), offStarImage: Image(systemName: "hand.thumbsdown.fill").renderingMode(.template).resizable(), halfStarImage: Image(systemName: "hand.thumbsup.circle").renderingMode(.template).resizable(), rating: self.$rating20, ratingControlStyle: .editableDisabled, itemSize: CGSize(width: 30, height: 30), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
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
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 21 (Read Only) Rating 21 (Read Only)", onStarImage: Image(systemName: "hand.thumbsup.fill").renderingMode(.template).resizable(), offStarImage: Image(systemName: "hand.thumbsdown.fill").renderingMode(.template).resizable(), halfStarImage: Image(systemName: "hand.thumbsup.circle").renderingMode(.template).resizable(), rating: self.$rating21, ratingControlStyle: .standard, itemSize: CGSize(width: 10, height: 10), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
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
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 22 (Read Only Large) Rating 22 (Read Only Large)", onStarImage: Image(systemName: "hand.thumbsup.fill").renderingMode(.template).resizable(), offStarImage: Image(systemName: "hand.thumbsdown.fill").renderingMode(.template).resizable(), halfStarImage: Image(systemName: "hand.thumbsup.circle").renderingMode(.template).resizable(), rating: self.$rating22, ratingControlStyle: .standardLarge, itemSize: CGSize(width: 20, height: 20), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
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
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 23 (Accented)", onStarImage: Image(systemName: "hand.thumbsup.fill").renderingMode(.template).resizable(), offStarImage: Image(systemName: "hand.thumbsdown.fill").renderingMode(.template).resizable(), halfStarImage: Image(systemName: "hand.thumbsup.circle").renderingMode(.template).resizable(), rating: self.$rating23, ratingControlStyle: .accented, itemSize: CGSize(width: 5, height: 5), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
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
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
            RatingControlFormView(title: "Rating 24 (Accented Large)", onStarImage: Image(systemName: "hand.thumbsup.fill").renderingMode(.template).resizable(), offStarImage: Image(systemName: "hand.thumbsdown.fill").renderingMode(.template).resizable(), halfStarImage: Image(systemName: "hand.thumbsup.circle").renderingMode(.template).resizable(), rating: self.$rating24, ratingControlStyle: .accentedLarge, itemSize: CGSize(width: 10, height: 10), showsValueLabel: self.showsValueLabel, averageRating: self.getAverageRatingValue(), reviewCount: self.getReviewCount(), reviewCountCeiling: self.getReviewCountCeiling(), showsReviewCountLabel: self.showsReviewCountLabel)
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
                .informationView(isPresented: self.$showsHintMessage, description: AttributedString("hint message"))
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
    
    func openURL() {
        let url = URL(string: "https://sap.com")!
        UIApplication.shared.open(url)
    }
    
    func toggleShowSheet() {
        self.showBottomSheet.toggle()
    }
}

#Preview {
    RatingControlExample()
}

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

    var body: some View {
        List {
            Text("RatingControl Default Example")
            RatingControl(rating: self.$rating1, ratingControlStyle: .editable)
            RatingControl(rating: self.$rating2, ratingControlStyle: .editableDisabled)
            RatingControl(rating: self.$rating3, ratingControlStyle: .standard)
            RatingControl(rating: self.$rating4, ratingControlStyle: .accented)

            Text("Custom Color Example")
            RatingControl(rating: self.$rating5, ratingControlStyle: .editable, onColor: .red, offColor: .yellow)
            RatingControl(rating: self.$rating6, ratingControlStyle: .editableDisabled, onColor: .orange, offColor: .yellow)
            RatingControl(rating: self.$rating7, ratingControlStyle: .standard, onColor: .brown, offColor: .yellow)
            RatingControl(rating: self.$rating8, ratingControlStyle: .accented, onColor: .black, offColor: .yellow)

            Text("Larger Size Example")
            RatingControl(rating: self.$rating9, ratingControlStyle: .editable, itemSize: CGSize(width: 50, height: 50))
            RatingControl(rating: self.$rating10, ratingControlStyle: .editableDisabled, itemSize: CGSize(width: 40, height: 40))
            RatingControl(rating: self.$rating11, ratingControlStyle: .standard, itemSize: CGSize(width: 10, height: 10))
            RatingControl(rating: self.$rating12, ratingControlStyle: .accented, itemSize: CGSize(width: 5, height: 5))

            Text("Custom Image Example")
            RatingControl(rating: self.$rating13, ratingControlStyle: .editable, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"))
            RatingControl(rating: self.$rating14, ratingControlStyle: .editableDisabled, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"))
            RatingControl(rating: self.$rating15, ratingControlStyle: .standard, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"))
            RatingControl(rating: self.$rating16, ratingControlStyle: .accented, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"))

            Text("Custom Number of Stars Example")
            RatingControl(rating: self.$rating17, ratingControlStyle: .editable, ratingBounds: -5 ... 5)
            RatingControl(rating: self.$rating18, ratingControlStyle: .editableDisabled, ratingBounds: -5 ... 5)
            RatingControl(rating: self.$rating19, ratingControlStyle: .standard, ratingBounds: -5 ... 5)
            RatingControl(rating: self.$rating20, ratingControlStyle: .accented, ratingBounds: -5 ... 5)
        }
    }
}

#Preview {
    RatingControlExample()
}

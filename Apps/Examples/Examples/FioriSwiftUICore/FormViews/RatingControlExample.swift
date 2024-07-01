import FioriSwiftUICore
import SwiftUI

struct RatingControlExample: View {
    @State var rating1: Int = 1
    let ratingControlConfig1 = RatingControlConfig(style: .editable)

    @State var rating2: Int = 2
    let ratingControlConfig2 = RatingControlConfig(style: .editableDisabled)

    @State var rating3: Int = 3
    let ratingControlConfig3 = RatingControlConfig(style: .standard)

    @State var rating4: Int = 4
    let ratingControlConfig4 = RatingControlConfig(style: .accented)

    @State var rating5: Int = 1
    let ratingControlConfig5 = RatingControlConfig(style: .editable, onColor: .red, offColor: .yellow)

    @State var rating6: Int = 2
    let ratingControlConfig6 = RatingControlConfig(style: .editableDisabled, onColor: .orange, offColor: .yellow)

    @State var rating7: Int = 3
    let ratingControlConfig7 = RatingControlConfig(style: .standard, onColor: .brown, offColor: .yellow)

    @State var rating8: Int = 4
    let ratingControlConfig8 = RatingControlConfig(style: .accented, onColor: .black, offColor: .yellow)

    @State var rating9: Int = 1
    let ratingControlConfig9 = RatingControlConfig(style: .editable, itemSize: CGSize(width: 50, height: 50))

    @State var rating10: Int = 2
    let ratingControlConfig10 = RatingControlConfig(style: .editableDisabled, itemSize: CGSize(width: 40, height: 40))

    @State var rating11: Int = 3
    let ratingControlConfig11 = RatingControlConfig(style: .standard, itemSize: CGSize(width: 10, height: 10))

    @State var rating12: Int = 4
    let ratingControlConfig12 = RatingControlConfig(style: .accented, itemSize: CGSize(width: 5, height: 5))

    @State var rating13: Int = 1
    let ratingControlConfig13 = RatingControlConfig(style: .editable, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"))

    @State var rating14: Int = 2
    let ratingControlConfig14 = RatingControlConfig(style: .editableDisabled, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"))

    @State var rating15: Int = 3
    let ratingControlConfig15 = RatingControlConfig(style: .standard, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"))

    @State var rating16: Int = 4
    let ratingControlConfig16 = RatingControlConfig(style: .accented, onImage: Image(systemName: "hand.thumbsup.fill"), offImage: Image(systemName: "hand.thumbsdown.fill"))

    @State var rating17: Int = 1
    let ratingControlConfig17 = RatingControlConfig(style: .editable, ratingBounds: -5 ... 5)

    @State var rating18: Int = 2
    let ratingControlConfig18 = RatingControlConfig(style: .editableDisabled, ratingBounds: -5 ... 5)

    @State var rating19: Int = 3
    let ratingControlConfig19 = RatingControlConfig(style: .standard, ratingBounds: -5 ... 5)

    @State var rating20: Int = 4
    let ratingControlConfig20 = RatingControlConfig(style: .accented, ratingBounds: -5 ... 5)

    var body: some View {
        List {
            Text("RatingControl Default Example")
            RatingControl(rating: self.$rating1, ratingControlConfig: self.ratingControlConfig1)
            RatingControl(rating: self.$rating2, ratingControlConfig: self.ratingControlConfig2)
            RatingControl(rating: self.$rating3, ratingControlConfig: self.ratingControlConfig3)
            RatingControl(rating: self.$rating4, ratingControlConfig: self.ratingControlConfig4)

            Text("Custom Color Example")
            RatingControl(rating: self.$rating5, ratingControlConfig: self.ratingControlConfig5)
            RatingControl(rating: self.$rating6, ratingControlConfig: self.ratingControlConfig6)
            RatingControl(rating: self.$rating7, ratingControlConfig: self.ratingControlConfig7)
            RatingControl(rating: self.$rating8, ratingControlConfig: self.ratingControlConfig8)

            Text("Larger Size Example")
            RatingControl(rating: self.$rating9, ratingControlConfig: self.ratingControlConfig9)
            RatingControl(rating: self.$rating10, ratingControlConfig: self.ratingControlConfig10)
            RatingControl(rating: self.$rating11, ratingControlConfig: self.ratingControlConfig11)
            RatingControl(rating: self.$rating12, ratingControlConfig: self.ratingControlConfig12)

            Text("Custom Image Example")
            RatingControl(rating: self.$rating13, ratingControlConfig: self.ratingControlConfig13)
            RatingControl(rating: self.$rating14, ratingControlConfig: self.ratingControlConfig14)
            RatingControl(rating: self.$rating15, ratingControlConfig: self.ratingControlConfig15)
            RatingControl(rating: self.$rating16, ratingControlConfig: self.ratingControlConfig16)

            Text("Custom Number of Stars Example")
            RatingControl(rating: self.$rating17, ratingControlConfig: self.ratingControlConfig17)
            RatingControl(rating: self.$rating18, ratingControlConfig: self.ratingControlConfig18)
            RatingControl(rating: self.$rating19, ratingControlConfig: self.ratingControlConfig19)
            RatingControl(rating: self.$rating20, ratingControlConfig: self.ratingControlConfig20)
        }
    }
}

#Preview {
    RatingControlExample()
}

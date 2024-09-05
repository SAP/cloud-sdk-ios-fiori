import FioriSwiftUICore
import Foundation
import SwiftUI

struct DateTimePickerExample: View {
    @State var s1: Date = .init()
    @State var s2: Date = .init()
    @State var s3: Date = .init()
    @State var s4: Date = .init()
    
    struct CustomTitleStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .title3))
                .foregroundStyle(Color.preferredColor(.indigo7))
        }
    }
    
    struct CustomValueLabelStyle: ValueLabelStyle {
        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
                .font(.fiori(forTextStyle: .callout))
                .foregroundStyle(Color.preferredColor(.green7))
        }
    }
    
    var body: some View {
        VStack {
            DateTimePicker(title: "Default", selectedDate: self.$s1)
            DateTimePicker(title: "Date only", selectedDate: self.$s2, pickerComponents: [.date])
            DateTimePicker(title: "Time only", selectedDate: self.$s3, pickerComponents: [.hourAndMinute])
            DateTimePicker(title: "Custom Style", selectedDate: self.$s3)
                .titleStyle(CustomTitleStyle())
                .valueLabelStyle(CustomValueLabelStyle())
        }
    }
}

struct DateTimePickerExample_Previews: PreviewProvider {
    static var previews: some View {
        DateTimePickerExample()
    }
}

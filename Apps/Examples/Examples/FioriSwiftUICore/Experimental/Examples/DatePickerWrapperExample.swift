import FioriSwiftUICore
import SwiftUI

struct DatePickerWrapperExample: View {
    @State var showDatePicker: Bool = false
    @State var dateSelection = Date()
    var body: some View {
        Button {
            showDatePicker.toggle()
        } label: {
            Text("Date: \(dateSelection)")
        }
        .sheet(isPresented: $showDatePicker) {
            let dayInterval = Double(24 * 60 * 60)
            VStack {
                DatePickerWrapper(selection: $dateSelection,
                                  in: Date(timeIntervalSinceNow: -(5 * dayInterval)) ... Date(timeIntervalSinceNow: 8 * dayInterval),
                                  datePickerMode: .date,
                                  datePickerStyle: .inline)
                    .frame(height: 300)
                Spacer()
            }
        }
    }
}

struct DatePickerWrapperExample_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerWrapperExample()
    }
}

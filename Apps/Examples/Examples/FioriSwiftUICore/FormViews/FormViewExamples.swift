import SwiftUI

struct FormViewExamples: View {
    var body: some View {
        List {
            NavigationLink(
                destination: NoteFormViewExample())
            {
                Text("NoteFormView Example")
            }
            NavigationLink(
                destination: KeyValueFormViewExample())
            {
                Text("KeyValueFormView Example")
            }
        }
    }
}

#Preview {
    FormViewExamples()
}

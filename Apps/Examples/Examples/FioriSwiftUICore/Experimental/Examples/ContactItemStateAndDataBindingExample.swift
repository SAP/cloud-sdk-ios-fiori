import FioriSwiftUICore
import SwiftUI

// MARK: View

struct ContactItemStateAndDataBindingExample: View {
    @ObservedObject var model: EmailContactViewModel

    @State private var showingAlert = false

    var body: some View {
        VStack {
            ExpHeaderView("Contact Item", subtitle: "State Handling", desc: "Struct/ObservableObject can back component model protocol (here: ContactItemModel) and changes will recompute the view",
                          back: .green, textColor: .white)

            ContactItem(model: model)
                .exampleHighlighting()
        }
        .alert(isPresented: $model.showingAlert, content: {
            Alert(title: Text("Important message"), message: Text("Sending email to \(model.title)"), dismissButton: .default(Text("Got it!")))
        })
    }
}

struct ContactItemStateExample_Previews: PreviewProvider {
    static var previews: some View {
        ContactItemStateAndDataBindingExample(model: EmailContactViewModel())
    }
}

// MARK: View Model

class EmailContactViewModel: ObservableObject {
    @Published var showingAlert = false

    @Published var name: String = EmailContactViewModel.randomName

    var lastEmailOn: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .long
        dateFormatter.locale = Locale.current
        return "Last email on \(dateFormatter.string(from: Date()))"
    }

    var email: String {
        "Jimmy Steward"
    }

    public init() {
        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.fireTimer), userInfo: nil, repeats: true)
    }

    @objc func fireTimer() {
        self.name = EmailContactViewModel.randomName // or call self.objectWillChange.send() to update model
    }

    static var randomName: String {
        "Mike \(["Palmers", "Chamers", "Balmers"].randomElement()!)"
    }
}

// MARK: Component Model

extension EmailContactViewModel: ContactItemModel {
    var title: String {
        self.name
    }

    var subtitle: String? {
        self.lastEmailOn
    }
}

extension EmailContactViewModel {
    static let mike = EmailContactViewModel()
}

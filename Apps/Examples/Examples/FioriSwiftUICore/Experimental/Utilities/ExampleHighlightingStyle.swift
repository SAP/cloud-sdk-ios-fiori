import SwiftUI

struct ExampleHighlightingStyle: View {
    var body: some View {
        Text("Hello, World!").exampleHighlighting()
    }
}

struct ExampleHighlightingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .border(Color.black)
            .padding()
    }
}

extension View {
    func exampleHighlighting() -> some View {
        self.modifier(ExampleHighlightingModifier())
    }
}

struct ExampleHighlightingStyle_Previews: PreviewProvider {
    static var previews: some View {
        ExampleHighlightingStyle()
    }
}

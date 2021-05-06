import FioriSwiftUICore
import Foundation
import SwiftUI

struct ThemingExample: View {
    @State private var useTheming = false
    var body: some View {
        VStack {
            ScrollView {
                ExpHeaderView("Theming", subtitle: "StyleCache", desc: "using StyleCache.upsertStyles",
                              back: .green, textColor: .white)

                ContactItem(model: LibraryPreviewData.Person.joesmith)
                    .subtitleStyleClass("foo")
                    .exampleHighlighting()

                Toggle("Set style class to apply a red banner to subtitle", isOn: $useTheming.didSet { state in
                    if state {
                        self.setFooStyleClass()
                    } else {
                        resetStyles()
                    }
                })
                    .padding()
            }
        }
    }

    func setFooStyleClass() {
        let redBannerModifier = AnyViewModifier { $0.modifier(RedBanner()) }
        try? StyleCache.upsertStyles(["foo": redBannerModifier])
    }

    func resetStyles() {
        StyleCache.resetStyles()
    }
}

struct RedBanner: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .font(.title)
            .background(Color.red)
            .foregroundColor(.white)
    }
}

extension Binding {
    func didSet(execute: @escaping (Value) -> Void) -> Binding {
        Binding(
            get: {
                self.wrappedValue
            },
            set: {
                self.wrappedValue = $0
                execute($0)
            }
        )
    }
}

struct ThemingExample_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ThemingExample()
                .previewLayout(.sizeThatFits)
        }
    }
}

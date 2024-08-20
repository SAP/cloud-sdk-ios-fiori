import FioriSwiftUICore
import SwiftUI

struct FioriButtonInListMultipleLineExample: View {
    var body: some View {
        List {
            Section {
                ForEach(0 ..< 6, id: \.self) { index in
                    FioriButton { _ in
                        HStack(spacing: 8.0, content: {
                            if index % 2 == 1 { // align content right
                                Spacer()
                            }
                            Image(fioriName: "fiori.paper.plane").fontWeight(.bold).font(.fiori(forTextStyle: .body))
                            Text(self.buttonTitle(for: index))
                            if index % 5 == 2 { // align content left
                                Spacer()
                            }
                        })
                    }
                    .disabled(index % 2 == 1)
                    .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity))
                }
            } header: {
                Text("Button Title Alignment")
                    .textCase(.none)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .alignmentGuide(.listRowSeparatorLeading, computeValue: { _ in
                0
            })
        }
        .listStyle(.plain)
        .navigationTitle("Button In List - Multiple Lines")
        .navigationBarTitleDisplayMode(.large)
    }
    
    func buttonTitle(for index: Int) -> String {
        var text = "Button Label test"
        for _ in 0 ..< index {
            text += "\n" + "Button Label test"
        }
        return text
    }
}

#Preview {
    FioriButtonInListMultipleLineExample()
}

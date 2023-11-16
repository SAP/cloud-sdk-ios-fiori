import SwiftUI
import FioriSwiftUICore

struct NavigationBarCustomItem: View {
    var body: some View {
        Color.random
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button {
                        } label: {
                            Text("Option")
                                .padding()
                        }
                        .buttonStyle(CustomBarButtonStyle())
                        
                        Button {
                        } label: {
                            Image(systemName: "pencil")
                                .padding()
                        }
                        .buttonStyle(CustomBarButtonStyle())
                    }
                }
            }
            .navigationTitle("Custom Bar Item")
    }
}

#Preview {
    NavigationBarCustomItem()
}

struct CustomBarButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.fiori(forTextStyle: .headline, weight: .black))
            .foregroundStyle(Color.preferredColor(configuration.isPressed ? .tintColor : .tintColorTapState))
            .background(Color.preferredColor(configuration.isPressed ? .quaternaryFill : .cellBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

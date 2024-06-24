import FioriSwiftUICore
import SwiftUI

struct NavigationBarCustomItem: View {
    var body: some View {
        Color.random
            .frame(height: 5000)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button {} label: {
                            Text("Custom Button")
                                .padding()
                        }
                        .buttonStyle(CustomBarButtonStyle())
                        
                        Button {} label: {
                            Image(systemName: "pencil")
                                .padding()
                        }
                        .buttonStyle(CustomBarButtonStyle())
                    }
                }
            }
            .navigationTitle("Custom Bar Item")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.thinMaterial, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        NavigationBarCustomItem()
    }
}

struct CustomBarButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.fiori(forTextStyle: .headline, weight: .bold))
            .foregroundStyle(Color.preferredColor(configuration.isPressed ? .tintColor : .accentLabel5))
            .background(Color.preferredColor(configuration.isPressed ? .quaternaryFill : .cellBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

import Foundation
import SwiftUI

extension View {
    /// A sheet that can be presented by a settings button in the nav bar for configuring components in a test app.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the sheet that you create in the modifier’s content closure.
    ///   - content: A closure that returns the content of the sheet.
    func settingsSheet(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> some View) -> some View {
        self
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented.wrappedValue.toggle()
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .sheet(isPresented: isPresented) {
                Form {
                    content()
                }
            }
    }
}

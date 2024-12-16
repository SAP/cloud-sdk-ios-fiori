import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ActionItemsBaseStyle: ActionItemsStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ActionItemsConfiguration) -> some View {
        // Add default layout here
        HStack(spacing: 0) {
            ForEach(configuration.actionItems ?? [], id: \.id) { element in
                Button {
                    configuration.didSelectActivityItem?(element)
                } label: {
                    element.icon
                        .font(.fiori(forTextStyle: .body).weight(.light))
                        .imageScale(.large)
                        .foregroundColor(.preferredColor(.tintColor))
                        .frame(width: 44, height: 44, alignment: .center)
                }
                .buttonStyle(BorderlessButtonStyle())
            }
        }
        .navigationTitle("ActionItemsExample")
    }
}

// Default fiori styles
public struct ActionItemsFioriStyle: ActionItemsStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ActionItemsConfiguration) -> some View {
        ActionItems(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

import FioriSwiftUICore
import SwiftUI

struct CustomCalendarProtocolTestDemo: View {
    @StateObject var dataModel = CustomDataModel()
    
    var body: some View {
        CustomChildView(dataModel: self.dataModel)
        
        CustomResolvedChildViewStyle(style: CustomChildViewBaseStyle(), configuration: CustomChildViewConfiguration(dataModel: self.dataModel))
    }
}

struct CustomChildView: View {
    @ObservedObject var dataModel: CustomDataModel
    var body: some View {
        let configuration = CustomChildViewConfiguration(dataModel: dataModel)
        CustomChildViewBaseStyle().makeBody(configuration)
    }
}

struct CustomResolvedChildViewStyle: View {
    let style: CustomChildViewBaseStyle
    let configuration: CustomChildViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

struct CustomChildViewConfiguration {
    @ObservedObject var dataModel: CustomDataModel
}

struct CustomChildViewBaseStyle {
    func makeBody(_ configuration: CustomChildViewConfiguration) -> some View {
        ScrollView {
            VStack {
                Text("Hello, world")
                Text("Hello, world")
                Text("Hello, world")
            }
            .onGeometryChange(for: CGSize.self, of: { proxy in
                proxy.size
            }, action: { newValue in
                configuration.dataModel.monthViewHeight = newValue.height
            })
        }
        .frame(height: configuration.dataModel.monthViewHeight)
        .background(
            Color.red
        )
    }
}

class CustomDataModel: ObservableObject {
    @Published var monthViewHeight: CGFloat = 20
}

import AnyCodable
import Combine
import ObservableArray
import SwiftUI

public struct ListCardView: View {
    @ObservedObject var model: ListCard
      
    public init(model: ListCard) {
        self.model = model
//        self.sinks.insert(model.objectWillChange.sink { _ in
//            print("content changed")
//        })
//        self.sinks.insert(model.content.objectWillChange.sink { _ in print("icons changed") } )
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Group {
                if ProcessInfo().isOperatingSystemAtLeast(OperatingSystemVersion(majorVersion: 14, minorVersion: 0, patchVersion: 0)) {
                    HeaderView(model: model.header)
                        .padding(.bottom, -1)
                } else {
                    HeaderView(model: model.header)
                        .padding(.bottom, -30)
                }

                Divider().accentColor(Color.primary)
                VStack(alignment: .leading) {
                    if model.content.count > 0 {
                        ForEach(0 ..< (model.maxItems ?? model.content.count)) {
                            ListItemView(icon: self.model.content[$0].icon, title: self.model.content[$0].title, description: self.model.content[$0].description, highlight: self.model.content[$0].highlight, info: self.model.content[$0].info)
                            Divider()
                        }
                    }
                }
            }
        }
        .padding(16)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray, lineWidth: 0.5)
        ).padding(16)
    }
    
    private var sinks = Set<AnyCancellable>()
}

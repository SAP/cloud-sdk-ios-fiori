import Foundation
import SwiftUI

struct TableListView: View {
    @ObservedObject var layoutManager: TableLayoutManager
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let views = self.layoutManager.getListItems()
        return
            List {
                ForEach(0 ..< views.count, id: \.self) { i in
                    views[i]
                        .padding([.leading, .trailing])
                        .gesture(TapGesture()
                            .onEnded { _ in
                                if let handler = self.layoutManager.model.didSelectRowAt {
                                    handler(i)
                                }
                            }
                        )
                }
            }
    }
}

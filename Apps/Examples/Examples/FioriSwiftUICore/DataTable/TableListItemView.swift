import Foundation
import SwiftUI

struct TableListItemView: View {
    let item: TableListItem
    
    var body: some View {
        HStack(alignment: .top, spacing: nil, content: {
            self.item.image
                .frame(width: 45, height: 45, alignment: .top)
            VStack(alignment: .leading, spacing: 8, content: {
                ForEach(self.item.titles, id: \.self) { title in
                    Text(title)
                        .frame(alignment: .topLeading)
                }
            })
        })
    }
    
    func makeBody(in rect: CGRect) -> some View {
        HStack(alignment: .top, spacing: nil, content: {
            self.item.image
                .frame(width: 45, height: 45, alignment: .top)
            VStack {
                ForEach(self.item.titles, id: \.self) { title in
                    Text(title)
                        .frame(alignment: .topLeading)
                }
            }
        })
    }
}

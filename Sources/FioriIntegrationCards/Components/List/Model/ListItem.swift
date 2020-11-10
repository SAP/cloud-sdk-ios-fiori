import Foundation
import UIKit

struct ListItem: Decodable, RawBindable, Identifiable {
    let icon: Icon?
    let title: String?
    let description: String?
    let highlight: Highlight?
    
    var id: String {
        self._uuid.uuidString
    }

    private let _uuid = UUID()
    
    init(data: [String: Any], binding: ListItemBinding) {
        if let path = binding.icon?.src {
            self.icon = Icon(src: path.replacingPlaceholders(withValuesIn: data))
        } else {
            self.icon = nil
        }
        
        if let path = binding.title {
            self.title = path.replacingPlaceholders(withValuesIn: data)
        } else {
            self.title = nil
        }
        
        if let path = binding.description {
            self.description = path.replacingPlaceholders(withValuesIn: data)
        } else {
            self.description = nil
        }
        self.highlight = nil
//        if let path = binding.highlight {
//            let value = path.replacingPlaceholders(withValuesIn: data)
//            highlight = Highlight(rawValue: value) ?? Highlight.none
//        } else {
//            highlight = nil
//        }
    }
}

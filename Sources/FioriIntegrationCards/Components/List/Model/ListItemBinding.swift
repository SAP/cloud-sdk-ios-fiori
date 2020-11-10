import Foundation

struct ListItemBinding: Decodable {
    let icon: Icon?
    let title: String?
    let description: String?
    let action: [Action]?
    let highlight: String?
}

import Combine
import Foundation
import SwiftUI
/*
 class ListCard_Obsolete<Data: Decodable & Identifiable & RawBindable, Binding>: Decodable, ObservableObject where Data.Binding == Binding {
    
     let type: String
     let header: Header?
     @Published var content: ListData<Data, Binding>
    
     enum CodingKeys: CodingKey {
         case type, header, content
     }
     required init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         type = try container.decode(String.self, forKey: .type)
         header = try container.decodeIfPresent(Header.self, forKey: .header)
         content = try container.decode(ListData<Data, Binding>.self, forKey: .content)
        
         sink = content.objectWillChange.sink { [unowned self] _ in
             self.objectWillChange.send()
         }
     }
    
     private var sink: AnyCancellable!
 }
 */

import AnyCodable
import SwiftUI
/*
 class ListModel<Data: Decodable & Identifiable & RawBindable, Binding>: Decodable, Identifiable, ObservableObject where Data.Binding == Binding {
    
     enum CodingKeys: String, CodingKey {
         case app = "sap.app"
         case card = "sap.card"
     }

     let app: App
     @Published var card: ListCard_Obsolete<Data, Binding>
    
     let id: UUID = UUID()
    
     required init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         app = try container.decode(App.self, forKey: .app)
         card = try container.decode(ListCard_Obsolete<Data, Binding>.self, forKey: .card)
     }
 }

 */

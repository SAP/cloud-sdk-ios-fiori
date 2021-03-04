import AnyCodable
import Foundation
/*
 class ListData<Data: Decodable & Identifiable & RawBindable, Binding>: Decodable, ObservableObject where Data.Binding == Binding {
    
     @Published var data: [Data]
     let item: Binding
    
     enum CodingKeys: String, CodingKey {
         case data
         case item
     }
    
     required init(from decoder: Decoder) throws {
         let _container = try decoder.container(keyedBy: ListData<Data, Binding>.CodingKeys.self)
         let _item = try _container.decode(Binding.self, forKey: .item)
         self.item = _item
         self.data = []
        
         // Decodes /data path to _NestedData struct
         let nestedData = try _container.decode(_NestedData.self, forKey: .data)
        
         // if `json` is already available from _NestedData, then transform to list of <Data> items immediately
         if let json = nestedData.json?.map ({ $0.compactMapValues({ $0.value })}) {
             data = json.map { Data.init(data: $0, binding: _item) }
            
         } else
             // if _NestedData doesn't have `json`, but instead has `request`, then cache
             if let urlString = nestedData.request?.url, let url = URL(string: urlString) {
             let session = URLSession(configuration: .default)
             let task = session.dataTask(with: url) { data, response, error in
                
                 guard error == nil else { print(String(describing: error!)); return }
                
                 guard let data = data, let path = nestedData.path else { print((String(describing: response!))); return }
                
                 do {
                     let parsed = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                     switch parsed {
                     case is NSDictionary:
                         let jsonDict = parsed as! JSONDictionary
                         if let root: JSONArray = resolve(jsonDict, keyPath: path, separator: "/") {
                             print("set async")
                             DispatchQueue.main.async {
                                 self.data = root.map { Data.init(data: $0, binding: self.item) }
                             }
                         }
                     case is NSArray:
                         let jsonArray = parsed as! JSONArray
                         print("jsonArray: \(jsonArray)")
                     default:
                         break
                     }
                 } catch {
                     print(error)
                 }
             }
             data = []
             task.resume()
         } else {
             data = []
         }
     }
 }

 */

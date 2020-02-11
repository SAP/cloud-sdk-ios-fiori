//
//  ContentView.swift
//  DevTest
//
//  Created by Stadelman, Stan on 1/22/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import ObservableArray
import FioriIntegrationCards

extension String: Identifiable {
    public var id: String {
        return self
    }
}

struct ContentView: View {
        
    let cards: [String]
    
    var body: some View {
        NavigationView() {
            List(cards) { card in
                NavigationLink(destination: self.makeBody(self.getManifest(for: card)!)) {
                    Text(card)
                }
            }
            .navigationBarTitle("UI Integration Cards")
        }
    }
    
    func makeBody(_ model: Manifest) -> AnyView {
        switch model.card {
        case .list(let value):
            return AnyView(ListCardView(model: value))
        case .object(let value):
            return AnyView(ObjectCardView(model: value))
        case .table(let value):
            return AnyView(TableCardView(model: value))
        case .timeline(let value):
            return AnyView(TimelineCardView(model: value))
        default:
            return AnyView(EmptyView())
        }
    }
    
    func getManifest(for card: String) -> Manifest? {
        do {
            let data = try Data(contentsOf: Bundle.main.url(forResource: card, withExtension: "json")!)
            let model = try JSONDecoder().decode(Manifest.self, from: data)
            return model
        } catch {
            print(error)
        }
        return nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        EmptyView()
    }
}

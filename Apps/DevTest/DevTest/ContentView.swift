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
    
    let models: [Manifest]
    
    var body: some View {
        NavigationView() {
            List() {
                ForEach(models) { model in
                    self.makeBody(model)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        EmptyView()
    }
}

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

extension Card: View {
    public var body: some View {
        return makeView()
            .frame(maxWidth: 425, alignment: .topLeading)
    }
    
    func makeView() -> some View {
        switch self {
        case .object(let card):
            return AnyView(ObjectCardView(model: card))
        case .list(let card):
            return AnyView(ListCardView(model: card))
        case .table(let card):
            return AnyView(TableCardView(model: card))
        case .timeline(let card):
            return AnyView(TimelineCardView(model: card))
        case .analytical(let card):
            return AnyView(AnalyticalCardView(model: card))
        }
    }
}

struct IntegrationCardsContentView: View {

    let cards: [String]
    
    init(cards: [String]) {
        self.cards = cards
    }
    
    var body: some View {
        TabView {

            List(InlineTestCases.allCases) { bundle in
                NavigationLink(destination: LoadingView(card: bundle)) {
                    Text(bundle.rawValue)
                }
            }
            .tabItem { Text("Test Cases") }
            CollectionView<[Manifest], Card>(data: InlineTestCases.allCases.compactMap({ $0.manifest() }), layout: flowLayout(for:containerSize:sizes:), content: { $0.card })
                .tabItem({ Text("Collection View") })
        }
    }
}

struct LoadingView: View {
    let card: InlineTestCases
    
    @State var isLoading = true
    @State var loadingMessage = "Loading ..."
    @State var model: Manifest?
    
    var body: some View {
        VStack{
            if isLoading {
                Text(loadingMessage)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            else {
                model?.card.body
            }
        }.onAppear {
            DispatchQueue.global(qos: .userInitiated).async {
                self.model = self.card.manifest()
                
                if self.model != nil {
                    self.isLoading = false
                }
                else {
                    self.loadingMessage = "Failed to load \(self.card)"
                }
            }
        }
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

struct IntegrationCardsContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntegrationCardsContentView(cards: ["LowCode", "timeline", "table", "list" , "object", "analytical"])
    }
}

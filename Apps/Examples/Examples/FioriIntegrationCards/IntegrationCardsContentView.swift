import FioriIntegrationCards
import ObservableArray
import SwiftUI

extension String: Identifiable {
    public var id: String {
        self
    }
}

extension Card: View {
    public var body: some View {
        makeView()
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
    private var testCases: [CardTestCase] = []
    
    init(testCases: [CardTestCase]? = nil) {
        if testCases == nil {
            self.testCases.append(contentsOf: InlineTestCases.allCases)
            self.testCases.append(contentsOf: DataRequestTestCases.allCases)
            self.testCases.append(contentsOf: [BundleTestCases.HTTPTimelineVarients, BundleTestCases.BundleTableVarients])
            self.testCases = self.testCases.sorted(by: { $0.name() < $1.name() })
        } else {
            self.testCases = testCases!
        }
    }
    
    var body: some View {
        TabView {
            List(testCases, id: \.id) { bundle in
                NavigationLink(destination: LoadingView(card: bundle)) {
                    Text(bundle.name())
                }
            }
            .tabItem { Text("Test Cases") }

            #if swift(>=5.3)
                if #available(iOS 14.0, *) {
                    ScrollView {
                        // wrap LazyVGrid in 2AnyView to avoid crash when using Xcode 12 to run on iOS 13.x, see https://developer.apple.com/forums/thread/650818
                        AnyView(
                            LazyVGrid(columns: [GridItem(spacing: 0), GridItem(spacing: 0)], spacing: 0) {
                                ForEach(InlineTestCases.allCases) { bundle in
                                    LoadingView(card: bundle)
                                }
                            }
                            .tabItem { Text("Collection View") })
                    }.tabItem { Text("Collection View") }
                }
            #endif
        }
        .navigationBarTitle("FioriIntegrationCards")
        .navigationBarItems(trailing:
            Button("UI5 Integration Card Reference") {
                UIApplication.shared.open(URL(string: "https://ui5.sap.com/test-resources/sap/ui/integration/demokit/cardExplorer/webapp/index.html#/exploreOverview/types")!)
            }
        )
    }
}

struct LoadingView: View {
    let card: CardTestCase
    
    @State var isLoading = true
    @State var loadingMessage = "Loading ..."
    @State var model: Manifest?
    
    var body: some View {
        VStack {
            if isLoading {
                Text(loadingMessage)
                    .font(.headline)
                    .foregroundColor(.primary)
            } else {
                model?.card.body
            }
        }.onAppear {
            DispatchQueue.global(qos: .userInitiated).async {
                self.model = self.card.manifest()
                
                if self.model != nil {
                    self.isLoading = false
                } else {
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

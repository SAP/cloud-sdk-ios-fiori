import FioriCharts
import FioriSwiftUICore
import MapKit
import SwiftUI

struct MobileCardExample: View {
    var body: some View {
        List {
            NavigationLink {
                List {
                    ForEach(0 ..< CardTests.cardSamples.count, id: \.self) { i in
                        CardTests.cardSamples[i]
                    }
                }
                .cardStyle(.card)
                .listStyle(.plain)
                .navigationBarTitle("List", displayMode: .inline)
            } label: {
                Text("List")
            }

            NavigationLink {
                MasonryTestView()
                    .navigationBarTitle("Masonry", displayMode: .inline)
            } label: {
                Text("Masonry")
            }
        }
        .navigationBarTitle("Cards", displayMode: .inline)
    }
}

struct MasonryTestView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    func numOfRows() -> Int {
        if UIDevice.current.localizedModel == "iPhone" {
            return self.horizontalSizeClass == .regular ? 2 : 1
        } else if UIDevice.current.localizedModel == "iPad" {
            return 3
        } else {
            return 1
        }
    }
    
    var body: some View {
        let layout = MasonryLayout(numOfColumns: numOfRows(), spacing: 16, lineSpacing: 8)
        
        ScrollView {
            layout {
                ForEach(0 ..< CardTests.cardSamples.count, id: \.self) { i in
                    CardTests.cardSamples[i]
                }
            }
            .cardStyle(.card)
        }
        .padding()
    }
}

#Preview {
    List {
        ForEach(0 ..< CardTests.cardSamples.count, id: \.self) { i in
            CardTests.cardSamples[i]
        }
    }
    .cardStyle(.card)
    .listStyle(.plain)
}

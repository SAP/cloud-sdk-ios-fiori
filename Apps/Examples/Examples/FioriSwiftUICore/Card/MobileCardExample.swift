import FioriCharts
import FioriSwiftUICore
import MapKit
import SwiftUI

struct MobileCardExample: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        List {
            NavigationLink {
                List {
                    ForEach(0 ..< CardTests.cardSamples.count, id: \.self) { i in
                        CardTests.cardSamples[i]
                    }
                    .listRowBackground(Color.preferredColor(.primaryGroupedBackground))
                }
                .cardStyle(.card)
                .listStyle(.plain)
                .navigationBarTitle("Cards", displayMode: .inline)
            } label: {
                Text("Cards")
            }
            
            NavigationLink {
                List {
                    ForEach(0 ..< CardTests.cardFooterSamples.count, id: \.self) { i in
                        CardTests.cardFooterSamples[i]
                    }
                    .listRowBackground(Color.preferredColor(.primaryGroupedBackground))
                }
                .cardStyle(.card)
                .listStyle(.plain)
                .navigationBarTitle("Footers", displayMode: .inline)
            } label: {
                Text("Footers")
            }

            NavigationLink {
                MasonryTestView()
                    .navigationBarTitle("Masonry", displayMode: .inline)
            } label: {
                Text("Masonry")
            }
            
            NavigationLink {
                CarouselTestView(self.horizontalSizeClass == .compact ? 1 : (UIDevice.current.localizedModel == "iPhone" ? 2 : 3))
                    .navigationBarTitle("Carousel", displayMode: .inline)
            } label: {
                Text("Carousel")
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
        .background(Color.preferredColor(.primaryGroupedBackground))
    }
}

extension VerticalAlignment: @retroactive Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
}

struct CarouselTestView: View {
    let defaultNumberOfColumns: Double
    
    @State var isPresented: Bool = false
    @State var isSameHeight: Bool = true
    @State var isSnapping: Bool = true
    @State var numberOfColumns: Double
    @State var spacing = 16.0
    @State var padding = 16.0
    @State var alignment = 0
    
    init(_ n: Double = 1) {
        self.defaultNumberOfColumns = n
        self._numberOfColumns = State(initialValue: n)
    }
    
    var body: some View {
        ScrollView(.vertical) {
            Carousel(numberOfColumns: Int(self.numberOfColumns), spacing: self.spacing, alignment: self.alignment == 0 ? .top : (self.alignment == 1 ? .center : .bottom), isSnapping: self.isSnapping, isSameHeight: self.isSameHeight) {
                ForEach(0 ..< CardTests.cardSamples.count, id: \.self) { i in
                    CardTests.cardSamples[i]
                }
            }
            .cardStyle(.card)
            .padding(self.padding)
        }
        .background(Color.preferredColor(.primaryGroupedBackground))
        .sheet(isPresented: self.$isPresented, content: {
            VStack {
                Toggle("Same card height", isOn: self.$isSameHeight)
                
                HStack {
                    Text("numberOfColumns: \(Int(self.numberOfColumns))")
                    Slider(value: self.$numberOfColumns, in: 1 ... self.defaultNumberOfColumns + 2, step: 1)
                }
                HStack {
                    Text("spacing: \(Int(self.spacing))")
                    Slider(value: self.$spacing, in: 0 ... 20, step: 4)
                }
                HStack {
                    Text("Alignment:")
                    Spacer()
                    Picker("Alignment", selection: self.$alignment) {
                        Text("Top").tag(0)
                        Text("Center").tag(1)
                        Text("Bottom").tag(2)
                    }
                }
                Toggle("isSnapping", isOn: self.$isSnapping)
                
                Divider()
                
                HStack {
                    Text("Padding around Carousel: \(Int(self.padding))")
                    Slider(value: self.$padding, in: 0 ... 20, step: 4)
                }
            }
            .padding()
            .presentationDetents([.medium])
        })
        .toolbar(content: {
            FioriButton(title: "Options") { _ in
                self.isPresented = true
            }
        })
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

import SwiftUI

struct NavigationBarSegmentedControl: View {
    @State private var selected = 0
    private let segments = ["Approval", "Others"]
 
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 8, pinnedViews: [.sectionHeaders]) {
                    Section(header: self.pickerHeader) {
                        ForEach(self.filteredItems, id: \.self) { i in
                            Text("List Item: \(i)")
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.quaternarySystemFill))
                                .cornerRadius(8)
                                .shadow(radius: 2)
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 20)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("To-Do")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("Tapped house")
                    }) {
                        Image(systemName: "house")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Tapped ellipsis  ")
                    }) {
                        Image(systemName: "ellipsis")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Tapped settings")
                    }) {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
    }
 
    var pickerHeader: some View {
        VStack(spacing: 0) {
            Picker("Segment", selection: self.$selected) {
                ForEach(0 ..< self.segments.count, id: \.self) {
                    Text(self.segments[$0])
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .padding(.top, 8)
 
            Divider()
        }
        .background(.ultraThinMaterial)
    }
 
    var filteredItems: [Int] {
        switch self.selected {
        case 0: return Array(0 ..< 20)
        case 1: return Array(20 ..< 40)
        default: return []
        }
    }
}

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
            NavigationLink {
                ScrollView {
                    Section {
                        Card(title: {
                            Text("Kixo Q1 Deal ")
                        }, subtitle: {
                            Text("Company Name")
                        }, detailImage: {
                            Circle()
                                .strokeBorder(.gray, lineWidth: 1)
                                .background(Circle().fill(Color.gray.opacity(0.3)))
                                .frame(width: 60, height: 60)
                                .overlay {
                                    Image(systemName: "bus.fill")
                                        .font(.title)
                                }
                        }, headerAction: {
                            Text("99")
                                .font(.system(size: 22))
                                .frame(width: 38, height: 36)
                                .foregroundStyle(Color.white)
                                .background(RoundedRectangle(cornerRadius: 12.0).fill(Color.red))
                        }, row2: {
                            Text("15 Jan,2025 • Discovery completed")
                                .font(.callout)
                        }, row3: {
                            VStack {
                                Text("in  progress")
                                    .foregroundStyle(Color(hex: "#AA0808"))
                                    .font(.subheadline)
                            }
                        })
                        .padding()
                        .cardStyle(.card)
                    } header: {
                        Text("custom elements on main header - headerAction ")
                            .padding(.leading, 20)
                            .fontWeight(.bold)
                    }.padding(.bottom, 10)
                    
                    Section {
                        Card(title: {
                            Text("Kixo Q1 Deal ")
                        }, subtitle: {
                            Text("Company Name")
                        }, detailImage: {
                            Circle()
                                .strokeBorder(.gray, lineWidth: 1)
                                .background(Circle().fill(Color.gray.opacity(0.3)))
                                .frame(width: 60, height: 60)
                                .overlay {
                                    Image(systemName: "bus.fill")
                                        .font(.title)
                                }
                        }, counter: {
                            Text("99")
                                .font(.system(size: 22))
                                .frame(width: 38, height: 36)
                                .foregroundStyle(Color.white)
                                .background(RoundedRectangle(cornerRadius: 12.0).fill(Color.red))
                        }, row2: {
                            Text("15 Jan,2025 • Discovery completed")
                                .font(.callout)
                        }, row3: {
                            VStack {
                                Text("in  progress")
                                    .foregroundStyle(Color(hex: "#AA0808"))
                                    .font(.subheadline)
                            }
                        })
                        .padding()
                        .cardStyle(.card)
                    } header: {
                        Text("custom elements on main header - counter")
                            .padding(.leading, 20)
                            .fontWeight(.bold)
                    }.padding(.bottom, 10)
                    
                    Section {
                        Card(title: {
                            Text("Kixo Q1 Deal ")
                        }, subtitle: {
                            Text("Company Name")
                        }, detailImage: {
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.gray, lineWidth: 1)
                                .frame(width: 60, height: 60)
                                .overlay {
                                    Image(systemName: "bus.fill")
                                        .font(.title)
                                }
                        }, row1: {
                            Tag("99").tagStyle(CustomTagStyle(textColor: .white, fillColor: .green))
                        }, row2: {
                            HStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .strokeBorder(.gray, lineWidth: 1)
                                    .frame(width: 16, height: 16)
                                    .overlay {
                                        Image(systemName: "hare.circle.fill")
                                    }
                                Text("Kixo Inc • Open")
                                    .foregroundStyle(Color(hex: "#AA0808"))
                                    .font(.subheadline)
                            }
                        }, row3: {
                            HStack {
                                Circle()
                                    .strokeBorder(.gray, lineWidth: 1)
                                    .background(Circle().fill(Color.gray.opacity(0.3)))
                                    .frame(width: 16, height: 16)
                                    .overlay {
                                        Image(systemName: "tortoise.circle.fill")
                                    }
                                Text("Madlyn Riley Jackson")
                                    .foregroundStyle(Color(hex: "#AA0808"))
                                    .font(.subheadline)
                            }
                        }, kpiCaption: {
                            VStack {
                                Spacer()
                                HStack {
                                    Text("100.000")
                                        .font(.system(size: 22))
                                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                                    Text("USD")
                                        .font(.system(size: 17))
                                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                                }
                            }
                        })
                        .padding()
                        .cardStyle(.card)
                    } header: {
                        Text("custom elements for Tag Component")
                            .padding(.leading, 20)
                            .fontWeight(.bold)
                    }.padding(.bottom, 10)
                    
                    Section {
                        Card(title: {
                            Text("Kixo Q1 Deal ")
                        }, subtitle: {
                            Text("Company Name")
                        }, detailImage: {
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.gray, lineWidth: 1)
                                .frame(width: 60, height: 60)
                                .overlay {
                                    Image(systemName: "bus.fill")
                                        .font(.title)
                                }
                        }, row2: {
                            HStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .strokeBorder(.gray, lineWidth: 1)
                                    .frame(width: 16, height: 16)
                                    .overlay {
                                        Image(systemName: "hare.circle.fill")
                                    }
                                Text("Kixo Inc • Open")
                                    .foregroundStyle(Color(hex: "#AA0808"))
                                    .font(.subheadline)
                            }
                        }, row3: {
                            HStack {
                                Circle()
                                    .strokeBorder(.gray, lineWidth: 1)
                                    .background(Circle().fill(Color.gray.opacity(0.3)))
                                    .frame(width: 16, height: 16)
                                    .overlay {
                                        Image(systemName: "tortoise.circle.fill")
                                    }
                                Text("Madlyn Riley Jackson")
                                    .foregroundStyle(Color(hex: "#AA0808"))
                                    .font(.subheadline)
                            }
                        }, kpiCaption: {
                            Text("99")
                                .frame(width: 48, height: 36)
                                .font(.system(size: 22))
                                .foregroundStyle(Color.white)
                                .background(RoundedRectangle(cornerRadius: 12.0).fill(Color.green))
                        })
                        .padding()
                        .cardStyle(.card)
                    } header: {
                        Text("custom elements for KPI Component - kpiCaption")
                            .padding(.leading, 20)
                            .fontWeight(.bold)
                    }.padding(.bottom, 10)
                }
            } label: {
                Text("Cards custom score component")
            }
        }
        .navigationBarTitle("Cards", displayMode: .inline)
    }
}

struct CustomTagStyle: TagStyle {
    /// text color
    var textColor: Color = .preferredColor(.secondaryLabel)
    
    /// Color inside the tag
    var fillColor: Color = .clear
    
    public init(textColor: Color, fillColor: Color) {
        self.textColor = textColor
        self.fillColor = fillColor
    }
    
    public func makeBody(_ configuration: TagConfiguration) -> some View {
        configuration
            .tag
            .font(.system(size: 18))
            .foregroundColor(self.textColor)
            .lineLimit(1)
            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
            .background(RoundedRectangle(cornerRadius: 8).fill(self.fillColor))
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
            VStack(alignment: .leading, spacing: 24) {
                RoundedRectangle(cornerRadius: 16).foregroundStyle(Color.preferredColor(.grey3)).frame(height: 80)
                    .padding(.horizontal, 16)
                
                Carousel(numberOfColumns: Int(self.numberOfColumns), contentInsets: EdgeInsets(top: 0, leading: self.padding, bottom: 0, trailing: self.padding), spacing: self.spacing, alignment: self.alignment == 0 ? .top : (self.alignment == 1 ? .center : .bottom), isSnapping: self.isSnapping, isSameHeight: self.isSameHeight) {
                    ForEach(0 ..< min(8, CardTests.cardSamples.count), id: \.self) { i in
                        NavigationLink {
                            CardTests.cardSamples[i]
                        } label: {
                            CardTests.cardSamples[i]
                        }
                    }
                }
                
                RoundedRectangle(cornerRadius: 16).foregroundStyle(Color.preferredColor(.grey4)).frame(height: 80)
                    .padding(.horizontal, 16)
            }
            .cardStyle(.card)
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
                    Text("contentInsets(top: 0, leading: \(Int(self.padding)), bottom: 0, trailing: \(Int(self.padding)))")
                    Slider(value: self.$padding, in: 0 ... 24, step: 4)
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

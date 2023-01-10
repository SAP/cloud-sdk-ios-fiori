import FioriSwiftUICore
import Foundation
import SwiftUI

class World: KPIItemModel, Identifiable {
    var kpi: String? {
        "Hello World"
    }
    
    var subtitle: String?
}

class Space: KPIItemModel, Identifiable {
    var kpi: String? {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = MeasurementFormatter.UnitStyle.medium
        let distanceInMiles = Measurement(value: 321, unit: UnitLength.miles)
        return formatter.string(from: distanceInMiles)
    }
    
    var subtitle: String?
}

class Universe: KPIItemModel, Identifiable {
    var kpi: String? {
        let number = NSNumber(value: 99.9)
        let formattedValue = self.formatter.string(from: number)
        return formattedValue ?? "Hello Universe"
    }
    
    var subtitle: String?

    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

struct KPIHeaderFreestyleExample: View {
    var data: [KPIItemModel] = [World(), Space(), Universe()]

    var body: some View {
        VStack {
            ExpHeaderView("KPI Header", subtitle: "Header vs Layout container", desc: "semantic vs container. see code for comments")
            
            KPIHeader {
                KPIItem(kpi: {
                    Text("One")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
                    .background(Color.random)
                    .frame(width: 100)

                KPIItem(kpi: {
                    Text("Two")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
                    .background(Color.random)
                    .frame(width: 80)

                KPIItem(kpi: {
                    Text("Three")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
                    .background(Color.random)
                
                KPIItem(kpi: {
                    Text("Four")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
                    .background(Color.random)
                
                KPIItem(kpi: {
                    Text("Five")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
                    .background(Color.random)
                
                KPIItem(kpi: {
                    Text("Six")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
                    .background(Color.random)
            }
            .frame(height: 150)
            
            KPIHeader {
                createItem(120)
                createItem(200)
                createItem(400)
                createItem(200)
                createItem(222)
            }
            .frame(height: 100)
            
            Text("Group may break the max count limitation and pages organization")
            KPIHeader {
                createItem(120)
                Group {
                    createItem(200)
                    createItem(400)
                    createItem(200)
                    createItem(222)
                }
            }
            .frame(height: 100)
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private func createItem(_ width: CGFloat) -> some View {
        ZStack {
            Color.random
            Text(String(format: "width: %.1f", width))
        }
        .frame(width: width)
    }
}

struct KPIHeaderFreestyleExample_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KPIHeaderFreestyleExample()
        }
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct CardExtHeaderBaseStyle: CardExtHeaderStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        // Add default layout here
        if configuration.row1.isEmpty || configuration.row2.isEmpty || configuration.row3.isEmpty {
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 6) {
                    configuration.row1
                    configuration.row2
                    configuration.row3
                }
                
                Spacer(minLength: 12)
                
                VStack(alignment: .trailing, spacing: 0) {
                    configuration.kpi
                    configuration.kpiCaption
                }
            }
        } else {
            VStack(alignment: .leading, spacing: 6) {
                configuration.row1
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    if !configuration.row2.isEmpty || !configuration.row3.isEmpty {
                        VStack(alignment: .leading, spacing: 6) {
                            configuration.row2
                            configuration.row3
                        }
                    }
                    
                    Spacer(minLength: 12)
                    
                    VStack(alignment: .trailing, spacing: 0) {
                        configuration.kpi
                        configuration.kpiCaption
                    }
                }
            }
        }
    }
}

// Default fiori styles
extension CardExtHeaderFioriStyle {
    struct ContentFioriStyle: CardExtHeaderStyle {
        func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
            CardExtHeader(configuration)
            // Add default style for its content
            // .background()
        }
    }
    
    struct Row1FioriStyle: Row1Style {
        func makeBody(_ configuration: Row1Configuration) -> some View {
            Row1(configuration)
            // Add default style for Row1
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct Row2FioriStyle: Row2Style {
        func makeBody(_ configuration: Row2Configuration) -> some View {
            Row2(configuration)
            // Add default style for Row2
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct Row3FioriStyle: Row3Style {
        func makeBody(_ configuration: Row3Configuration) -> some View {
            Row3(configuration)
            // Add default style for Row3
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct KpiFioriStyle: KpiStyle {
        func makeBody(_ configuration: KpiConfiguration) -> some View {
            Kpi(configuration)
            // Add default style for Kpi
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct KpiCaptionFioriStyle: KpiCaptionStyle {
        func makeBody(_ configuration: KpiCaptionConfiguration) -> some View {
            KpiCaption(configuration)
                // Add default style for KpiCaption
                .foregroundStyle(Color.preferredColor(.secondaryLabel))
                .font(.fiori(forTextStyle: .caption2))
                .lineLimit(1)
        }
    }
}

#Preview("Empty") {
    CardExtHeader(row1: {
        EmptyView()
    }, row2: {
        EmptyView()
    }, row3: {
        EmptyView()
    }, kpi: {
        EmptyView()
    })
    .border(Color.blue)
}

#Preview("Full") {
    CardExtHeader(row1: {
        HStack {
            LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "Negative")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
                }
            LabelItem(title: "Critical")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.criticalLabel))
                }
            LabelItem(icon: Image(systemName: "checkmark.circle"), title: "Positive")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.positiveLabel))
                }
            Tag("Tag").tagStyle(ColorTagStyle(textColor: .preferredColor(.teal8), fillColor: .preferredColor(.teal2)))
            
            Tag("Tag").tagStyle(ColorTagStyle(textColor: .preferredColor(.green9), fillColor: .preferredColor(.green2)))
            
            Text("Long long long label").lineLimit(1)
        }
    }, row2: {
        HStack {
            Text("256 reviews")
        }
    }, row3: {
        HStack {
            Tag("Tag")
                .tagStyle(ColorTagStyle(textColor: .preferredColor(.grey9), fillColor: .preferredColor(.grey2)))
            
            Tag("Tag").tagStyle(ColorTagStyle(textColor: .preferredColor(.blue9), fillColor: .preferredColor(.blue2)))
            
            Tag("Tag").tagStyle(ColorTagStyle(textColor: .preferredColor(.teal8), fillColor: .preferredColor(.teal2)))
            
            Tag("Tag").tagStyle(ColorTagStyle(textColor: .preferredColor(.green9), fillColor: .preferredColor(.green2)))
        }
    }, kpi: {
        KPIItem(data: KPIItemData.components([.icon(Image(systemName: "arrowtriangle.up.fill")), .unit("$"), .metric("26.9")]), subtitle: "test")
    }, kpiCaption: {
        Text("test")
    })
    .border(Color.gray)
}

#Preview("data") {
    CardExtHeader(row1: {
        HStack {
            LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "Negative")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
                }
            LabelItem(title: "Critical")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.criticalLabel))
                }
            LabelItem(icon: Image(systemName: "checkmark.circle"), title: "Positive")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.positiveLabel))
                }
        }
    }, row2: {
        HStack {
            Text("256 reviews")
        }
    }, kpi: KPIItemData.components([.icon(Image(systemName: "arrowtriangle.up.fill")), .unit("$"), .metric("26.9"), .unit("M")]),
    kpiCaption: "Revenue Subtitle that goes to multiple lines before truncating just like that")
        .border(Color.gray)
}

#Preview("Tow row") {
    CardExtHeader(row1: {
        HStack {
            LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "Negative")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
                }
            LabelItem(title: "Critical")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.criticalLabel))
                }
            LabelItem(icon: Image(systemName: "checkmark.circle"), title: "Positive")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.positiveLabel))
                }
        }
    }, row3: {
        HStack {
            Text("256 reviews")
        }
    }, kpi: {
        KPIItem(data: KPIItemData.components([.icon(Image(systemName: "arrowtriangle.up.fill")), .unit("$"), .metric("26.9")]))
    }, kpiCaption: {
        Text("Revenue")
    })
    .border(Color.gray)
}

#Preview("One row") {
    CardExtHeader(row3: {
        HStack {
            LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "Negative")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
                }
            LabelItem(title: "Critical")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.criticalLabel))
                }
            LabelItem(icon: Image(systemName: "checkmark.circle"), title: "Positive")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.positiveLabel))
                }
        }
    }, kpi: KPIItemData.components([.icon(Image(systemName: "arrowtriangle.up.fill")), .unit("$"), .metric("26.9"), .unit("M")]),
    kpiCaption: "Revenue")
}

#Preview("No KPI") {
    CardExtHeader(row1: {
        HStack {
            LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "Negative")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
                }
            LabelItem(title: "Critical")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.criticalLabel))
                }
            LabelItem(icon: Image(systemName: "checkmark.circle"), title: "Positive")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.positiveLabel))
                }
        }
    }, row2: {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star")
            Image(systemName: "star")
            Image(systemName: "star")
            Spacer().frame(width: 8)
            Text("Long long long long long long long text").lineLimit(1)
        }
    }, row3: {
        HStack(spacing: 4) {
            Tag("Tag")
            Circle().frame(width: 2).foregroundColor(Color.preferredColor(.tertiaryLabel).opacity(0.9))
            Tag("Tag").tagStyle(DarkTagStyle())
            Circle().frame(width: 2).foregroundColor(Color.preferredColor(.tertiaryLabel).opacity(0.9))
            Tag("Tag")
        }
    }, kpi: nil)
        .border(Color.gray)
}

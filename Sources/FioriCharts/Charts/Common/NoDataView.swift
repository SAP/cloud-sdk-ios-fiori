//
//  NoDataView.swift
//  Micro Charts
//
//  Created by Stan Stadelman on 12/5/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

/**
A no data view is shown when there is no data

## Usage

```
 /// default NoDataView
 let noDataView = NoDataView()
 
 /// provide your own ViewBuilder to create the no data view
 let noDataView = NoDataView {
     GeometryReader { proxy in
         VStack(alignment: .center) {
             Text("☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹")
             Text("Customized No Data View")
             Text("☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹")
         }
         .frame(width: proxy.size.width, height: proxy.size.height)
         .border(Color.primary, width: 1)
     }
 }
 
```
*/

public struct NoDataView<Content: View>: View {
    
    let useDefault: Bool
    
    /// ViewBuilder to create its own no data view
    let content: () -> Content
    
    /// provide your own ViewBuilder to create the no data view
    public init(@ViewBuilder content: @escaping () -> Content) {
        useDefault = false
        
        self.content = content
    }
    
    /// the view body
    public var body: some View {
        GeometryReader { proxy in
            if useDefault {
                Text("No Data")
                    .foregroundColor(.primary)
                    .font(.body)
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                    .border(Color.primary, width: 1)
            } else {
                content()
            }
        }
    }
}

extension NoDataView where Content == EmptyView {
    /// the default no data view
    public init() {
        useDefault = true
        
        content = {
            EmptyView()
        }
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView {
            VStack {
                Text("------------")
                Text("No Data Yet")
                Text("------------")
            }.border(Color.primary, width: 1)
        }
        .frame(width: 320, height: 94, alignment: .center)
        .previewLayout(.sizeThatFits)
    }
}

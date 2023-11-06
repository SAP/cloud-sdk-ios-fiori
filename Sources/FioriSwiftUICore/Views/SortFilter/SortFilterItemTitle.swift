//
//  SortFilterItemTitle.swift
//
//
//  Created by Xu, Charles on 10/24/23.
//

import SwiftUI
import FioriThemeManager

/// Dialog titile component
struct SortFilterItemTitle: TitleComponent, View {
    public let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        Text(title)
            .font(.body)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .multilineTextAlignment(.center)
    }
}

#Preview {
    SortFilterItemTitle(title: /*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
}

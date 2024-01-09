//
//  SearchWithToken.swift
//  Examples
//
//  Created by Xu, Charles on 12/19/23.
//  Copyright © 2023 SAP. All rights reserved.
//

import SwiftUI
import FioriThemeManager

struct SearchWithToken: View {
    @State private var queryString = ""
    @State private var tokens = [
        ColorToken(name: "Red", fioriColor: .preferredColor(.red6)),
        ColorToken(name: "Mango", fioriColor: .preferredColor(.mango6)),
        ColorToken(name: "Blue", fioriColor: .preferredColor(.blue6))
    ]

    var body: some View {
        NavigationStack {
            List(ColorEntity.filterColors(queryString, tokens: tokens)) { color in
                Text(color.name)
                    .foregroundColor(color.fioriColor)
            }
            .navigationTitle("Colors")
            
        }
        .searchable(text: $queryString, tokens: $tokens) { token in
            Text(token.name)
//                .foregroundColor(token.fioriColor) // cannot customize text color
//                .font(.fiori(forTextStyle: .body)) // cannot use different font
        }
        .navigationBarTitleDisplayMode(.inline)
//        .foregroundColor(.preferredColor(.red5)) // it's not possible to change token text color here
        .font(.fiori(forTextStyle: .title3)) // font works, share the same font with title and search bar text field
    }
}

#Preview {
    SearchWithToken()
}

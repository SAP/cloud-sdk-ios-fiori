//
//  SearchWithSuggestion.swift
//  Examples
//
//  Created by Xu, Charles on 12/19/23.
//  Copyright © 2023 SAP. All rights reserved.
//

import SwiftUI
import FioriThemeManager

struct SearchWithSuggestion: View {
    @State private var queryString = ""

    var body: some View {
        NavigationStack {
            List(ColorEntity.filterColors(queryString)) { color in
                Text(color.name)
                    .foregroundColor(color.fioriColor)
            }
            .navigationTitle("Colors")
            
        }
        .searchable(text: $queryString,
                    prompt: "Color name",
                    suggestions: {
            ForEach(ColorEntity.colors.filter { $0.name.localizedCaseInsensitiveContains(queryString) }) { suggestion in
                Text(suggestion.name)
                    .foregroundColor(suggestion.fioriColor)
                    .font(.fiori(forTextStyle: .body))
                    .searchCompletion(suggestion.name)
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SearchWithSuggestion()
}

//
//  SectionHeader+View.swift
//  
//
//  Created by Stadelman, Stan on 9/19/20.
//

import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum SectionHeader {
//        typealias Title = EmptyModifier
        typealias Attribute = EmptyModifier

        // TODO: - substitute type-specific ViewModifier for EmptyModifier
        /*
            // replace `typealias Subtitle = EmptyModifier` with:

            struct Subtitle: ViewModifier {
                func body(content: Content) -> some View {
                    content
                        .font(.body)
                        .foregroundColor(.preferredColor(.primary3))
                }
            }
        */
        
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content.font(.headline).foregroundColor(.preferredColor(.primary1))
            }
        }
        static let title = Title()
        static let attribute = Attribute()
    }
}

// TODO: - Implement SectionHeader View body

extension SectionHeader: View {
    public var body: some View {
        HStack {
            title
            Spacer()
            HStack {
                attribute
                    .multilineTextAlignment(.trailing)
//                action
            }
        }
    }
}

//
//  SignatureViewInline.swift
//  Examples
//
//  Created by Wirjo, Fred on 11/23/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SwiftUI
import FioriCharts
import FioriSwiftUICore
import Combine

struct SignatureViewInline_Example: View {
    
    var signatureViewInline: SignatureViewInline!
    
    init() {
        signatureViewInline = SignatureViewInline()
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 30) {
            signatureViewInline
        }
    }
}

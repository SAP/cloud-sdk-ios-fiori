//
//  SignatureView.swift
//  Examples
//
//  Created by Wirjo, Fred on 11/4/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SwiftUI
import FioriCharts
import FioriSwiftUICore
import Combine

struct SignatureView_Example: View {
    
    var signatureView: SignatureView!
    
    init() {
        signatureView = SignatureView()
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 30) {
            signatureView
        }
    }
}

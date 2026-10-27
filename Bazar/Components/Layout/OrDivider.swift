//
//  OrDivider.swift
//  Bazar
//
//  Created by Nahid Askerli on 26.10.26.
//

import SwiftUI

struct OrDivider: View {
    var text: String = "Or with"
    var body: some View {
        HStack {
            line
            Text(text)
                .appText(.body14, color: .gray500)
            line
        }
    }
    
    private var line: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(Color.gray200)
    }
}



#Preview {
    OrDivider(text: "Or with")
        .padding()
}

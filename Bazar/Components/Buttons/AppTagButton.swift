//
//  AppTagButton.swift
//  Bazar
//
//  Created by Nahid Askerli on 26.10.26.
//

import SwiftUI

struct AppTagButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .appText(.body14Medium, color: .primary500)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .contentShape(Rectangle())
        }
    }
}

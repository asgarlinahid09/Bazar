//
//  PageIndicator.swift
//  Bazar
//
//  Created by Nahid Askerli on 22.10.26.
//

import SwiftUI

struct PageIndicator: View {
    let totalPages: Int
    let currentPage: Int

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<totalPages, id: \.self) { index in
                let isActive = index == currentPage

                Circle()
                    .fill(isActive ? Color.primary500 : Color.gray200)
                    .frame(width: isActive ? 8 : 4, height: isActive ? 8 : 4)
            }
        }
        .animation(.spring(), value: currentPage)
    }
}

#Preview {
    PageIndicator(totalPages: 3, currentPage: 0)
}

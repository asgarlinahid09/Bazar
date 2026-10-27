//
//  PinCodeField.swift
//  Bazar
//
//  Created by Nahid Askerli on 27.10.26.
//

import SwiftUI


struct PinCodeField: View {
    let code: String
    var length: Int = 4

    var body: some View {
        HStack(spacing: 16) {
            ForEach(0..<length, id: \.self) { index in
                box(at: index)
            }
        }
    }

    private func box(at index: Int) -> some View {
        let isFilled = index < code.count
        let isActive = index == code.count

        return ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray50)

            if isActive {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.primary500, lineWidth: 1)
            }

            if isFilled {
                Circle()
                    .fill(.gray900)
                    .frame(width: 12, height: 12)
            }
        }
        .frame(width: 52, height: 52)
        .animation(.easeInOut(duration: 0.15), value: code.count)
    }
}

#Preview {
    PinCodeField(code: "28")
}

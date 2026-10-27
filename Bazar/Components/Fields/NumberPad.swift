//
//  NumberPad.swift
//  Bazar
//
//  Created by Nahid Askerli on 27.10.26.
//

import SwiftUI


struct NumberPad: View {
    let onDigit: (String) -> Void
    let onDelete: () -> Void

    private let rows: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["", "0", "delete"]
    ]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(row, id: \.self) { key in
                        keyButton(key)
                    }
                }
            }
        }
        .padding(.top, 16)
        .padding(.horizontal, 8)
        .background(Color.primary500.ignoresSafeArea(edges: .bottom))
    }

    @ViewBuilder
    private func keyButton(_ key: String) -> some View {
        switch key {
        case "":
            Color.clear
                .frame(maxWidth: .infinity)
                .frame(height: 64)
        case "delete":
            Button(action: onDelete) {
                Image(systemName: "delete.left")
                    .font(.system(size: 22))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 64)
                    .contentShape(Rectangle())
            }
        default:
            Button {
                onDigit(key)
            } label: {
                Text(key)
                    .font(.openSansBold(24))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 64)
                    .contentShape(Rectangle())
            }
        }
    }
}

#Preview {
    VStack {
        Spacer()
        NumberPad(onDigit: { _ in }, onDelete: {})
    }
}

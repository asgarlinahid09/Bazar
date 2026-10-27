//
//  PasswordRuleRow.swift
//  Bazar
//
//  Created by Nahid Askerli on 27.10.26.
//

import SwiftUI

struct PasswordRuleRow: View {
    let text: String
    let isValid: Bool

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: isValid ? "checkmark" : "xmark")
                .font(.system(size: 11, weight: .bold))
                .foregroundStyle(isValid ? Color.primary300 : Color.error)
                .frame(width: 16, height: 16)

            Text(text)
                .appText(.body14, color: .gray500)
        }
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 8) {
        PasswordRuleRow(text: "Minimum 8 characters", isValid: false)
        PasswordRuleRow(text: "At least 1 number (1-9)", isValid: true)
    }
}

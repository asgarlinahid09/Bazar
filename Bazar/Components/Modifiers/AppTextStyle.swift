//
//  AppTextStyle.swift
//  Bazar
//
//  Created by Nahid Askerli on 23.10.26.
//

import SwiftUI

enum AppTextStyle {
    case h3
    case h6
    case body16
    case body14Medium
    case body14
    
    var font: Font {
        switch self {
        case .h3:
                .openSansBold(24)
        case .h6:
                .openSansBold(16)
        case .body16:
                .robotoRegular(16)
        case .body14Medium:
                .robotoMedium(14)
        case.body14:
                .robotoRegular(14)
        }
    }
    
    var lineSpacing: CGFloat {
        switch self {
        case .h3:
            0
        case .h6:
            0
        case .body16:
            4
        case .body14Medium:
            0
        case .body14:
            0
        }
    }
}


private struct AppTextModifier: ViewModifier {
    var style: AppTextStyle
    var color: Color
    var alignment: TextAlignment
    func body(content: Content) -> some View {
        content
            .font(style.font)
            .foregroundStyle(color)
            .multilineTextAlignment(alignment)
            .lineSpacing(style.lineSpacing)
    }
}


extension View {
    func appText(_ style: AppTextStyle, color: Color, alignment: TextAlignment = .leading) -> some View {
        modifier(
            AppTextModifier(
                style: style,
                color: color,
                alignment: alignment
            )
        )
    }
}

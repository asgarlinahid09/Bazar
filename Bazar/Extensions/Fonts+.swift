//
//  Fonts+.swift
//  Bazar
//
//  Created by Nahid Askerli on 22.10.26.
//

import SwiftUI

extension Font {


    static func robotoRegular(_ size: CGFloat, relativeTo textStyle: Font.TextStyle = .body) -> Font {
        .custom(RobotoFont.regular, size: size, relativeTo: textStyle)
    }

    static func robotoMedium(_ size: CGFloat, relativeTo textStyle: Font.TextStyle = .body) -> Font {
        .custom(RobotoFont.medium, size: size, relativeTo: textStyle)
    }

    static func robotoBold(_ size: CGFloat, relativeTo textStyle: Font.TextStyle = .body) -> Font {
        .custom(RobotoFont.bold, size: size, relativeTo: textStyle)
    }

    

    static func openSansBold(_ size: CGFloat, relativeTo textStyle: Font.TextStyle = .title) -> Font {
        .custom(OpenSansFont.bold, size: size, relativeTo: textStyle)
    }
}

fileprivate enum RobotoFont {
    static let regular = "Roboto-Regular"
    static let medium = "Roboto-Medium"
    static let bold = "Roboto-Bold"
}

fileprivate enum OpenSansFont {
    static let bold = "OpenSans-Bold"
}

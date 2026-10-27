//
//  Image+Fitted.swift
//  Bazar
//
//  Created by Nahid Askerli on 26.10.26.
//

import SwiftUI

extension Image {
    func fitted(maxSize: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(maxWidth: maxSize,maxHeight: maxSize)
    }
}

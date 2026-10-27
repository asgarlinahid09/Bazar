//
//  AppTextField.swift
//  Bazar
//
//  Created by Nahid Askerli on 26.10.26.
//

import SwiftUI

struct AppTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .appText(.body14Medium, color: .gray900)
            
            HStack(spacing: 8) {
                inputField
                    .font(.robotoRegular(16))
                    .foregroundStyle(.gray900)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                if isSecure {
                    Button {
                        isPasswordVisible.toggle()
                    } label: {
                        Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                            .foregroundStyle(.gray400)
                    }
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 48)
            .background(.gray50, in: RoundedRectangle(cornerRadius: 8))
        }
    }
    
    @ViewBuilder
    private var inputField: some View {
        let prompt = Text(placeholder).foregroundStyle(.gray400)
        
        if isSecure && !isPasswordVisible {
            SecureField(title, text: $text, prompt: prompt)
        } else {
            TextField(title, text: $text, prompt: prompt)
        }
    }
}


#Preview {
    @Previewable @State var email = ""
    @Previewable @State var password = ""
    
    VStack(spacing: 16) {
        AppTextField(title: "Email", placeholder: "Your email", text: $email)
        AppTextField(title: "Password", placeholder: "Your password", text: $password, isSecure: true)
    }
    .padding(24)
}

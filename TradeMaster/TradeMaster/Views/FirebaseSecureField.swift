//
//  SecureField.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/29/24.
//

import SwiftUI

struct FirebaseSecureField: View {
    var placeHolder: String
    @Binding var text: String
    @Binding var showPassword: Bool
    
    var body: some View {
        if (showPassword){
            FirebaseTextField(placeHolder: "Enter your password", text: $text)
                .overlay(alignment: .trailing){
                    Button(role:.cancel){
                        showPassword = false
                    } label: {
                        Image(systemName: "eye")
                            .padding()
                            .contentTransition(.symbolEffect)
                    }
                }
        }
        else
        {
            SecureField("Enter your password", text: $text)
                .font(Font.custom("Roboto", size: 16))
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 48)) // Adjusted padding
                //.frame(width: 358) // Remove fixed width constraint
                .background(Color(red: 0.98, green: 0.99, blue: 1))
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(red: 0.80, green: 0.84, blue: 0.91), lineWidth: 0.50)
                )
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .overlay(alignment: .trailing){
                    Button(role:.cancel){
                        showPassword = true
                    } label: {
                        Image(systemName: "eye.slash")
                            .padding()
                            .contentTransition(.symbolEffect)
                    }
                }
        }
    }
}


#Preview {
    FirebaseSecureField(placeHolder: "Password", text: .constant(""), showPassword: .constant(true))
}

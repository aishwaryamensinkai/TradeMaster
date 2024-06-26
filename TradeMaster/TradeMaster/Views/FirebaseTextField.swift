//
//  FirebaseTextField.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/29/24.
//

import SwiftUI

struct FirebaseTextField: View {    
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager

    var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeHolder, text: $text)
            .font(Font.custom("Roboto", size: 16))
            .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
//            .frame(width: 358)
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color(red: 0.80, green: 0.84, blue: 0.91), lineWidth: 0.50)
            )
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .frame(maxWidth: .infinity) // Adjust the TextField's width to fill the available space
            .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
            .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration

    }
}

#Preview {
    FirebaseTextField(placeHolder: "placeholder", text: .constant("")).environmentObject(ThemeManager()) // Provide the theme manager
}

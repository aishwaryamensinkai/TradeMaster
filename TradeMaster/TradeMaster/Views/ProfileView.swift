//
//  ProfileView.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/4/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = UserDetailsModel()
    @State private var isEditing = false

    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading, spacing: 20) {
                Button(action: {
                    // Action for going back
                    let themeManager = ThemeManager() // Create an instance of ThemeManager
                    navigateToMainPage(themeManager: themeManager)
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.title)
                }
                Text("Your Profile")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.blue)
                
                Divider() // Add a divider for visual separation
                
                ProfileField(title: "Full Name", value: $viewModel.fullname, isEditing: $isEditing, icon: "person")
                ProfileField(title: "Username", value: $viewModel.username, isEditing: $isEditing, icon: "person")
                ProfileField(title: "Mobile No", value: $viewModel.phoneno, isEditing: $isEditing, icon: "phone")
                ProfileField(title: "Email", value: $viewModel.email, isEditing: $isEditing, icon: "envelope")
                ProfileField(title: "Address", value: $viewModel.addressline, isEditing: $isEditing, icon: "house")
                ProfileField(title: "City", value: $viewModel.city, isEditing: $isEditing, icon: "house")
                ProfileField(title: "Postcode", value: $viewModel.postcode, isEditing: $isEditing, icon: "house")
                ProfileField(title: "Country", value: $viewModel.country, isEditing: $isEditing, icon: "house")
                
                Spacer() // Pushes the button to the bottom
                
                Button(action: {
                    isEditing.toggle()
                    viewModel.updateUserData()
                }) {
                    Text(isEditing ? "Save" : "Edit")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 30)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .onAppear {
                viewModel.fetchUserData()
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true) // Hide the navigation bar
            
        }
    }
}

struct ProfileField: View {
    var title: String
    @Binding var value: String
    @Binding var isEditing: Bool
    var icon: String

    var body: some View {
        HStack(spacing: 15) { // Add spacing between icon, title, and value
            Image(systemName: icon)
                .foregroundColor(.blue)
                .font(.title)
            
            VStack(alignment: .leading, spacing: 4) { // Align text vertically
                Text(title)
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                
                if isEditing {
                    TextField("Enter your \(title.lowercased())", text: $value)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                } else {
                    Text(value)
                        .font(.title3)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer() // Add spacer to push content to the leading edge
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

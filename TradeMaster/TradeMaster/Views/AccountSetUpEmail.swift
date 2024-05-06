//
//  AccountSetUpEmail.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import SwiftUI
import FirebaseFirestore


struct AccountSetUpEmail: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    @StateObject private var viewModel = UserDetailsModel()
    var message : String = ""
    @State private var showAlert = false // State variable to control the presentation of the alert
    @State private var alertMessage = "" // State variable to hold the message for the alert
    @State private var selectedDate = Date() // State variable to hold the selected date
    @State private var isShowingAlert = false
    

    var body: some View {
        ScrollView{
            
            VStack(spacing: 20) {
                Spacer().frame(height:  50)

                Text("Add your personal info")
                    .font(.custom("Roboto", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(themeManager.currentTheme.sunTextColor)
                    .padding(.bottom, 10)
                Text("This info needs to be accurate with you ID document.")
                    .font(Font.custom("Roboto", size: 15))
                    .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
                    .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
                // Full Name
                VStack(alignment: .leading, spacing: 4) {
                    Text("Full Name")
                        .font(.custom("Roboto", size: 16))
                        .foregroundColor(themeManager.currentTheme.sunTextColor)
                    FirebaseTextField(placeHolder: "Enter your full name", text: $viewModel.fullname)
                }
                
                // Username and Date Of Birth
                HStack {
                    // Username
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Username")
                            .font(.custom("Roboto", size: 16))
                            .foregroundColor(themeManager.currentTheme.sunTextColor)
                        FirebaseTextField(placeHolder: "@username", text: $viewModel.username)
                    }
                    
                    // Date Of Birth
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Date Of Birth")
                            .font(.custom("Roboto", size: 16))
                            .foregroundColor(themeManager.currentTheme.sunTextColor)
                        DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                            .font(.custom("Roboto", size: 16))
                            .labelsHidden()
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .cornerRadius(4)
                            .foregroundColor(themeManager.currentTheme.sunTextColor)
                    }
                }
                
                // Mobile No
                VStack(alignment: .leading, spacing: 4) {
                    Text("Mobile No")
                        .font(.custom("Roboto", size: 16))
                        .foregroundColor(themeManager.currentTheme.sunTextColor)
                    FirebaseTextField(placeHolder: "3158636516", text: $viewModel.phoneno)
                    
                }
                
                // Email
                VStack(alignment: .leading, spacing: 4) {
                    Text("Email")
                        .font(.custom("Roboto", size: 16))
                        .foregroundColor(themeManager.currentTheme.sunTextColor)
                    FirebaseTextField(placeHolder: "Ex: email@example.com", text: $viewModel.email)
                }
                
                // Address
                VStack(alignment: .leading, spacing: 4) {
                    Text("Address")
                        .font(.custom("Roboto", size: 16))
                        .foregroundColor(themeManager.currentTheme.sunTextColor)
                    FirebaseTextField(placeHolder: "House number and street name", text: $viewModel.addressline)
                    FirebaseTextField(placeHolder: "City, Street", text: $viewModel.city)
                    FirebaseTextField(placeHolder: "13210", text: $viewModel.postcode)
                    FirebaseTextField(placeHolder: "Country", text: $viewModel.country)
                }
                
                // Continue Button
                Button(action: {
                    // Check if all fields are filled
                    if viewModel.fullname.isEmpty || viewModel.username.isEmpty || viewModel.phoneno.isEmpty || viewModel.email.isEmpty || viewModel.addressline.isEmpty || viewModel.city.isEmpty || viewModel.postcode.isEmpty || viewModel.country.isEmpty {
                        // Show an alert or provide feedback to the user that all fields are required
                        alertMessage = "Please fill in all fields."
                        TradeMaster.showAlert(message: alertMessage)
                    }else if !isValidMobileNumber(viewModel.phoneno) {
                        // Show an alert or provide feedback to the user that the mobile number format is incorrect
                        alertMessage = "Please enter a valid mobile number (10 digits only)."
                        TradeMaster.showAlert(message: alertMessage)
                    }else if !isValidEmail(viewModel.email) {
                        // Show an alert or provide feedback to the user that the email format is incorrect
                        alertMessage = "Please enter a valid email address."
                        TradeMaster.showAlert(message: alertMessage)
                    }else if !isValidPostcode(viewModel.postcode) {
                        // Show an alert or provide feedback to the user that the postcode format is incorrect
                        alertMessage = "Please enter a valid postcode (5 digits only)."
                        TradeMaster.showAlert(message: alertMessage)
                    }else if !isUserAdult(selectedDate: selectedDate) {
                        // Show an alert or provide feedback to the user that they must be 18 or older
                        alertMessage = "You must be 18 years or older to proceed."
                        TradeMaster.showAlert(message: alertMessage)
                    }  else {
                        // Perform action to store user details when Continue button is tapped
                        viewModel.storeUserDetailsInFirestore(viewModel: viewModel, selectedDate: selectedDate,themeManager: themeManager)
                    }
                })
                {
                    HStack(spacing: 8) {
                        Text("Continue")
                            .font(Font.custom("Roboto", size: 20).weight(.medium))
                            .tracking(0.10)
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.96))
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                }
                .frame(width: 358, height: 40)
                .background(Color(red: 0.07, green: 0.32, blue: 0.45))
                .cornerRadius(4)
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(themeManager.currentTheme.sunBackgroundColor)
            .foregroundColor(themeManager.currentTheme.sunTextColor)
            .background(Color.white)
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
    
    // Function to validate email format using regular expression
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    // Function to validate mobile number format
    private func isValidMobileNumber(_ mobileNumber: String) -> Bool {
        // Check if the mobile number contains only digits and has a length of 10
        let digitSet = CharacterSet.decimalDigits
        return mobileNumber.count == 10 && mobileNumber.rangeOfCharacter(from: digitSet.inverted) == nil
    }
    
    // Function to validate postcode format
    private func isValidPostcode(_ postcode: String) -> Bool {
        // Check if the postcode contains only digits and has a length of 5
        let digitSet = CharacterSet.decimalDigits
        return postcode.count == 5 && postcode.rangeOfCharacter(from: digitSet.inverted) == nil
    }
    
    // Function to check if the user is 18 years or older
    private func isUserAdult(selectedDate: Date) -> Bool {
        let calendar = Calendar.current
        let currentDate = Date()
        if let age = calendar.dateComponents([.year], from: selectedDate, to: currentDate).year {
            return age >= 18
        }
        return false
    }
}

#if DEBUG
struct AccountSetUpEmail_Previews: PreviewProvider {
    static var previews: some View {
        AccountSetUpEmail().environmentObject(ThemeManager())
    }
}
#endif

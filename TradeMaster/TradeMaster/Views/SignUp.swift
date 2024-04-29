//
//  SignUp.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/27/24.
//

import SwiftUI

struct SignUp: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isChecked: Bool = false
    
    func toggleCheckbox() {
        isChecked.toggle() // Toggle the checkbox state
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 50) {
                Button(action: {
                    navigateBack()
                }) {
                    Image(systemName: "arrow.left")
                        .font(Font.custom("Roboto", size: 20).weight(.medium))
                        .tracking(0.15)
                        .lineSpacing(20)
                        .foregroundColor(Color(red: 0.07, green: 0.32, blue: 0.45))
                }
                .padding(.horizontal, 16) // Adjusted horizontal padding
                .frame(maxWidth: .infinity, alignment: .leading) // Align to the leading edge
                
                HStack(alignment: .top, spacing: 0) {
                    Button(action: {
                        // Action for Sign Up button
                    }) {
                        Text("Sign In")
                            .font(Font.custom("Roboto", size: 16).weight(.medium))
                            .tracking(0.15)
                            .lineSpacing(20)
                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                    }
                    .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                    .frame(minWidth: 150, idealWidth: 200, maxWidth: .infinity, minHeight: 36, maxHeight: 36)
                    .background(Color(red: 0.80, green: 0.84, blue: 0.91))
                    .cornerRadius(2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color(red: 0.80, green: 0.84, blue: 0.91), lineWidth: 0.50)
                    )
                    Button(action: {
                        // Action for Sign In button
                    }) {
                        Text("Sign Up")
                            .font(Font.custom("Roboto", size: 16).weight(.medium))
                            .tracking(0.15)
                            .lineSpacing(20)
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                    .frame(minWidth: 150, idealWidth: 200, maxWidth: .infinity, minHeight: 36, maxHeight: 36)
                    .background(Color(red: 0.07, green: 0.32, blue: 0.45))
                    .cornerRadius(2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color(red: 0.07, green: 0.32, blue: 0.45), lineWidth: 0.50)
                    )
                }
                .frame(width: 366, height: 44)
                .background(Color(red: 0.96, green: 0.97, blue: 0.99))
                .cornerRadius(4)
                
              Text("Sign Up")
                .font(Font.custom("Roboto", size: 24).weight(.medium))
                .lineSpacing(32)
                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                
              VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .top, spacing: 135) {
                  Text("Email")
                    .font(Font.custom("Roboto", size: 12))
                    .tracking(0.40)
                    .lineSpacing(16)
                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                    .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                    .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                    
                    Button(action: {
                        // Action when the "Sign In with Phone Number" is clicked
                        navigateToNumber()
                    }) {
                        Text("Sign Up with Phone Number")
                            .font(Font.custom("Roboto", size: 14))
                            .tracking(0.40)
                            .lineSpacing(16)
                            .foregroundColor(Color(red: 0.07, green: 0.32, blue: 0.45))
                    }
                    .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to remove default button styling
                }
                  
                TextField("Enter your email", text: $email)
                      .font(Font.custom("Roboto", size: 16))
                      .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                      .frame(width: 358)
                      .background(Color(red: 0.98, green: 0.99, blue: 1))
                      .cornerRadius(4)
                      .overlay(
                          RoundedRectangle(cornerRadius: 4)
                              .stroke(Color(red: 0.80, green: 0.84, blue: 0.91), lineWidth: 0.50)
                      )

              }
              VStack(alignment: .leading, spacing: 4) {
                Text("Password")
                  .font(Font.custom("Roboto", size: 14))
                  .tracking(0.40)
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                  .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                  .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                  
                  SecureField("Enter your password", text: $password)
                      .font(Font.custom("Roboto", size: 16))
                      .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 48)) // Adjusted padding
                      .frame(width: 358)
                      .background(Color(red: 0.98, green: 0.99, blue: 1))
                      .cornerRadius(4)
                      .overlay(
                          RoundedRectangle(cornerRadius: 4)
                              .stroke(Color(red: 0.80, green: 0.84, blue: 0.91), lineWidth: 0.50)
                      )

                  Spacer()
                  
                  HStack(spacing: 0) {
                      Button(action: {
                          // Action to toggle the checkbox state
                          toggleCheckbox()
                      }) {
                          Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(width: 18, height: 18)
                              .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                      }
                      .padding(EdgeInsets(top: 7, leading: 0, bottom: 7, trailing: 7))
                      
                      Text("I agree to the terms & policy")
                          .font(Font.custom("Roboto", size: 14))
                          .tracking(0.25)
                          .lineSpacing(20)
                          .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                  }


              }
                
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    HStack(spacing: 8) {
                        Text("Sign Up")
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

                
                HStack(spacing: 16) {
                  VStack(alignment: .leading, spacing: 8) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 155.50, height: 2)
                      .background(Color(red: 0.80, green: 0.84, blue: 0.91))
                  }
                  .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
                  .frame(maxWidth: .infinity)
                  Text("or")
                    .font(Font.custom("Roboto", size: 16))
                    .tracking(0.20)
                    .lineSpacing(20)
                    .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.83))
                  VStack(alignment: .leading, spacing: 8) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 155.50, height: 2)
                      .background(Color(red: 0.80, green: 0.84, blue: 0.91))
                  }
                  .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
                  .frame(maxWidth: .infinity)
                }
                .frame(width: 358, height: 20)
                
                
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    HStack(spacing: 8) {
                        // Custom Google icon
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(red: 0.95, green: 0.95, blue: 0.96))
                            .frame(width: 24, height: 24)
                            .overlay(
                                Text("G")
                                    .font(Font.system(size: 16).weight(.bold))
                                    .foregroundColor(.blue)
                            )
                        
                        Text("Sign in with Google")
                            .font(Font.custom("Roboto", size: 16).weight(.medium))
                            .tracking(0.15)
                            .lineSpacing(20)
                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 24))
                }
                .frame(width: 358, height: 40)
                .background(Color(red: 0.96, green: 0.97, blue: 0.99))
                .cornerRadius(4)


            }
            .frame(width: 358, height: 220)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
        .background(Color.white)
        .ignoresSafeArea()
    }

    func navigateBack() {
        // Create an instance of the next view
        let RegistrationViewPage = RegistrationView().environmentObject(themeManager)

        // Present the next view using NavigationView
        let nextView = NavigationView {
            RegistrationViewPage
        }

        // Get the relevant window scene
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                // Present the navigation view
                window.rootViewController = UIHostingController(rootView: nextView)
                window.makeKeyAndVisible()
            }
        }
    }

    func navigateToNumber() {
        // Create an instance of the next view
        let SignUpNumberViewPage = SignUpNumber().environmentObject(themeManager)

        // Present the next view using NavigationView
        let nextView = NavigationView {
            SignUpNumberViewPage
        }

        // Get the relevant window scene
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                // Present the navigation view
                window.rootViewController = UIHostingController(rootView: nextView)
                window.makeKeyAndVisible()
            }
        }
    }

}

#if DEBUG
struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif

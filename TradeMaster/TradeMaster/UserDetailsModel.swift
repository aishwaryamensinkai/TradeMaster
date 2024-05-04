//
//  UserDetailsModel.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

@MainActor
final class UserDetailsModel: ObservableObject{
    @Published var fullname = ""
    @Published var username = ""
    @Published var dob = ""
    @Published var addressline = ""
    @Published var city = ""
    @Published var postcode = ""
    @Published var country = ""
    @Published var email = ""
    @Published var phoneno = ""
    
    // Function to store passcode in Firestore
    func storePasscodeInFirestore(passcode: String, themeManager: ThemeManager) {
        // Get the current user
        guard let currentUser = Auth.auth().currentUser else {
            print("No user logged in")
            return
        }
        Task{
            do{
                // Reference to Firestore collection for users
                let usersCollection = Firestore.firestore().collection("users")
                // Document reference for the current user
                let userDocument = usersCollection.document(currentUser.uid)
                // Update the document with the passcode
                userDocument.setData(["passcode": passcode], merge: true) { error in
                    if let error = error {
                        print("Error updating document: \(error)")
                    } else {
                        print("Passcode stored successfully")
                    }
                }
                navigateToAccountSetUpEmail(themeManager: themeManager)
            }
            catch{
                TradeMaster.showAlert(message: "Passcode save failed.")
            }
        }
    }
    
    // Function to store user details in Firestore
    func storeUserDetailsInFirestore(viewModel: UserDetailsModel, selectedDate: Date, themeManager: ThemeManager) {
        // Get the current user
        guard let currentUser = Auth.auth().currentUser else {
            print("No user logged in")
            return
        }
        Task{
            do{
                // Reference to Firestore collection for users
                let usersCollection = Firestore.firestore().collection("users")
                
                // Document reference for the current user
                let userDocument = usersCollection.document(currentUser.uid)
                
                // Format the date of birth
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd" // Set the desired date format
                let formattedDateOfBirth = dateFormatter.string(from: selectedDate)
                
                // Update the document with user details
                userDocument.setData([
                    "fullname": viewModel.fullname,
                    "username": viewModel.username,
                    "dateOfBirth": formattedDateOfBirth,
                    "phoneno": viewModel.phoneno,
                    "email": viewModel.email,
                    "addressline": viewModel.addressline,
                    "city": viewModel.city,
                    "postcode": viewModel.postcode,
                    "country": viewModel.country
                ], merge: true) { error in
                    if let error = error {
                        print("Error updating document: \(error)")
                    } else {
                        print("User details stored successfully")
                    }
                }
                navigateToAccountVerify1(themeManager: themeManager)
            }
            catch{
                TradeMaster.showAlert(message: "Details save failed.")
            }
        }
    }
    private var db = Firestore.firestore()

       func fetchUserData() {
           guard let currentUserID = Auth.auth().currentUser?.uid else { return }
           db.collection("users").document(currentUserID).getDocument { (document, error) in
               if let document = document, document.exists {
                   if let data = document.data() {
                       self.fullname = data["fullname"] as? String ?? ""
                       self.username = data["username"] as? String ?? ""
                       self.phoneno = data["phoneno"] as? String ?? ""
                       self.email = data["email"] as? String ?? ""
                       self.addressline = data["addressline"] as? String ?? ""
                       self.city = data["city"] as? String ?? ""
                       self.postcode = data["postcode"] as? String ?? ""
                       self.country = data["country"] as? String ?? ""
                   }
               } else {
                   print("User document does not exist")
               }
           }
       }
    
    func updateUserData() {
            guard let currentUserID = Auth.auth().currentUser?.uid else { return }
            let userData: [String: Any] = [
                "fullname": fullname,
                "username": username,
                "phoneno": phoneno,
                "email": email,
                "addressline": addressline,
                "city": city,
                "postcode": postcode,
                "country": country,
            ]

            db.collection("users").document(currentUserID).setData(userData, merge: true) { error in
                if let error = error {
                    print("Error updating user data: \(error.localizedDescription)")
                } else {
                    print("User data updated successfully")
                }
            }
        }
    
    
    }

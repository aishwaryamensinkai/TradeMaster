//
//  CardModel.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

@MainActor
final class CardModel: ObservableObject{
    @Published var cardno = ""
    @Published var name = ""
    @Published var mmyy = ""
    @Published var cvv = ""
    
    // Function to store card details in Firestore
    func storeCardDetailsInFirestore(viewModel: CardModel, themeManager: ThemeManager) {
        // Get the current user
        guard let currentUser = Auth.auth().currentUser else {
            print("No user logged in")
            return
        }
        do {
            // Reference to Firestore collection for users
            let usersCollection = Firestore.firestore().collection("users")
            
            // Document reference for the current user
            let userDocument = usersCollection.document(currentUser.uid)
            
            // Generate a unique ID for the card document
            let cardId = UUID().uuidString
            
            // Update the document with card details
            userDocument.collection("cards").document(cardId).setData([
                "cardNumber": viewModel.cardno,
                "nameOnCard": viewModel.name,
                "expirationDate": viewModel.mmyy,
                "cvv": viewModel.cvv
            ]) { error in
                if let error = error {
                    print("Error updating document: \(error)")
                    // Handle error, perhaps show an alert
                    TradeMaster.showAlert(message: "Card details save failed.")
                } else {
                    print("Card details stored successfully")
                    // Optionally, you can navigate to another view or perform any other action
                    navigateToCardlListView(themeManager: themeManager)
                }
            }
        } catch {
            print("Error: \(error.localizedDescription)")
            // Handle error, perhaps show an alert
            TradeMaster.showAlert(message: "Card details save failed.")
        }
    }

    // Function to fetch cards of logged-in user from Firestore
    func fetchUserCards(completion: @escaping ([Card]) -> Void) {
        // Get the current user
        guard let currentUser = Auth.auth().currentUser else {
            print("No user logged in")
            completion([])
            return
        }

        // Reference to Firestore collection for users
        let usersCollection = Firestore.firestore().collection("users")

        // Document reference for the current user
        let userDocument = usersCollection.document(currentUser.uid)

        // Query the "cards" subcollection for the user's cards
        userDocument.collection("cards").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting user cards: \(error)")
                completion([])
            } else if let documents = querySnapshot?.documents {
                // Parse the card documents into Card objects
                let cards = documents.compactMap { queryDocumentSnapshot -> Card? in
                    let data = queryDocumentSnapshot.data()
                    guard let cardNumber = data["cardNumber"] as? String,
                          let nameOnCard = data["nameOnCard"] as? String,
                          let expirationDate = data["expirationDate"] as? String,
                          let cvv = data["cvv"] as? String else {
                        return nil
                    }
                    return Card(cardNumber: cardNumber, nameOnCard: nameOnCard, expirationDate: expirationDate, cvv: cvv)
                }
                completion(cards)
            } else {
                // No documents found
                completion([])
            }
        }
    }

}

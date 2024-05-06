//
//  AccountVerification2.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import SwiftUI
import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

struct AccountVerification2: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    @State private var selectedImage: UIImage? // State variable to hold the selected image
    @State private var isImagePickerPresented = false // State variable to present the image picker
    @State private var profileImageURL: URL? // State variable to hold the profile image URL

    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 400)
            } else if let imageURL = profileImageURL {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 400)
                } placeholder: {
                    // You can use a placeholder image here if needed
                    ProgressView()
                }
            } else {
                Image("photoverification")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 400)
            }
            
            Text("Take selfie to verify\nyour identity")
                           .font(Font.custom("Roboto", size: 36).weight(.bold))
                           .tracking(0.08)
                           .multilineTextAlignment(.center)
                           .foregroundColor(themeManager.currentTheme.sunTextColor)
                           .background(themeManager.currentTheme.sunBackgroundColor)
                       
            Text("Quick and easy identification verification using\nyour phone’s camera. Confirm your identity with a\nself-captured photo.")
                           .font(Font.custom("Roboto", size: 16).weight(.bold))
                           .tracking(0.08)
                           .multilineTextAlignment(.center)
                           .foregroundColor(themeManager.currentTheme.sunTextColor)
                           .background(themeManager.currentTheme.sunBackgroundColor)
            
            Spacer().frame(height: 40)
            
            Button(action: {
                            // Present image picker when the button is tapped
                            isImagePickerPresented = true
            }) {
                VStack(spacing: 4) {
                    HStack(spacing: 0) {
                        ZStack() {
                            ZStack() { }
                                .frame(width: 19.50, height: 17.25)
                                .offset(x: 0, y: -0.38)
                            Image(systemName: "camera.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }
                        .frame(width: 24, height: 24)
                    }
                    .padding(12)
                    .background(Color(red: 0.07, green: 0.32, blue: 0.45))
                    .cornerRadius(4)
                    Text("Take a selfie")
                        .font(Font.custom("Roboto", size: 14).weight(.medium))
                        .tracking(0.10)
                        .lineSpacing(20)
                        .foregroundColor(themeManager.currentTheme.sunTextColor)
                        .background(themeManager.currentTheme.sunBackgroundColor)
                }
                .frame(width: 80, height: 72)
            }

            Spacer().frame(height: 40)
            
            Button(action: {
                // Action when the button is tapped
                navigateToAccountVerify4(themeManager: themeManager)
            }) {
                Text("Next")
                    .font(Font.custom("Roboto", size: 28).weight(.black))
                    .tracking(0.10)
                    .lineSpacing(24)
                    .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.96))
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            }
            .frame(width: 358, height: 40)
            .background(Color(red: 0.07, green: 0.32, blue: 0.45))
            .cornerRadius(4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(themeManager.currentTheme.sunBackgroundColor)
        .foregroundColor(themeManager.currentTheme.sunTextColor)
        .background(Color.white)
        .ignoresSafeArea()
        .sheet(isPresented: $isImagePickerPresented) {
            // Present image picker when isImagePickerPresented is true
            ImagePicker(selectedImage: $selectedImage) { image in
                // Handle image upload here
                uploadImageToFirestore(image: image)
            }
        }
    }

    func uploadImageToFirestore(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let storageRef = Storage.storage().reference()
        let user = Auth.auth().currentUser
        
        guard let userId = user?.uid else { return }
        let profileImageRef = storageRef.child("profile_images/\(userId).jpg")
        
        profileImageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                // Handle error
                print("Error uploading image to Firebase Storage: \(error.localizedDescription)")
                return
            }
            
            // If successful, get download URL and save to Firestore
            profileImageRef.downloadURL { (url, error) in
                if let error = error {
                    // Handle error
                    print("Error getting download URL: \(error.localizedDescription)")
                    return
                }
                
                guard let downloadURL = url else {
                    // Handle error
                    print("Download URL is nil")
                    return
                }
                
                // Save download URL to Firestore
                let db = Firestore.firestore()
                db.collection("users").document(userId).setData(["profileImageUrl": downloadURL.absoluteString], merge: true) { error in
                    if let error = error {
                        // Handle error
                        print("Error updating document: \(error.localizedDescription)")
                    } else {
                        print("Document successfully updated")
                    }
                }
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    var imageSelectedHandler: (UIImage) -> Void // Closure to handle selected image

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = .photoLibrary
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = pickedImage
                parent.imageSelectedHandler(pickedImage) // Call the closure to handle the selected image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


#if DEBUG
struct AccountVerification2_Previews: PreviewProvider {
    static var previews: some View {
        AccountVerification2().environmentObject(ThemeManager())
    }
}
#endif

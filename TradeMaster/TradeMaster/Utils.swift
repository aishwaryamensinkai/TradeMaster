//
//  Utils.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/2/24.
//

import Foundation
import SwiftUI
import UIKit

//newsApiKey = "ed8063f6526648ee8ec4ef0bb9ab7fd4"

final class Utils{
    static let shared = Utils()
    private init(){}

    @MainActor
    class func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

extension View {
    func handleRegistrationSuccess(_ registrationSuccess: Binding<Bool>) -> some View {
        self.onAppear {
            registrationSuccess.wrappedValue = true
        }
    }
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
}


func showAlert(message: String) {
    let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    // Get the top-most view controller to present the alert
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
           if let window = windowScene.windows.first(where: { $0.isKeyWindow }) {
               window.rootViewController?.present(alertController, animated: true, completion: nil)
           }
       }
}


func navigateToSignIn(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = SignIn().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateBack(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = RegistrationView().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToSignUp(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = SignUp().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToWelcome(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = Welcome().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToLoginPinSetup(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = LoginPinSetup().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToAccountSetUpEmail(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = AccountSetUpEmail().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToAccountVerify1(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = AccountVerification1().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}


func navigateToAccountVerify2(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = AccountVerification2().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToAccountVerify3(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = AccountVerification3().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToAccountVerify4(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = AccountVerification4().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToAccountVerify5(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = AccountVerification5().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToScanID(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = ScanID().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToAddingcard(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = AddingCard().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}


func navigateToCardInfo(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = CardInfo().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToCardlListView(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = CardlListView().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToMainPage(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = MainPage().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToProfile(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = ProfileView().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

func navigateToWallet(themeManager: ThemeManager) {
    // Create an instance of the next view
    let view = WalletView().environmentObject(themeManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}


func navigateToNews(newsManager: NewsDownloadManager) {
    // Create an instance of the next view
    let view = NewsSheetView(newsManager: newsManager)
    // Present the next view without NavigationView
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

//
//  Utils.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/2/24.
//

import Foundation
import SwiftUI
import UIKit

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
    let SignInPage = SignIn().environmentObject(themeManager)

    // Present the next view using NavigationView
    let nextView = NavigationView {
        SignInPage
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

func navigateBack(themeManager: ThemeManager) {
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

func navigateToSignInNumber(themeManager: ThemeManager) {
    // Create an instance of the next view
    let SignInNumberViewPage = SignInNumber().environmentObject(themeManager)

    // Present the next view using NavigationView
    let nextView = NavigationView {
        SignInNumberViewPage
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

func navigateToSignUpNumber(themeManager: ThemeManager) {
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

func navigateToSignUp(themeManager: ThemeManager) {
    // Create an instance of the next view
    let SignUpPage = SignUp().environmentObject(themeManager)

    // Present the next view using NavigationView
    let nextView = NavigationView {
        SignUpPage
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

func navigateToWelcome(themeManager: ThemeManager) {
        // Create an instance of the next view
        let welcome = Welcome().environmentObject(themeManager)
        let nextView = NavigationView {
            welcome
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

func navigateToLoginPinSetup(themeManager: ThemeManager) {
        // Create an instance of the next view
        let loginpinSetup = LoginPinSetup().environmentObject(themeManager)
        let nextView = NavigationView {
            loginpinSetup
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

func navigateToAccountSetUpEmail(themeManager: ThemeManager) {
        // Create an instance of the next view
        let acountSetup = AccountSetUpEmail().environmentObject(themeManager)
        let nextView = NavigationView {
            acountSetup
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

func navigateToAccountVerify1(themeManager: ThemeManager) {
        // Create an instance of the next view
        let acountSetup = AccountVerification1().environmentObject(themeManager)
        let nextView = NavigationView {
            acountSetup
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


func navigateToAccountVerify2(themeManager: ThemeManager) {
        // Create an instance of the next view
        let acountSetup = AccountVerification2().environmentObject(themeManager)
        let nextView = NavigationView {
            acountSetup
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




func navigateToAccountVerify3(themeManager: ThemeManager) {
        // Create an instance of the next view
        let acountSetup = AccountVerification3().environmentObject(themeManager)
        let nextView = NavigationView {
            acountSetup
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

func navigateToAccountVerify4(themeManager: ThemeManager) {
        // Create an instance of the next view
        let acountSetup = AccountVerification4().environmentObject(themeManager)
        let nextView = NavigationView {
            acountSetup
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

func navigateToAccountVerify5(themeManager: ThemeManager) {
        // Create an instance of the next view
        let acountSetup = AccountVerification5().environmentObject(themeManager)
        let nextView = NavigationView {
            acountSetup
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

func navigateToScanID(themeManager: ThemeManager) {
        // Create an instance of the next view
        let id = ScanID().environmentObject(themeManager)
        let nextView = NavigationView {
            id
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

func navigateToAddingcard(themeManager: ThemeManager) {
        // Create an instance of the next view
        let acountSetup = AddingCard().environmentObject(themeManager)
        let nextView = NavigationView {
            acountSetup
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


func navigateToCardInfo(themeManager: ThemeManager) {
        // Create an instance of the next view
        let cardinfoSetup = CardInfo().environmentObject(themeManager)
        let nextView = NavigationView {
            cardinfoSetup
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

func navigateToCardlListView(themeManager: ThemeManager) {
        // Create an instance of the next view
        let cardlistSetup = CardlListView().environmentObject(themeManager)
        let nextView = NavigationView {
            cardlistSetup
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

func navigateToMainPage(themeManager: ThemeManager) {
        // Create an instance of the next view
        let mainPageSetup = MainPage().environmentObject(themeManager)
        let nextView = NavigationView {
            mainPageSetup
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

//
//  UIApplication.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/4/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

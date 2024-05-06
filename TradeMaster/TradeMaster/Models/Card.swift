//
//  Card.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let cardNumber: String
    let nameOnCard: String
    let expirationDate: String
    let cvv: String
}

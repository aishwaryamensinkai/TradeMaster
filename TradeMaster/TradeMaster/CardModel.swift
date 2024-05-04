//
//  CardModel.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import Foundation

@MainActor
final class CardModel: ObservableObject{
    @Published var cardno = ""
    @Published var name = ""
    @Published var mmyy = ""
    @Published var cvv = ""
}

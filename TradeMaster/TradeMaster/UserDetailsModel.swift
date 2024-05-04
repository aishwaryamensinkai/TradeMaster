//
//  UserDetailsModel.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import Foundation

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
}

//
//  String.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/4/24.
//

import Foundation

extension String {
    var removingHTMLOccurancies: String {
        return self.replacingOccurrences(of: "<[ˆ>]+>", with: "", options: .regularExpression, range: nil)
    }
}

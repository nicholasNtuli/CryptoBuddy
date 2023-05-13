//
//  String.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/05/13.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}

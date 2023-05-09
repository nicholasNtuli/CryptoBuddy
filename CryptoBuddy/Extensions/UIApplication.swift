//
//  UIApplication.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/05/09.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

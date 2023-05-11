//
//  HapticManger.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/05/11.
//

import Foundation
import SwiftUI

class HapticManger {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}

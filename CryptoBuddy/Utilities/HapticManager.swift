//
//  HapticManager.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/05/11.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}

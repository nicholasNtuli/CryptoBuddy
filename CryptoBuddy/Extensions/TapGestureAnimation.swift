//
//  TapGestureAnimation.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/04/24.
//

import SwiftUI

extension View {
    func onTapWithAnimation(_ animation: Optional<Animation>, _ action: @escaping () -> Void) -> some View {
        return self.onTapGesture {
            withAnimation(animation) {
                action()
            }
        }
    }
}

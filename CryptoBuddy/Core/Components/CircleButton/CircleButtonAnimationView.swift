//
//  CircelButtonAnimationView.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/04/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .onTapWithAnimation(animate ? Animation.easeOut(duration: 1.0) : .none, {})
    }
}

struct CircelButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
            .foregroundColor(.red)
            .frame(width: 100,height: 100)
    }
}

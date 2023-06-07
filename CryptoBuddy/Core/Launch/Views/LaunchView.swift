//
//  LaunchView.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/06/06.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: String = "Loading your portfolio..."
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {
                Text(loadingText)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.launch.accent)
            }
            .offset(y: 70)
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}

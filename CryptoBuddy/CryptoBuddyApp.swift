//
//  CryptoBuddyApp.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/04/24.
//

import SwiftUI

@main
struct CryptoBuddyApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}

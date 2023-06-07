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
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationStack {
                    HomeView()
                        .navigationBarHidden(true)
                }
                .environmentObject(vm)
                
                LaunchView()
            }
        }
    }
}

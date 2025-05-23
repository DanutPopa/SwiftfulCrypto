//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Danut Popa on 22.04.2025.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .environmentObject(viewModel)
        }
    }
}

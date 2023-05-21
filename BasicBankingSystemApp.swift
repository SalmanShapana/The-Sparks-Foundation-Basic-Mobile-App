//
//  BasicBankingSystemApp.swift
//  BasicBankingSystem
//
//  Created by Salman Shapana on 17/05/2023.
//

import SwiftUI

@main
struct BasicBankingSystemApp: App {
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

//
//  ContentView.swift
//  BasicBankingSystem
//
//  Created by Salman Shapana on 17/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            CustomersListView()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ViewModel.swift
//  BasicBankingSystem
//
//  Created by Salman Shapana on 17/05/2023.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    @Published var customers: [Customer] = []
    @Published var histories: [History] = []

    static private let customersData = ["Robert Pattinson": 10.0, "Romain Dauriac": 20.0, "Ryan Reynolds": 30.0, "Quinn Patel": 40.0, "Christian Bale": 50.0, "Elena Saurel": 60.0, "Frank Lampard": 70.0, "Douglas Costa": 80.0, "Cristiano Ronaldo": 90.0, "scarlett johansson": 10.0]

    static private let colors: [Color] = [.red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .pink, .brown, .gray]

    
    
    
    
    
    init() {
        for data in Self.customersData {
            let color = Self.colors.randomElement()

            customers.append(Customer(
                name: data.key,
                email: data.key.filter({$0 != " "}).lowercased() + "@icloud.com",
                colors: [color!, color!.opacity(1)],
                balance: data.value)
            )
        }
    }

    func transfer(customer: Customer, amount: Double) {
        if amount != 0 {
            if let index = customers.firstIndex(where: { $0.name == customer.name}) {
                customers[index].balance += amount
            }

            histories.insert(History(date: Date.now, description: "Trasfered $\(amount) to \(customer.name)."), at: 0)
        }
    }
}

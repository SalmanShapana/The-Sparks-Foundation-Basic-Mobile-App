//
//  CustomersListView.swift
//  BasicBankingSystem
//
//  Created by Salman Shapana on 17/05/2023.
//

import SwiftUI

struct CustomersListView: View {

    @EnvironmentObject var viewModel: ViewModel

    @State private var showingHistoriesView = false
    @State private var customerToDelete: Int?

    let iconColors: [Color] = [
        Color(red: 0.9, green: 0.3, blue: 0.4),
        Color(red: 0.4, green: 0.6, blue: 0.9),
        Color(red: 0.2, green: 0.8, blue: 0.7),
        Color(red: 0.7, green: 0.5, blue: 0.1),
        Color(red: 0.6, green: 0.2, blue: 0.8)
    ]

    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Users")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.7))
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(viewModel.customers.indices, id: \.self) { index in
                            let customer = viewModel.customers[index]
                            let initials = getInitials(from: customer.name)
                            
                            NavigationLink(destination: CustomerDetailsView(customer: customer)) {
                                HStack(spacing: 20) {
                                    Circle()
                                        .foregroundColor(iconColors[index % iconColors.count])
                                        .frame(width: 60, height: 60)
                                        .overlay(
                                            Text(initials)
                                                .font(.system(size: 30))
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        )
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(customer.name)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.primary)
                                        
                                        Text(customer.email)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("$\(customer.balance, specifier: "%.2f")")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.green)
                                    
                                    Button(action: {
                                        customerToDelete = index
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                    }
                                    .buttonStyle(BorderlessButtonStyle())
                                }
                                .padding()
                                .background(Color("CardBackground"))
                                .cornerRadius(20)
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                            }
                        }
                    }
                    .padding()
                }
                
                Button(action: {
                    showingHistoriesView.toggle()
                }) {
                    Image(systemName: "clock")
                        .font(.title)
                        .padding(15)
                        .background(Color("ButtonBackground"))
                        .foregroundColor(.black)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                }
                .sheet(isPresented: $showingHistoriesView) {
                    HistoriesView()
                }
            }
        }
        .statusBar(hidden: true)
        .onChange(of: customerToDelete) { index in
            if let index = index {
                viewModel.customers.remove(at: index)
                customerToDelete = nil
            }
        }
    }
    
    func getInitials(from name: String) -> String {
        let nameComponents = name.split(separator: " ")
        var initials = ""
        for component in nameComponents {
            if let firstCharacter = component.first {
                initials.append(String(firstCharacter))
            }
        }
        return initials
    }
}

struct CustomersListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomersListView()
                .environmentObject(ViewModel())
        }
    }
}

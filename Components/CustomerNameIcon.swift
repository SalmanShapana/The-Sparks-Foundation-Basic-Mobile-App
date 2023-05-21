//
//  CustomerNameIcon.swift
//  BasicBankingSystem
//
//  Created by Salman Shapana on 17/05/2023.
//

import SwiftUI

struct CustomerNameIcon: View {
    let customer: Customer

    var body: some View {
        Text(customer.nameIcon)
            .font(.title)
            .fontWeight(.bold)
            .frame(width: 60, height: 60, alignment: .center)
            .foregroundColor(.white)
            .background(LinearGradient(colors: customer.colors, startPoint: .bottom, endPoint: .top))
            .clipShape(Circle())
    }
}

struct CustomerNameIcon_Previews: PreviewProvider {
    static var previews: some View {
        CustomerNameIcon(customer: Customer(
            name: "Salman Shapana",
            email: "salmanshapana6@gmail.com",
            colors: [.blue, .blue.opacity(0.5)],
            balance: 60.0))
            .previewLayout(.sizeThatFits)
    }
}

import SwiftUI

struct CustomerDetailsView: View {
    let customer: Customer

    @State private var showingTransferAmountView = false

    var body: some View {
        VStack(spacing: 20) {
            CustomerNameIcon(customer: customer)
                .frame(width: 120, height: 120)
                .background(
                    Circle()
                        .fill(LinearGradient(colors: customer.colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                )
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 3)
                )
                .padding(.top, 50)

            VStack(spacing: 10) {
                Text(customer.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white) // Set the text color to white

                Text(customer.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 30)

            VStack(spacing: 10) {
                Text("Balance")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)

                Text("$\(customer.balance, specifier: "%.2f")")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            )

            Button(action: {
                showingTransferAmountView.toggle()
            }) {
                Text("Transfer Money")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(colors: customer.colors, startPoint: .topLeading, endPoint: .bottomTrailing)) // Set the background color using the customer's colors
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    )
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.horizontal)
        .sheet(isPresented: $showingTransferAmountView) {
            TransferAmountView(customer: customer)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CustomerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerDetailsView(customer: Customer(
            name: "Salman Shapana",
            email: "salmanshapana6@gmail.com",
            colors: [.green, .blue.opacity(0.5)],
            balance: 83920.0))
    }
}

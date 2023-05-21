import SwiftUI

struct TransferAmountView: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var viewModel: ViewModel

    @State private var transferAmount: Double = 0.0

    let customer: Customer

    @FocusState private var transferAmountIsFocused: Bool

    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()

                Text("Transfer Amount")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                TextField("Enter Amount", value: $transferAmount, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .focused($transferAmountIsFocused)
                    .padding(.horizontal)
                    .foregroundColor(.black)

                Spacer()

                Button(action: {
                    viewModel.transfer(customer: customer, amount: transferAmount)
                    dismiss()
                }) {
                    Text("Transfer")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                        )
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Transfer Amount")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                }
            }
        }
    }
}

struct TransferAmountView_Previews: PreviewProvider {
    static var previews: some View {
        TransferAmountView(customer: Customer(
            name: "Salman Shapana",
            email: "salmanshapana6@gmail.com",
            colors: [.yellow, .yellow.opacity(0.5)],
            balance: 60.0))
            .environmentObject(ViewModel())
    }
}

//
//  HistoriesView.swift
//  BasicBankingSystem
//
//  Created by Salman Shapana on 17/05/2023.
//

import SwiftUI

struct HistoriesView: View {
    @EnvironmentObject var viewModel: ViewModel

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.histories, id: \.self) { history in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(history.description)
                            .font(.title)
                            .foregroundColor(.primary)
                        Text(history.date.formatted())
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    }
                    .padding(10)
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Transfers Table")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                    }

                }
            }
        }
        .accentColor(.blue) // Set a modern accent color
    }
}

struct HistoriesView_Previews: PreviewProvider {
    static var previews: some View {
        HistoriesView()
            .environmentObject(ViewModel())
    }
}

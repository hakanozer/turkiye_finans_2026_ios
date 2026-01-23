//
//  CityListView.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 23.01.2026.
//

import SwiftUI
import UIKit

struct CityListView: View {
    @StateObject var viewModel: CityListViewModel
    @State private var newCityName: String = ""

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 8) {
                TextField("Şehir adı", text: $newCityName)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.words)
                Button("Ekle", action: {
                    let trimmed = newCityName.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !trimmed.isEmpty else { return }

                    // Create a minimal City instance. Adjust initializer if your City type differs.
                    let nextPlate = (viewModel.cities.map { $0.plateCode }.max() ?? 0) + 1
                    let newCity = City(name: trimmed, plateCode: nextPlate)
                    viewModel.cities.append(newCity)
                    newCityName = ""
                })
                .buttonStyle(.borderedProminent)
                .disabled(newCityName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .padding(.horizontal)

            if !newCityName.isEmpty {
                HStack {
                    Text("Girilen şehir adı: ")
                        .foregroundStyle(.secondary)
                    Text(newCityName)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }

            List(viewModel.cities) { city in
                NavigationLink(destination: CityDetailView(city: city)) {
                    HStack {
                        Text(city.name)
                            .font(.headline)
                        Spacer()
                        Text("\(city.plateCode)")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .navigationTitle("İller")
    }
}


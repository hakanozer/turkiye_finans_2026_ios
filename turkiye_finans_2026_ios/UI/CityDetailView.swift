//
//  CityDetailView.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 23.01.2026.
//

import SwiftUI

struct CityDetailView: View {
    let city: City
    
    var body: some View {
        VStack(spacing: 16) {
            Text(city.name)
                .font(.largeTitle)
                .bold()
            
            Text("Plaka Kodu: \(city.plateCode)")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detay")
    }
}

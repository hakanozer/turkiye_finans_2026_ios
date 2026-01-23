//
//  CityListViewModel.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 23.01.2026.
//

import Foundation
import Combine

final class CityListViewModel: ObservableObject {
    @Published var cities: [City] = []
    
    private let service: CityServiceProtocol
    
    init(service: CityServiceProtocol = CityService()) {
        self.service = service
        loadCities()
    }
    
    func loadCities() {
        cities = service.fetchCities()
    }
}

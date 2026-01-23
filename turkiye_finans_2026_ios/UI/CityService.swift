//
//  CityService.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 23.01.2026.
//

import Foundation

struct City: Identifiable {
    let id: UUID? = UUID()
    let name: String
    let plateCode: Int
}


protocol CityServiceProtocol {
    func fetchCities() -> [City]
}

final class CityService: CityServiceProtocol {
    func fetchCities() -> [City] {
        return [
            City(name: "İstanbul", plateCode: 34),
            City(name: "Ankara", plateCode: 6),
            City(name: "İzmir", plateCode: 35),
            City(name: "Bursa", plateCode: 16)
        ]
    }
}



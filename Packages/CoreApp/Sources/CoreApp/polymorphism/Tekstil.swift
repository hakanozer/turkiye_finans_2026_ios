//
//  Tekstil.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 20.01.2026.
//


class Tekstil: Product {
    
    var color: String
    var type: String
    
    init(id: Int, name: String, price: Double, currency: String, color: String, type: String) {
        self.color = color
        self.type = type
        super.init(id: id, name: name, price: price, currency: currency)
    }
    
    // type - color func
    func getTeststikDetail() -> String {
        return "\(name) - \(type) - \(color)"
    }
    
}

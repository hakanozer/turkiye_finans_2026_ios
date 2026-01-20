//
//  Araba.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 20.01.2026.
//

class Araba : Product {
    var marka: String
    var model: String
    var yıl: Int
    
    init(id: Int, name: String, price: Double, currency: String, color: String,marka: String, model: String, yıl: Int) {
        self.marka = marka
        self.model = model
        self.yıl = yıl
        super.init(id: id, name: name, price: price, currency: currency)
    }
    
    // marka, model, yıl detail
    func getArabaDetail() -> String {
        return "\(self.marka) \(self.model) \(self.yıl)"
    }
    
}

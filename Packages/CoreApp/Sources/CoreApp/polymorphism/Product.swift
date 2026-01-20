//
//  Product.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 20.01.2026.
//

public class Product {
    public var id: Int
    public var name: String
    public var price: Double
    public var currency: String
    
    // init yap
    public init(id: Int, name: String, price: Double, currency: String) {
        self.id = id
        self.name = name
        self.price = price
        self.currency = currency
    }
    
    // bilgileri göster
    public func showInfo() {
        print("ID: \(id), Name: \(name), Price: \(price), Currency: \(currency)")
    }
    
    //sepete ekle
    public func addToCart() {
        print("\(name) eklendi.")
    }
    
    public func removeFromCart() {
        print("\(name) çıkarıldı.")
    }
    
    
}


//
//  ProductResult.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 20.01.2026.
//

public class ProductResult {
    
    public init () {
        
    }
    
    public func getProductList() -> [Product] {
        var arr: [Product] = []
        
        // 6 adet Araba
        arr.append(
            Araba(id: 1, name: "Sedan Araç", price: 850000, currency: "TRY",
                  color: "Beyaz", marka: "Toyota", model: "Corolla", yıl: 2022)
        )
        
        arr.append(
            Araba(id: 2, name: "SUV Araç", price: 1250000, currency: "TRY",
                  color: "Siyah", marka: "Honda", model: "CR-V", yıl: 2023)
        )
        
        arr.append(
            Araba(id: 3, name: "Hatchback Araç", price: 780000, currency: "TRY",
                  color: "Kırmızı", marka: "Hyundai", model: "i20", yıl: 2021)
        )
        
        arr.append(
            Araba(id: 4, name: "Elektrikli Araç", price: 1600000, currency: "TRY",
                  color: "Mavi", marka: "Tesla", model: "Model 3", yıl: 2024)
        )
        
        arr.append(
            Araba(id: 5, name: "Lüks Araç", price: 2200000, currency: "TRY",
                  color: "Gri", marka: "BMW", model: "520i", yıl: 2022)
        )
        
        arr.append(
            Araba(id: 6, name: "Spor Araç", price: 3100000, currency: "TRY",
                  color: "Sarı", marka: "Porsche", model: "911", yıl: 2023)
        )
        
        // 4 adet Tekstil
        arr.append(
            Tekstil(id: 7, name: "T-Shirt", price: 299.99, currency: "TRY",
                    color: "Beyaz", type: "Üst Giyim")
        )
        
        arr.append(
            Tekstil(id: 8, name: "Kot Pantolon", price: 799.99, currency: "TRY",
                    color: "Lacivert", type: "Alt Giyim")
        )
        
        arr.append(
            Tekstil(id: 9, name: "Ceket", price: 1499.99, currency: "TRY",
                    color: "Siyah", type: "Dış Giyim")
        )
        
        arr.append(
            Tekstil(id: 10, name: "Spor Ayakkabı", price: 1899.99, currency: "TRY",
                    color: "Gri", type: "Ayakkabı")
        )
        
        return arr
    }
}


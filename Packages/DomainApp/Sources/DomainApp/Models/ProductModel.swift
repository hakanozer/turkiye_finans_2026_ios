//
//  ProductModel.swift
//  DomainApp
//
//  Created by HAKAN ÖZER on 20.01.2026.
//

import Foundation

public struct ProductModel {
    public let id: UUID
    public let name: String
    public let price: Double
    
    public init(id: UUID, name: String, price: Double) {
        self.id = id
        self.name = name
        self.price = price
    }  
}


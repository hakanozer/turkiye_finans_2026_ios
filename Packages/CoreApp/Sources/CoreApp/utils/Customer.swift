//
//  Customer.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 19.01.2026.
//

import Foundation

// class
public class Customer {
    
    var id: String?
    var address: String?
    
    init(id: String? = nil, address: String? = nil) {
        self.id = id
        self.address = address
        print("Customer initialized")
    }
    
}

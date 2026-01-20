//
//  Action.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 19.01.2026.
//

import Foundation

public class User : Customer {
    
    var name: String?
    var email: String
    
    public init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    // sum method
    public func sum(a: Int, b: Int) -> Int {
        return a + b
    }
    

    
}

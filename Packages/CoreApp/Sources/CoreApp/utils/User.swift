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
    
    // email kontol method
    public func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    // telefon no kontrol method
    public func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneNumberRegEx = "^(\\+[0-9]{1,3}|0)[0-9]{9,14}$"
        
        let phoneNumberPred = NSPredicate(format:"SELF MATCHES %@", phoneNumberRegEx)
        return phoneNumberPred.evaluate(with: phoneNumber)
    }
    
}

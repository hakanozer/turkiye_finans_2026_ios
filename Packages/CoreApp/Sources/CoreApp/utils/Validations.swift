//
//  Validations.swift
//  CoreApp
//
//  Created by HAKAN ÖZER on 20.01.2026.
//

import Foundation

public class Validations {
    
    public init() {
        
    }
    
    // email kontol method
    public func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    // password en az 6 karakter olsun
    public func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
    
    // telefon no kontrol method
    public func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneNumberRegEx = "^(\\+[0-9]{1,3}|0)[0-9]{9,14}$"
        
        let phoneNumberPred = NSPredicate(format:"SELF MATCHES %@", phoneNumberRegEx)
        return phoneNumberPred.evaluate(with: phoneNumber)
    }
    
}

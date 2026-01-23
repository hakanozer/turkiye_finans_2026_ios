//
//  AppDIContainer.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 23.01.2026.
//

import Swinject

final class AppDIContainer {
    static let shared = AppDIContainer()
    
    let container: Container
    
    private init() {
        container = Container()
        registerCustomer()
        registerUser()
    }
    
    // Customer Register
    func registerCustomer() {
        container.register(Customer.self) { _ in
            Customer()
        }
    }
    
    // User Register
    func registerUser() {
        container.register(UserAction.self) { _ in
            UserAction()
        }
    }
    
    
}

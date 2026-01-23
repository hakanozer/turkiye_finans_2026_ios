//
//  UserViewModel.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 23.01.2026.
//

import Combine
import Foundation

class UserViewModel: ObservableObject {

    @Published var users: String = ""
    @Published var errorMessage: String? = nil

    func fetchUsers() async {
        self.users = "Erkan"
    }
}


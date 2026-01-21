//
//  AuthAPI.swift
//  DataApp
//
//  Created by HAKAN ÖZER on 21.01.2026.
//

import Moya
import Foundation

enum AuthAPI {
    case login(request: LoginRequest)
    case register(request: LoginRequest)
}

extension AuthAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: Const.baseURL)!
    }
    
    var path: String {
        switch self {
            case .login:
                return "auth/login"
            case .register:
                return "auth/register"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        default:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .login(let request):
            return .requestJSONEncodable(request)
        case .register(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        [
            "Content-Type": "application/json"
        ]
    }
    
    
    
    
}

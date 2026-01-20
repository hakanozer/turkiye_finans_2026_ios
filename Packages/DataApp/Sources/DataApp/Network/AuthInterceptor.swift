//
//  AuthInterceptor.swift
//  DataApp
//
//  Created by HAKAN ÖZER on 20.01.2026.
//
import Alamofire
import Foundation

final class AuthInterceptor: RequestInterceptor {
    // Tüm isteklere otomatik API Token ekler
    func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void
    ) {
        var request = urlRequest

        if let token = UserDefaults.standard.string(forKey: "token"),
           !token.isEmpty {

            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        completion(.success(request))
    }
}

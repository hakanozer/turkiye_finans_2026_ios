//
//  AuthInterceptor.swift
//  DataApp
//
//  Created by HAKAN ÖZER on 20.01.2026.
//
import Alamofire
import Foundation
import CoreApp

final class AuthInterceptor: RequestInterceptor {

    // MARK: - Request'e token ekleme
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

    // MARK: - Global Exception Handling
    func retry(
        _ request: Request,
        for session: Session,
        dueTo error: Error,
        completion: @escaping (RetryResult) -> Void
    ) {

        // HTTP response yoksa
        guard let response = request.task?.response as? HTTPURLResponse else {
            completion(.doNotRetry)
            return
        }

        print("Gelen : \(response.statusCode)")
        switch response.statusCode {

        case 401:
            // Token süresi dolmuş / geçersiz
            handleUnauthorized()
            completion(.doNotRetry)

        case 403:
            handleForbidden()
            completion(.doNotRetry)

        case 500...599:
            handleServerError(code: response.statusCode)
            completion(.doNotRetry)

        default:
            completion(.doNotRetry)
        }
    }
    
    
    private func handleUnauthorized() {
        UserDefaults.standard.removeObject(forKey: "token")

        NotificationCenter.default.post(
            name: .didReceiveUnauthorized,
            object: nil
        )
    }
    
    private func handleForbidden() {
        NotificationCenter.default.post(
            name: .didReceiveForbidden,
            object: nil
        )
    }
    
    private func handleServerError(code: Int) {
        NotificationCenter.default.post(
            name: .didReceiveServerError,
            object: code
        )
    }
    
    
    
    
    
}

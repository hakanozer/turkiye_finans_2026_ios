//
//  AuthService.swift
//  DataApp
//
//  Created by HAKAN ÖZER on 21.01.2026.
//
import Moya
import Foundation

public class AuthService {
    
    let session = Session(interceptor: AuthInterceptor())
    let authProvider:MoyaProvider<AuthAPI>
    
    public init () {
        authProvider = MoyaProvider<AuthAPI>(
            session: self.session,
            plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))]
        )
    }
    
    
    public func login(
        email: String,
        password: String,
        completion: @escaping (Result<LoginResponse, Error>) -> Void
    ) {
        let request = LoginRequest(email: email, password: password)

        authProvider.request(.login(request: request)) { result in
            switch result {

            case .success(let response):

                switch response.statusCode {

                case 200...299:
                    do {
                        let loginResponse = try JSONDecoder()
                            .decode(LoginResponse.self, from: response.data)
                        completion(.success(loginResponse))
                    } catch {
                        completion(.failure(error))
                    }

                case 401:
                    NotificationCenter.default.post(
                        name: .didReceiveUnauthorized,
                        object: nil
                    )
                    completion(.failure(NSError(domain: "Unauthorized", code: 401)))

                case 403:
                    NotificationCenter.default.post(
                        name: .didReceiveForbidden,
                        object: nil
                    )
                    completion(.failure(NSError(domain: "Forbidden", code: 403)))

                case 500...599:
                    NotificationCenter.default.post(
                        name: .didReceiveServerError,
                        object: response.statusCode
                    )
                    completion(.failure(NSError(domain: "ServerError", code: response.statusCode)))

                default:
                    completion(.failure(NSError(domain: "Unknown", code: response.statusCode)))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
    
}


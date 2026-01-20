//
//  NetworkSession.swift
//  DataApp
//
//  Created by HAKAN ÖZER on 20.01.2026.
//

import Alamofire

final class NetworkSession {
    static let shared: Session = {
        // 1. Sertifikaları projeden oku
        let evaluator = PinnedCertificatesTrustEvaluator()
        let serverTrustManager = ServerTrustManager(evaluators: ["jsonbulut.com": evaluator])
        
        // 2. Interceptor (Auth/Logging) ekle
        let interceptor = AuthInterceptor()
        
        return Session(interceptor: interceptor, serverTrustManager: serverTrustManager)
    }()
}

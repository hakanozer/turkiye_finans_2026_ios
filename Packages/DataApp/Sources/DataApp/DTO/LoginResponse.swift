import Foundation

// MARK: - LoginResponse
public struct LoginResponse: Decodable {
    public let meta: Meta
    public let data: LoginData
}

// MARK: - LoginData
public struct LoginData: Decodable {
    public let accessToken: String
    public let tokenType: String
    public let expiresIn: Int
    public let user: User

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType   = "token_type"
        case expiresIn   = "expires_in"
        case user
    }
}

// MARK: - User
public struct User: Decodable {
    public let id: Int
    public let name: String
    public let email: String
    public let role: String
    public let rememberToken: String?
    public let createdAt: String
    public let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, email, role
        case rememberToken = "remember_token"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Meta
public struct Meta: Decodable {
    public let status: Int
    public let message: String
}


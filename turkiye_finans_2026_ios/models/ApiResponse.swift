//
//  ApiResponse.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 22.01.2026.
//

struct ApiResponse: Codable {
    let meta: Meta
    let data: [Comment]
}


struct Meta: Codable {
    let status: Int
    let message: String
    let pagination: Pagination
}

struct Pagination: Codable {
    let page: Int
    let perPage: Int
    let totalItems: Int
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case totalItems = "total_items"
        case totalPages = "total_pages"
    }
}


struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String

    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case id
        case name
        case email
        case body
    }
}

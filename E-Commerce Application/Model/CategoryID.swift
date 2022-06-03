//
//  CategoryID.swift
//  E-Commerce Application
//
//  Created by NourAllah Ahmed on 6/3/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
struct RootClass: Codable {

    let customCollections: [CustomCollections]?
}

struct CustomCollections: Codable {

    let id: Int?
    let handle: String?
    let title: String?
    let updatedAt: String?
    let bodyHtml: String?
    let publishedAt: String?
    let sortOrder: String?
    let templateSuffix: String?
    let publishedScope: String?
    let adminGraphqlApiId: String?
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case handle = "handle"
        case title = "title"
        case updatedAt = "updated_at"
        case bodyHtml = "body_html"
        case publishedAt = "published_at"
        case sortOrder = "sort_order"
        case templateSuffix = "template_suffix"
        case publishedScope = "published_scope"
        case adminGraphqlApiId = "admin_graphql_api_id"
    }
}

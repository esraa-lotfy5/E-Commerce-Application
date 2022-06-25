//
//  InventoryLevels.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 24/06/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
struct InventoryLevels: Codable {
    var inventoryLevels: [InventoryLevel]

    enum CodingKeys: String, CodingKey {
        case inventoryLevels = "inventory_levels"
    }
}

// MARK: - InventoryLevel
struct InventoryLevel: Codable {
    var inventoryItemID, locationID, available: Int64
    var updatedAt: String
    var adminGraphqlAPIID: String

    enum CodingKeys: String, CodingKey {
        case inventoryItemID = "inventory_item_id"
        case locationID = "location_id"
        case available
        case updatedAt = "updated_at"
        case adminGraphqlAPIID = "admin_graphql_api_id"
    }
}

//
//  HomeItemDTO.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import Foundation
import CoreModule

struct HomeItemDTO: Decodable {
    let id: String
    let title: String
    let description: String
    let imageUrl: String
    let type: String
    let createdAt: String
    
    func toDomain() -> HomeItem {
        return HomeItem(
            id: id,
            title: title,
            description: description,
            imageUrl: imageUrl,
            type: HomeItemType(rawValue: type) ?? .unknown,
            createdAt: DateFormatter.iso8601.date(from: createdAt) ?? Date()
        )
    }
}

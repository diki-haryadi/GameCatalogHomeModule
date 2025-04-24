//
//  FeaturedContentDTO.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import Foundation
import CoreModule

struct FeaturedContentDTO: Decodable {
    let id: String
    let title: String
    let subtitle: String
    let coverImageUrl: String
    
    func toDomain() -> FeaturedContent {
        return FeaturedContent(
            id: id,
            title: title,
            subtitle: subtitle,
            coverImageUrl: coverImageUrl
        )
    }
}

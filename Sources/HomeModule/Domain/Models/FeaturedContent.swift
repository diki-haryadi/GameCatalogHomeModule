//
//  FeaturedContent.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import Foundation

public struct FeaturedContent: Identifiable, Equatable {
    public let id: String
    public let title: String
    public let subtitle: String
    public let coverImageUrl: String
    
    public init(id: String, title: String, subtitle: String, coverImageUrl: String) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.coverImageUrl = coverImageUrl
    }
}

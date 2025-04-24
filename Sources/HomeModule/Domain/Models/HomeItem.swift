//
//  HomeItem.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import Foundation

public struct HomeItem: Identifiable, Equatable {
    public let id: String
    public let title: String
    public let description: String
    public let imageUrl: String
    public let type: HomeItemType
    public let createdAt: Date
    
    public init(id: String, title: String, description: String, imageUrl: String, type: HomeItemType, createdAt: Date) {
        self.id = id
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
        self.type = type
        self.createdAt = createdAt
    }
}

public enum HomeItemType: String {
    case article
    case video
    case podcast
    case event
    case unknown
}

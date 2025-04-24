//
//  HomeRepositoryProtocol.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import Foundation

public protocol HomeRepositoryProtocol {
    func getHomeData() async throws -> [HomeItem]
    func getFeaturedContent() async throws -> [FeaturedContent]
}


//
//  HomeRemoteDataSource.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import Foundation
import CoreModule

public class HomeRemoteDataSource {
    private let apiService: APIServiceProtocol
    
    public init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func fetchHomeData() async throws -> [HomeItemDTO] {
        let endpoint = APIEndpoints.getHomeItems
        return try await apiService.request(endpoint: endpoint)
    }
    
    func fetchFeaturedContent() async throws -> [FeaturedContentDTO] {
        let endpoint = APIEndpoints.getFeaturedContent
        return try await apiService.request(endpoint: endpoint)
    }
}

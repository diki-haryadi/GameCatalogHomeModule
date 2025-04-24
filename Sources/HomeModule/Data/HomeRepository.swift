//
//  HomeRepository.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import Foundation
import CoreModule

public class HomeRepository: HomeRepositoryProtocol {
    private let remoteDataSource: HomeRemoteDataSource
    
    public init(remoteDataSource: HomeRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func getHomeData() async throws -> [HomeItem] {
        let homeDTO = try await remoteDataSource.fetchHomeData()
        return homeDTO.map { $0.toDomain() }
    }
    
    public func getFeaturedContent() async throws -> [FeaturedContent] {
        let featuredDTO = try await remoteDataSource.fetchFeaturedContent()
        return featuredDTO.map { $0.toDomain() }
    }
}

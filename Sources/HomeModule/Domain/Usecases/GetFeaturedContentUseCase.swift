//
//  GetFeaturedContentUseCase.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import Foundation
import CoreModule

public class GetFeaturedContentUseCase: UseCase {
    private let repository: HomeRepositoryProtocol
    
    public init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() async -> Result<[FeaturedContent], Error> {
        do {
            let featuredContent = try await repository.getFeaturedContent()
            return .success(featuredContent)
        } catch {
            return .failure(error)
        }
    }
}

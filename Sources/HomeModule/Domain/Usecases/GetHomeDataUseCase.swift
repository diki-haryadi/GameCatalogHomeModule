//
//  GetHomeDataUseCase.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//


import Foundation
import CoreModule

public class GetHomeDataUseCase: UseCase {
    private let repository: HomeRepositoryProtocol
    
    public init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() async -> Result<[HomeItem], Error> {
        do {
            let homeItems = try await repository.getHomeData()
            return .success(homeItems)
        } catch {
            return .failure(error)
        }
    }
}

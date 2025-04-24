//
//  HomeViewModel.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import Foundation
import Combine
import CoreModule

public class HomeViewModel: ObservableObject {
    private let getHomeDataUseCase: GetHomeDataUseCase
    private let getFeaturedContentUseCase: GetFeaturedContentUseCase
    private var cancellables = Set<AnyCancellable>()
    
    @Published public var homeItems: [HomeItem] = []
    @Published public var featuredContent: [FeaturedContent] = []
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String?
    
    public init(getHomeDataUseCase: GetHomeDataUseCase, getFeaturedContentUseCase: GetFeaturedContentUseCase) {
        self.getHomeDataUseCase = getHomeDataUseCase
        self.getFeaturedContentUseCase = getFeaturedContentUseCase
    }
    
    public func loadHomeData() {
        isLoading = true
        errorMessage = nil
        
        Task {
            let homeResult = await getHomeDataUseCase.execute()
            let featuredResult = await getFeaturedContentUseCase.execute()
            
            await MainActor.run {
                self.isLoading = false
                
                switch homeResult {
                case .success(let items):
                    self.homeItems = items
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
                
                switch featuredResult {
                case .success(let featured):
                    self.featuredContent = featured
                case .failure(let error):
                    if self.errorMessage == nil {
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
        }
    }
    
    public func refreshData() {
        loadHomeData()
    }
}

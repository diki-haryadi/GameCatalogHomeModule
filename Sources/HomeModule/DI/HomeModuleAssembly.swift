//
//  HomeModuleAssembly.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import Foundation
import UIKit
import CoreModule

public class HomeModuleAssembly {
    private let coreAssembly: CoreAssembly
    
    public init(coreAssembly: CoreAssembly) {
        self.coreAssembly = coreAssembly
    }
    
    public func makeHomeModule(navigationController: UINavigationController) -> UIViewController {
        let remoteDataSource = HomeRemoteDataSource(apiService: coreAssembly.apiService)
        let repository = HomeRepository(remoteDataSource: remoteDataSource)
        let getHomeDataUseCase = GetHomeDataUseCase(repository: repository)
        let getFeaturedContentUseCase = GetFeaturedContentUseCase(repository: repository)
        let viewModel = HomeViewModel(getHomeDataUseCase: getHomeDataUseCase, getFeaturedContentUseCase: getFeaturedContentUseCase)
        let coordinator = DefaultHomeCoordinator(navigationController: navigationController, moduleFactory: coreAssembly.moduleFactory, homeViewModel: viewModel)
        return coordinator.start()
    }
}

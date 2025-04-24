//
//  HomeCoordinator.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import Foundation
import UIKit
import SwiftUI
import CoreModule

public protocol HomeCoordinator {
    func start() -> UIViewController
    func navigateToDetail(itemId: String)
    func navigateToSearch()
}

public class DefaultHomeCoordinator: HomeCoordinator {
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    private let homeViewModel: HomeViewModel
    
    public init(navigationController: UINavigationController, moduleFactory: ModuleFactoryProtocol, homeViewModel: HomeViewModel) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
        self.homeViewModel = homeViewModel
    }
    
    public func start() -> UIViewController {
        let homeView = HomeView(viewModel: homeViewModel, coordinator: self)
        let hostingController = UIHostingController(rootView: homeView)
        navigationController.viewControllers = [hostingController]
        return navigationController
    }
    
    public func navigateToDetail(itemId: String) {
        guard let detailViewController = moduleFactory.makeDetailModule(itemId: itemId) else { return }
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    public func navigateToSearch() {
        guard let searchViewController = moduleFactory.makeSearchModule() else { return }
        navigationController.pushViewController(searchViewController, animated: true)
    }
}

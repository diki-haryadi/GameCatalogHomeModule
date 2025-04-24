//
//  HomeView.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import SwiftUI
import CoreModule

public struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    private let coordinator: HomeCoordinator
    
    public init(viewModel: HomeViewModel, coordinator: HomeCoordinator) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.coordinator = coordinator
    }
    
    public var body: some View {
        NavigationView {
            contentView
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            coordinator.navigateToSearch()
                        }) {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }
        }
        .onAppear {
            viewModel.loadHomeData()
        }
        .refreshable {
            viewModel.refreshData()
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        if viewModel.isLoading && viewModel.homeItems.isEmpty {
            ProgressView()
        } else if let errorMessage = viewModel.errorMessage, viewModel.homeItems.isEmpty {
            ErrorView(message: errorMessage) {
                viewModel.refreshData()
            }
        } else {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if !viewModel.featuredContent.isEmpty {
                        FeaturedContentCarousel(items: viewModel.featuredContent) { item in
                            coordinator.navigateToDetail(itemId: item.id)
                        }
                    }
                    
                    Text("Latest Content")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HomeItemsList(items: viewModel.homeItems) { item in
                        coordinator.navigateToDetail(itemId: item.id)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

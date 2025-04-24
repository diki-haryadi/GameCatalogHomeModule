//
//  FeaturedContentCarousel.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import SwiftUI

struct FeaturedContentCarousel: View {
    let items: [FeaturedContent]
    let onItemTap: (FeaturedContent) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(items) { item in
                    FeaturedContentCard(item: item)
                        .onTapGesture {
                            onItemTap(item)
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct FeaturedContentCard: View {
    let item: FeaturedContent
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: item.coverImageUrl)) { phase in
                switch phase {
                case .empty:
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                        )
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 300, height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Text(item.title)
                .font(.headline)
                .lineLimit(1)
            
            Text(item.subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .frame(width: 300)
    }
}

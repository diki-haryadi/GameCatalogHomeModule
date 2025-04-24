//
//  HomeItemsList.swift
//  GameCatalogMain
//
//  Created by ben on 23/04/25.
//

import SwiftUI

struct HomeItemsList: View {
    let items: [HomeItem]
    let onItemTap: (HomeItem) -> Void
    
    var body: some View {
        LazyVStack(spacing: 16) {
            ForEach(items) { item in
                HomeItemCard(item: item)
                    .onTapGesture {
                        onItemTap(item)
                    }
                    .padding(.horizontal)
            }
        }
    }
}

struct HomeItemCard: View {
    let item: HomeItem
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: item.imageUrl)) { phase in
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
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(item.type.rawValue.capitalized)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(typeColor(for: item.type).opacity(0.2))
                        .foregroundColor(typeColor(for: item.type))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    Text(formatDate(item.createdAt))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Text(item.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    private func typeColor(for type: HomeItemType) -> Color {
        switch type {
        case .article:
            return .blue
        case .video:
            return .red
        case .podcast:
            return .purple
        case .event:
            return .green
        case .unknown:
            return .gray
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

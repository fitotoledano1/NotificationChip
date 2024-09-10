// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

struct NotificationChip: View {
    let title: String
    let symbolName: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: symbolName)
                .resizable()
                .frame(width: 16, height: 16)
            
            Text(title)
                .bold()
        }
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    NotificationChip(
        title: "Added to playlist",
        symbolName: "list.star"
    )
}

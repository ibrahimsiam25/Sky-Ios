//
//  StatCard.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

import SwiftUI

struct StatCard: View {
    let icon: String
    let title: String
    let value: String
    let textColor: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(textColor.opacity(0.8))

            Text(value)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(textColor)

            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(textColor.opacity(0.6))
        }
        .frame(maxWidth: .infinity, minHeight: 110)
        .padding(.vertical, 16)
        .background(Color.white.opacity(0.12))
        .cornerRadius(16)
    }
}

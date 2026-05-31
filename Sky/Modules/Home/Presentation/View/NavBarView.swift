//
//  NavBarView.swift
//  Sky
//
//  Created by siam on 31/05/2026.
//

import SwiftUI

struct NavBarView: View {
    let textColor: Color
    let onSearchTap: () -> Void

    var body: some View {
        HStack {
            Spacer()
            Button(action: onSearchTap) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(textColor)
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
            }
            .padding(.trailing, 20)
            .padding(.top, 10)
        }
    }
}

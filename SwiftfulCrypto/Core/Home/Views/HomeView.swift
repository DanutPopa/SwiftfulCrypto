//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by Danut Popa on 23.04.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                homeHeader
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .toolbar(.hidden, for: .navigationBar)
    }
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none, value: showPortfolio)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(.degrees(showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}

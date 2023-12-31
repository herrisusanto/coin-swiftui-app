//
//  HomeView.swift
//  SwiftCoin
//
//  Created by loratech on 31/12/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: true) {
                TopMoversView()
                Divider()
                AllCoinsView()
                
            }
            .navigationTitle("Live Prices")
        }
    }
}

#Preview {
    HomeView()
}

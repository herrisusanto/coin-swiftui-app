//
//  HomeView.swift
//  SwiftCoin
//
//  Created by loratech on 31/12/23.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel() 
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: true) {
                TopMoversView(viewModel: viewModel)
                Divider()
                AllCoinsView(viewModel: viewModel)
                
            }
            .navigationTitle("Live Prices") 
        }
    }
}

#Preview {
    HomeView().environmentObject(HomeViewModel()).preferredColorScheme(.dark)
}

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
            ScrollView(.vertical,showsIndicators: false) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("Live Prices")
        }
    }
}

#Preview {
    HomeView()
}

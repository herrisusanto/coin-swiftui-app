//
//  AllCoinsView.swift
//  SwiftCoin
//
//  Created by loratech on 31/12/23.
//

import SwiftUI

struct AllCoinsView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("All Coins")
                .font(.headline)
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            HStack {
                Text("Coin")
                Spacer()
                Text("Prices")
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)
            
            ScrollView{
                ForEach(viewModel.coins){ coin in
                    CoinCellView(coin: coin)
                }
            }
            
        }
        
    }
}

#Preview {
    AllCoinsView(viewModel: HomeViewModel())
}

//
//  CoinCellView.swift
//  SwiftCoin
//
//  Created by loratech on 31/12/23.
//

import SwiftUI

struct CoinCellView: View {
    
    let coin: Coin
    
    var body: some View {
        HStack {
            Text("\(coin.marketCapRank )")
                .font(.caption)
                .foregroundColor(.gray)
            
            AsyncImage(url: URL(string: coin.image)){ image in
                image
                    .image?.resizable()
                    .frame(width: 32, height: 32)
                    
            }
                
            VStack(alignment: .leading, spacing: 4){
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 6)
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text("\(coin.currentPrice.toCurrency())")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading, 6)
                Text("\(coin.priceChangePercentage24H.toPercentString())")
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(coin.priceChangePercentage24H < 0 ?.red:.green)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    CoinCellView(coin: MockData.sampleCoin)
}

//
//  TopMovesItemView.swift
//  SwiftCoin
//
//  Created by loratech on 31/12/23.
//

import SwiftUI

struct TopMoverItemView: View {
    
    var coin: Coin
    
    var body: some View {
        VStack(alignment: .leading,spacing: 4) {
            AsyncImage(url: URL(string: coin.image)){ image in
                image
                    .image?.resizable()
                    .frame(width: 32,height: 32)
                    .padding(.bottom, 8)
            }
            
            HStack(spacing: 2) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                Text("\(coin.currentPrice.toCurrency())")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Text("\(coin.priceChangePercentage24H.toPercentString())")
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H < 0 ?.red:.green)
        }
        .frame(width: 140, height: 140)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        }
        
    }
}

#Preview {
    TopMoverItemView(coin: MockData.sampleCoin)
}

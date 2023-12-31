//
//  AllCoinsView.swift
//  SwiftCoin
//
//  Created by loratech on 31/12/23.
//

import SwiftUI

struct AllCoinsView: View {
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
                ForEach(0..<50, id: \.self){ _ in
                    CoinCellView()
                }
            }
            
        }
        
    }
}

#Preview {
    AllCoinsView()
}

//
//  CoinCellView.swift
//  SwiftCoin
//
//  Created by loratech on 31/12/23.
//

import SwiftUI

struct CoinCellView: View {
    var body: some View {
        HStack {
            Text("1")
                .font(.caption)
                .foregroundColor(.gray)
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            VStack(alignment: .leading, spacing: 4){
                Text("Bitcoin")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 6)
                Text("BTC")
                    .font(.caption)
                    .padding(.leading, 4)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text("$20.333.00")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading, 4)
                Text("-3,44%")
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    CoinCellView()
}

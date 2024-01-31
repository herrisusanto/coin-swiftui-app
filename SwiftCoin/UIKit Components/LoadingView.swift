//
//  LoadingView.swift
//  SwiftCoin
//
//  Created by loratech on 01/01/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable{
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor(.gray)
        activityIndicatorView.startAnimating()
        
        return activityIndicatorView
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ActivityIndicator()
        }
    }
}

#Preview {
    LoadingView()
}

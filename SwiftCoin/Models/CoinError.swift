//
//  CoinError.swift
//  SwiftCoin
//
//  Created by loratech on 31/01/24.
//

import Foundation


enum CoinError: Error, LocalizedError {
    case invalidUrl
    case serverError
    case invalidData
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The URL was invalid, please try again later."
        case .serverError:
            return "There was an error with the server. Please try again later."
        case .invalidData:
            return "The coin data is invalid. Please try again later."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}

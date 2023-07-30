//
//  APIEndpoints.swift
//  PromiseKit Implementation
//
//  Created by Syed Mansoor on 30/07/23.
//

import Foundation

public protocol Endpoint {
  var path: String { get }
}

public enum endpoints {
    case bitcoinPrice
}

extension endpoints: Endpoint {
    public var path: String {
    switch self {
    case .bitcoinPrice: return "https://api.coinbase.com/v2/prices/BTC-USD/spot"
    }
  }
}

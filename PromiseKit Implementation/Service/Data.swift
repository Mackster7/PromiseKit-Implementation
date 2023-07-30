//
//  Data.swift
//  PromiseKit Implementation
//
//  Created by Syed Mansoor on 30/07/23.
//

import Foundation

struct ResponseData: Codable {
    let data: DataObject
}

struct DataObject: Codable {
    let base: String
    let currency: String
    let amount: String
}

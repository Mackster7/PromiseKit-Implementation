//
//  fetch.swift
//  PromiseKit Implementation
//
//  Created by Syed Mansoor on 30/07/23.
//

import Foundation
import PromiseKit

class APIService {
    
    func fetchBitcoinPriceAndUpdateLabel (completion: @escaping (Double) -> Void, onError: @escaping (Error) -> Void)  {
        let apiUrlString = endpoints.bitcoinPrice.path
        
        // Create a promise that will handle the API call
        let promise = Promise<Double> { seal in
            URLSession.shared.dataTask(with: URL(string: apiUrlString)!) { data, response, error in
                if let error = error {
                    // Reject the promise if there was an error with the API call
                    seal.reject(error)
                    return
                }
                
                do {
                    // Parse the response and extract the bitcoin price amount
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(ResponseData.self, from: data!)
                    if let amount = Double(result.data.amount) {
                        // Fulfill the promise with the bitcoin price
                        seal.fulfill(amount)
                    } else {
                        // Reject the promise if the amount couldn't be parsed
                        let parsingError = NSError(domain: "ParsingError", code: 0, userInfo: nil)
                        seal.reject(parsingError)
                    }
                } catch {
                    // Reject the promise if there was an error decoding the JSON
                    seal.reject(error)
                }
            }.resume()
        }

        print(promise)
        print(type(of: promise))
        
        // Handle the promise result
        promise.done { bitcoinPrice in
            DispatchQueue.main.async {
                // Update the label with the bitcoin price
                self.updateLabel(with: bitcoinPrice)
                // Call the completion handler with the bitcoin price
                completion(bitcoinPrice)
            }
        }.catch { error in
            print("Error fetching bitcoin price: \(error)")
        }
    }

    func updateLabel(with bitcoinPrice: Double) {
        print("Bitcoin Price: $\(bitcoinPrice)")
    }
    
}

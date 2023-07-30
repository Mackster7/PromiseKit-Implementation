//
//  ViewController.swift
//  PromiseKit Implementation
//
//  Created by Syed Mansoor on 30/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    var fetcher = APIService()
    
    @IBOutlet weak var responseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePrice()
    }
    
    func updatePrice(){
        fetcher.fetchBitcoinPriceAndUpdateLabel(
            completion: { [weak self] bitcoinPrice in
                // Update the label with the bitcoin price
                self?.responseLabel.text = "Current bitcoin price is \(bitcoinPrice)"
            },
            onError: { error in
                print("Error fetching bitcoin price: \(error)")
            }
        )
    }

}


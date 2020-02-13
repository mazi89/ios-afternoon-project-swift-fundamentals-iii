//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency {
    case cad
    case mxn
}



class ViewController: UIViewController {
    
    var currency: Currency = .cad
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let input = fromCurrencyTextField.text else { return }
        
        let convertedInput = Double(input) ?? 0
        
        let conversion = self.convert(convertedInput)
        
        let output = self.convertCurrency(conversion)
        
        toCurrencyTextField.text = String(output)
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        if sender.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency(CAD)"
        }
        
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        
        sender.isSelected.toggle() // I figured that if I just used toggle like this, tapping the button again would cause it to swap. I was right! For the sake of finishing on time and getting to work on other stuff I'll leave it like this.
        cadButton.isSelected.toggle()
        
        if sender.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency(MXN)"
        }
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        switch currency {
        case .cad:
            return dollars * 1.33
        case .mxn:
            return dollars * 19.70
        }
    }
    
    func convertCurrency (_ amount: Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if let output =  formatter.string(from: amount as NSNumber) {
            return output
        }
        
        return "Invalid input"
    }
}


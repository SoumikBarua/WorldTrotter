//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by SB on 8/16/17.
//  Copyright © 2017 SB. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celciusLabel: UILabel!
    @IBOutlet var fahrenheitTextField: UITextField!
    
    var fahrenheitValue: Measurement<UnitTemperature>?{
        didSet{
            updateCelciusLabel()
        }
    }
    var celciusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    func updateCelciusLabel(){
        if let celciusValue = celciusValue {
            celciusLabel.text = numberFormatter.string(from: NSNumber(value: celciusValue.value))
        } else {
            celciusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        //if let text = textField.text, !text.isEmpty {
        //    celciusLabel.text = textField.text
        //} else {
        //    celciusLabel.text = "???"
        //}
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        }
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        fahrenheitTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelciusLabel()
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    
    
}

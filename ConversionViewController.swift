//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by SB on 8/16/17.
//  Copyright © 2017 SB. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celciusLabel: UILabel!
    @IBOutlet var fahrenheitTextField: UITextField!
    
    var colorOption = 0
    
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
        
        print("ConversionViewController loaded its view.")
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        /// Disallow entry of alphabetic characters in the fahrenheit text field
        let characterSet = NSCharacterSet.letters
        if (string.rangeOfCharacter(from: characterSet) != nil) {
            return false
        }
        
        /// Disallow usage of more than one decimals in the fahrenheit text field
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if colorOption == 0{
            view.backgroundColor = UIColor(red:0.00, green:0.26, blue:0.26, alpha:1.0)
            colorOption = 1
        } else {
            view.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.95, alpha:1.0)
            colorOption = 0
        }
    }

}

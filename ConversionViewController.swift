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
    
    var colorsIndex = 0
    
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
        //if let text = textField.text, let value = Double(text) {
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
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
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //let lightColor1 = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
        let lightColor1 = UIColor(red:0.94, green:0.92, blue:0.85, alpha:1.0)
        let lightColor2 = UIColor(red:0.91, green:0.94, blue:0.85, alpha:1.0)
        let lightColor3 = UIColor(red:0.94, green:0.88, blue:0.85, alpha:1.0)
        
        
        let darkColor1 = UIColor(red:0.00, green:0.26, blue:0.26, alpha:1.0)
        let darkColor2 = UIColor(red:0.00, green:0.13, blue:0.26, alpha:1.0)
        let darkColor3 = UIColor(red:0.00, green:0.26, blue:0.13, alpha:1.0)
        
        let lightColors = [lightColor1, lightColor2, lightColor3]
        let darkColors = [darkColor1, darkColor2, darkColor3]
        
        let date = Date()
        let currentHour = Calendar.current.component(.hour, from: date)
        let currentMinute = Calendar.current.component(.minute, from: date)
        let currentDay = Calendar.current.component(.day, from: date)
        let currentMonth = Calendar.current.component(.month, from: date)
        let currentYear = Calendar.current.component(.year, from: date)
        
        print("Current hour is \(currentHour)")
        print("Current minute is \(currentMinute)")
        print("Current day is \(currentDay)")

        var testComponents = DateComponents()
        testComponents.year = currentYear
        testComponents.month = currentMonth
        testComponents.day = currentDay
        testComponents.hour = 18
        testComponents.minute = 30
        let testDate = Calendar.current.date(from: testComponents)
        
        if date.compare(testDate!) == .orderedAscending {
            view.backgroundColor = lightColors[colorsIndex]
        } else {
            view.backgroundColor = darkColors[colorsIndex]
        }
        
        if colorsIndex == 2 {
            colorsIndex = 0
        } else {
            colorsIndex += 1
        }
    }

}

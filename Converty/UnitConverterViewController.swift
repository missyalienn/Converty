//
//  UnitConverterViewController.swift
//  Converty
//
//  Created by Missy Allan on 4/22/17.
//  Copyright © 2017 PandaLabs. All rights reserved.
//

import Foundation
import UIKit

class UnitConverterViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    //the map function iterates over each value in the range, the $0 refers to the value passed to the closure 
    
    private let tempValues = (-30...120).map { $0 }
    private let converter = UnitConverter()
    
    
    @IBOutlet weak var tempLabel: UILabel!
   
    @IBOutlet weak var tempPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempPicker.dataSource = self
        tempPicker.delegate = self 
        self.view.insertPinkGradient()
        let defaultPickerRow =
            tempPicker.numberOfRows(inComponent: 0) / 2
        pickerView(tempPicker, didSelectRow: defaultPickerRow, inComponent: 0)
    
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tempValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //let celciusValue = tempValues[row]
        //return "\(celciusValue)°C"
        
        let fahrenheitValue = tempValues[row]
        return "\(fahrenheitValue)°F"
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // let degreesCelsius = tempValues[row]
        //tempLabel.text = "\(converter.degreesFarenheit(degreesCelsius: degreesCelsius))°F"
        let degreesF = tempValues[row]
        tempLabel.text = "\(converter.convertToCelsius(degreesF: degreesF))°C"
        
    }
}


extension UIView {
        
    func insertPinkGradient() {
        
        let gradientDeepPink = UIColor(red:1.00, green:0.08, blue:0.58, alpha:1.0).cgColor
        let gradientHotPink = UIColor(red:1.00, green:0.41, blue:0.71, alpha:1.0).cgColor
        let gradientPink = UIColor(red:1.00, green:0.71, blue:0.76, alpha:1.0).cgColor
        let gradient = CAGradientLayer()
        gradient.colors = [gradientDeepPink, gradientHotPink, gradientPink]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.frame = UIScreen.main.bounds
        self.layer.insertSublayer(gradient, at: 0)
        
        
    }
    
}
    
    
    
    
    


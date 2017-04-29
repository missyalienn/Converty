//
//  ViewController.swift
//  Converty
//
//  Created by Missy Allan on 3/2/17.
//  Copyright © 2017 PandaLabs. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBOutlet private weak var display: UILabel!
    
    
    private var userInMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle! 
        print("touched \(digit) digit")
        
        if userInMiddleOfTyping == true {
            let textCurrentlyInDisplay = display!.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
        }
        userInMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
          return Double(display.text!)!
        }set {
            display.text = String(newValue)
        }
    }
    
    
    private var brain = CalculatorBrain()
    
    
    @IBAction private func performOperation(_ sender: UIButton) {
        
        if userInMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userInMiddleOfTyping = false
        }
        
        if let mathSymbol = sender.currentTitle {
           brain.performOperand(symbol: mathSymbol)
        }
        displayValue = brain.result
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var finishTyping = true
    private var displayNumber: Double {
        get {
            guard let number = Double(displayLabel.text!) else { fatalError("Cannot convert display label into Double")}
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
    
        finishTyping = true
        if let calcMethod = sender.currentTitle {
            calculator.setNumber(displayNumber)
            if let result = calculator.calculate(calcMethod: calcMethod) {
                displayNumber = result
            }

        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if finishTyping {
                displayLabel.text = numValue
                finishTyping = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayNumber) == displayNumber
                    if !isInt {
                        return
                    }
                }
                displayLabel.text?.append(numValue)
            }
            
            
        }
    }

}


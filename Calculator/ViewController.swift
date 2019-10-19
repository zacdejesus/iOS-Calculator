//
//  ViewController.swift
//  Calculator
//
//  Created by Alejandro De Jesus.
//  Copyright 2019. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var  displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("cannot conver")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
     private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
            //What should happen when a non-number button is pressed
               
               isFinishedTypingNumber = true
               
               calculator.setNumber(displayValue)
               
               if let calcMethod = sender.currentTitle {
        
                   if let result = calculator.calculate(symbol: calcMethod) {
                       displayValue = result
                   }
               }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue  = sender.currentTitle {
                
         //   if isFinishedTypingNumber ? displayLabel.text = numValue : displayLabel.text = displayLabel.text! + numValue
              
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else {
                
                if  numValue == "." {
                
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("cannot cover display label")
                    }
                    
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }

    }

}

//
//  CalculatorViewController.swift
//  fifaCoinManager
//
//  Created by Artem Tyumencev on 19.08.2020.
//  Copyright © 2020 Artem Tyumencev. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var stillTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    var dotIsPlaced = false
    
    var currentInput: Double {
        get {
            return (Double(displayResultLabel.text!))!
        }
        
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0"{
                 displayResultLabel.text = "\(valueArray[0])"
            } else {
                displayResultLabel.text = "\(newValue)"
            }
            stillTyping = false
        }
        
    }

    @IBOutlet weak var displayResultLabel: UILabel!
    
    @IBAction func numberPressed(_ sender: BorderedButtons) {
        
        let number = sender.currentTitle!
        
        if stillTyping {
            if displayResultLabel.text!.length < 10{
                displayResultLabel.text = displayResultLabel.text! + number
            }
        } else {
            displayResultLabel.text = number
            stillTyping = true
        }
    }
    
    @IBAction func twoOperandsSingPressed(_ sender: BorderedButtons) {
        
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        dotIsPlaced = false
    }
    
    func operateWithToOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equalitySignPressed(_ sender: BorderedButtons) {
        
        if stillTyping {
            secondOperand = currentInput
        }
        
        dotIsPlaced = false
        
        switch operationSign {
            case "+":
                operateWithToOperands{$0 + $1}
            case "−":
                operateWithToOperands{$0 - $1}
            case "×":
                operateWithToOperands{$0 * $1}
            case "÷":
                operateWithToOperands{$0 / $1}
        default:
            break
        }
    }
    
    @IBAction func dotButtonPressed(_ sender: BorderedButtons) {
        if stillTyping && !dotIsPlaced {
            displayResultLabel.text = displayResultLabel.text! + "."
            dotIsPlaced = true
        } else if !stillTyping && !dotIsPlaced {
            displayResultLabel.text = "0."
        }
        
    }
    
    @IBAction func taxButtonPressed(_ sender: BorderedButtons) {
        currentInput = currentInput - (currentInput/20)
    }
    
    @IBAction func clearButtonPressed(_ sender: BorderedButtons) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        operationSign = ""
        dotIsPlaced = false
    }
    
    @IBAction func percentageButtonPressed(_ sender: BorderedButtons) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
        stillTyping = false
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: BorderedButtons) {
        currentInput = -currentInput
    }
    
    @IBAction func moneyEquvalentButtonPressed(_ sender: BorderedButtons) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
}

}

extension String {
    var length: Int { return self.count }
}

//
//  ViewController.swift
//  Calculator
//
//  Created by Mark Lucas on 01/02/2018.
//  Copyright © 2018 Mark Lucas. All rights reserved.
//

import UIKit

enum Operation: String {
    
    case Add = "+"
    case Substract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation: Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        numberOutputLabel.text = "0"
        
    }
    
    @IBAction func numberPressedButton(_ sender: roundButton) {
        
        if runningNumber.count <= 9 {
        
            runningNumber += "\(sender.tag)"
            numberOutputLabel.text = runningNumber
            
        }
        
    }
    
    @IBAction func allClearButton(_ sender: roundButton) {
        
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        numberOutputLabel.text = "0"
        
    }
    
    @IBAction func dotPressedButton(_ sender: roundButton) {
        
        if runningNumber.count <= 8 {
        
            runningNumber += "."
            numberOutputLabel.text = runningNumber
            
        }
        
    }
    
    @IBAction func equalPressedButton(_ sender: roundButton) {
        
        operation(operation: currentOperation )
        
    }
    
    @IBAction func addPressedButton(_ sender: roundButton) {
        
        operation(operation: .Add)
        
    }
    
    @IBAction func subtractPressedButton(_ sender: roundButton) {
        
        operation(operation: .Substract)
        
    }
    
    @IBAction func multiplyPressedButton(_ sender: roundButton) {
        
        operation(operation: .Multiply)
        
    }
    
    @IBAction func dividePressedButton(_ sender: roundButton) {
        
        operation(operation: .Divide)
        
    }
    
    func operation(operation: Operation) {
        
        if currentOperation != .NULL {
            
            if runningNumber != "" {
                
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                    
                } else if currentOperation == .Substract {
                    
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                    
                } else if currentOperation == .Multiply {
                    
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                    
                } else if currentOperation == .Divide {
                    
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                    
                }
                
                leftValue = result
                
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    
                    result = "\(Int(Double(result)!))"
                    
                }
                
                numberOutputLabel.text = result
                
            }
            
            currentOperation = operation
            
        } else {
            
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
            
        }
        
    }
    
}


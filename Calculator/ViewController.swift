//
//  ViewController.swift
//  Calculator
//
//  Created by Julian Veling on 03/08/2015.
//  Copyright (c) 2015 Julian Veling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var userIsTyping = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping{
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsTyping = true
        }
    }
    
    var operandStack = Array<Double>()
    @IBAction func enter() {
        userIsTyping = false
        operandStack.append(displayValue)
        println("\(operandStack)")
    }
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsTyping = false
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsTyping{
            enter()
        }
        switch operation{
        case "x": doCalc {$0 * $1}
        case "÷": doCalc {$0 / $1}
        case "-": doCalc {$0 - $1}
        case "+": doCalc {$0 + $1}
        default: break
        }
    }
    
    func doCalc(operation: (Double, Double) -> Double){
        if operandStack.count >= 2{
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
}


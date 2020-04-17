//
//  ViewController.swift
//  CoolCalc
//
//  Created by Zach Cervi on 3/29/20.
//  Copyright © 2020 Zach Cervi. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    var isTypingNumber = false
    var firstNumber: Double?
    var secondNumber: Double?
    var operation = ""
    var result: Double = 0.0
    
    @IBOutlet weak var resultLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLbl.text = "0"
    }
    
    @IBAction func numberTapped(sender: AnyObject){
        let number = sender.currentTitle

        if isTypingNumber {
            if let num = number {
                resultLbl.text = resultLbl.text! + num!
            }
        } else {
            resultLbl.text = number!!
            isTypingNumber = true
        }
    
        
       
    }
    
    @IBAction func operatorTapped(sender: AnyObject){
        isTypingNumber = false
        let num: String = resultLbl.text!
       firstNumber = Double(num)
        operation = sender.currentTitle!
        resultLbl.text = operation
        result = calculate(operation: operation)
 
    }
    
    @IBAction func equalsTapped(sender: AnyObject){
        isTypingNumber = false
       
        let num: String = resultLbl.text!
        secondNumber = Double(num)
        
        if let first = firstNumber {
            if let second = secondNumber {
                switch operation {
                       case "+":
                           result = first + second
                       case "-":
                           result = first - second
                       case "x":
                           result = first * second
                       case "/":
                           result = first / second
                       case "%":
                        result = first.truncatingRemainder(dividingBy: second);
                       default:
                          result = 0
                       }
            }
        }
        resultLbl.text = "\(result)"
    }
    
    func calculate(operation: String) -> Double {
        if let first = firstNumber {
            if let second = secondNumber {
                print(first)
                print(second)
                switch operation {
                       case "+":
                           result = first + second
                       case "-":
                           result = first - second
                       case "x":
                           result = first * second
                       case "/":
                           result = first / second
                       case "%":
                        result = first.truncatingRemainder(dividingBy: second);
                       default:
                          result = 0
                       }
            }
        }
        return result
    }
    
    func reset(){
        if(resultLbl.text != "0"){
            firstNumber = 0
            resultLbl.text = "0"
        } else {
            isTypingNumber = false
               firstNumber = 0
               secondNumber = 0
               operation = ""
              resultLbl.text = "0"
        }
    }
    @IBAction func plusMinusPressed(_ sender: Any) {
        var displayNumber = resultLbl.text!
        
        if(displayNumber != "0"){
            if(displayNumber.prefix(1) != "-"){
                displayNumber = "-" + displayNumber
            } else {
                displayNumber.remove(at: displayNumber.startIndex)
            }
            
            resultLbl.text = displayNumber
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        reset()
    }
    
}


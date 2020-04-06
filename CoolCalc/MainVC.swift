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
    var firstNumber = 0
    var secondNumber = 0
    var operation = ""
    
    @IBOutlet weak var resultLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLbl.text = "0"
    }
    
    @IBAction func numberTapped(sender: AnyObject){
        var number = sender.currentTitle
        if isTypingNumber {
            resultLbl.text = resultLbl.text! + number!!
        } else {
            resultLbl.text = number as! String
            isTypingNumber = true
        }
    }
    
    @IBAction func operatorTapped(sender: AnyObject){
        isTypingNumber = false
        let num: String = resultLbl.text!
        firstNumber = Int(num)!
        operation = sender.currentTitle!
        resultLbl.text = operation
        
    }
    
    @IBAction func equalsTapped(sender: AnyObject){
        isTypingNumber = false
        var result = 0
        let num: String = resultLbl.text!
        secondNumber = Int(num)!
        
        switch operation {
        case "+":
            print(firstNumber)
            print(secondNumber)
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "x":
            result = firstNumber * secondNumber
        case "/":
            result = firstNumber / secondNumber
        case "%":
            result = firstNumber % secondNumber
        default:
           result = 0
        }
        resultLbl.text = "\(result)"
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


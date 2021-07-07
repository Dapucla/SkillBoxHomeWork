//
//  ViewController.swift
//  AdvancedCalculator
//
//  Created by Даниил Алексеев on 10.05.2020.
//  Copyright © 2020 Даниил Алексеев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isPerformingOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
   
    }
    
    @IBAction func numberPressed(_ sender: Any) {
        
        guard let tag = (sender as? UIButton)?.tag else {return}
        
        if isPerformingOperation == true{
        isPerformingOperation = false
        resultLabel.text = String(tag - 1)
        } else if let text = resultLabel.text{
             resultLabel.text = text + String(tag - 1)
        }
        
         if let resulText = resultLabel.text, let numOnScreen = Double(resulText){
            numberOnScreen = numOnScreen
        }
       
    }
    
    @IBAction func operatorPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        if tag == 16{
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            
            return
        }
        
        if (tag == 11 || tag == 12 || tag == 13 || tag == 14){
            operation = tag
            isPerformingOperation = true
            guard let unwrappedResultLabel = resultLabel.text else {return}
            guard let unwrappedResultLabel2 = Double(unwrappedResultLabel) else {return}
            previousNumber = unwrappedResultLabel2
            
            if tag == 11{
            resultLabel.text = "/"
            } else if tag == 12 {
            resultLabel.text = "X"
            } else if tag == 13 {
            resultLabel.text = "-"
            } else if tag == 14 {
            resultLabel.text = "+"
            }
        }
        
            if tag == 15{
            if operation == 11{
                resultLabel.text = String(previousNumber / numberOnScreen)
                
            } else if operation == 12{
                resultLabel.text = String(previousNumber * numberOnScreen)
                
            } else if operation == 13{
                resultLabel.text = String(previousNumber - numberOnScreen)
                           
            } else if operation == 14{
                resultLabel.text = String(previousNumber + numberOnScreen)
            }
    
        }
        if tag == 17 {
            if resultLabel.text == String(Int(numberOnScreen)){
                guard let unwrappedDot = resultLabel.text else {return}
                 resultLabel.text = unwrappedDot + "."
            }else{
            return
            }
        }
        if tag == 18 {
            guard let unwrappedPlusMinus = resultLabel.text else {return}
            func doubleCheck(_ num: String){
                guard let doubleNumber = Double(num) else {return}
                let doubled = floor(doubleNumber)
                
                if doubleNumber - doubled == 0{
                    guard let unwrappedValue1 = resultLabel.text else {return}
                    guard let unwrappedValue2 = Double(unwrappedValue1) else {return}
                    resultLabel.text = String(unwrappedValue2 * -1)
                } else {
                    guard let unwrappedValue3 = resultLabel.text else {return}
                    guard let unwrappedValue4 = Double(unwrappedValue3) else {return}
                    resultLabel.text = String(unwrappedValue4  * -1)
                }
            }
            doubleCheck(unwrappedPlusMinus)
        }
        if tag == 19 {
            guard let unwrappedPercent1 = resultLabel.text else {return}
            guard let unwrappedPercent2 = Double(unwrappedPercent1) else {return}
            resultLabel.text = String(unwrappedPercent2 / 100)
        }
    }
    
}


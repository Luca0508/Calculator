//
//  ViewController.swift
//  Calculator
//
//  Created by 蕭鈺蒖 on 2021/12/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var numberButtons: [UIButton]!
    
    @IBOutlet var operateButtons: [UIButton]!
    @IBOutlet weak var textLabel: UILabel!
    
    var output: Double = 0.0
    var equation: String = ""
    var decimal: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "0"
        
        for i in 0...9{
            numberButtons[i].clipsToBounds = true
            numberButtons[i].layer.cornerRadius = numberButtons[i].bounds.height*0.5
        }
        for i in 0...8{
            operateButtons[i].clipsToBounds = true
            operateButtons[i].layer.cornerRadius = operateButtons[i].bounds.height*0.5
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func numberButtonPress(_ sender: UIButton) {
        let inputNumber = sender.tag
        
        if textLabel.text == "0"{
            textLabel.text = String(inputNumber)
            equation += String(inputNumber)
        }else{
            textLabel.text! += String(inputNumber)
            equation += String(inputNumber)
        }
        
        decimal = false
        
        
    }
    

    @IBAction func operateButtonPress(_ sender: UIButton) {
        let origText = textLabel.text
        textLabel.text  = ""
        
        if equation == ""{
            equation = "0.0"
        }else {
            if decimal == false{
                equation += ".0"
            }
        }
        
        
        
        switch sender.tag{
            
        // AC
        case 0:
            textLabel.text = "0"
            
            equation = "0"
        
        // +/-
        case 1:
            if let origText = origText{
                if origText.contains("-"){
                    textLabel.text = origText.replacingOccurrences(of: "-", with: "")
                }else if origText == "0"{
                    textLabel.text = "0"
                }else if origText != ""{
                  textLabel.text = "-" + origText
                }
            }
            
            
            
            equation +=  "*-1.0"
            
        // %
        case 2:
            equation += "/100.0"
        
        // /
        case 3:
            equation += "/"
            
        // *
        case 4:
        
            equation += "*"
        // -
        case 5:
            equation += "-"
            
        // +
        case 6:
            equation += "+"
        // =
        case 7:
            let expression = NSExpression(format: equation)
            output = expression.expressionValue(with: nil, context: nil) as! Double 
            textLabel.text = String(output)
            print(equation)
            equation = String(output)
            decimal = true
            
            
        // .
        case 8:
            equation += "."
            decimal = true
        default:
            textLabel.text = "Warning!!!"
            break
            
            
        }
        
        
    }
    

}


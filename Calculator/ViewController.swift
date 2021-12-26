//
//  ViewController.swift
//  Calculator
//
//  Created by 蕭鈺蒖 on 2021/12/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var decimalPointButton: UIButton!
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
            setCornerRadius(button: numberButtons[i])
        }
        
        for i in 0...6{
            setCornerRadius(button: operateButtons[i])
        }
        
        setCornerRadius(button: decimalPointButton)
        setCornerRadius(button: equalButton)
        
        // Do any additional setup after loading the view.
    }
    
    func setCornerRadius(button: UIButton){
        button.clipsToBounds = true
        button.layer.cornerRadius = button.bounds.height*0.5
    }
    
    
    @IBAction func numberButtonPress(_ sender: UIButton) {
        let inputNumber = sender.tag
        
        if equation.last == "."{
            decimal = true
        }
        
        if textLabel.text == "0"{
            textLabel.text = String(inputNumber)
            equation += String(inputNumber)
        }else{
            textLabel.text! += String(inputNumber)
            equation += String(inputNumber)
        }
        
       
        
        
    }
    

    @IBAction func operateButtonPress(_ sender: UIButton) {
        let origText = textLabel.text
        textLabel.text  = ""
        
        print(equation)
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
            
            equation = ""
        
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
            
            equation +=  "*-1"
            
        // %
        case 2:
            equation += "/100"
            
            if let origText = origText {
                var outputText = origText
                if origText.contains("."){
                    let decimalIndex = origText.firstIndex(of: ".")
                    outputText.remove(at: decimalIndex!)
                    outputText.insert(".", at: origText.index(decimalIndex!, offsetBy: -2))
                }else{
                    outputText.insert(".", at: origText.index(origText.endIndex, offsetBy: -2))
                }
                
                textLabel.text = outputText
            }
            
        
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
       
        default:
            textLabel.text = "Warning!!!"
            break
        }
        
        decimal = false
        
        
    }
    
    
    
    @IBAction func pressDecimalPoint(_ sender: UIButton) {
        equation += "."
        textLabel.text! += "."
        decimal = true
        
    }
    
    
    
    
    @IBAction func pressEqualButton(_ sender: UIButton) {
        
        if decimal == false{
            equation += ".0"
        }
        
        let expression = NSExpression(format: equation)
        output = expression.expressionValue(with: nil, context: nil) as! Double
        textLabel.text = String(output)
        print(equation)
        equation = String(output)
        decimal = true
    }
    
}


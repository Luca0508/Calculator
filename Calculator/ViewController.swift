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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "uBitch"
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
        textLabel.text = String(sender.tag)
    }
    

}


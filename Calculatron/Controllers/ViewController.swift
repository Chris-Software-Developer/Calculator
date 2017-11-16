//
//  ViewController.swift
//  Calculatron
//
//  Created by Christopher Smith on 11/15/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    
    var value1: Double
    var value2: Double
    
    // MARK: IBOutlets
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func numberPushed(_ sender: UIButton) {
        
        let number = sender.tag
        
        resultsLabel.text = resultsLabel.text! + String(number)
        }
    
    @IBAction func operatorPushed(_ sender: UIButton) {
        
        self.operate(sender)
        }
    
    // MARK: - Convenience Methods
    
    func operate(_ sender: UIButton) {
        
        if sender.currentTitle == "+" {
            self.resultsLabel.text = String(value1 + value2)
        }
            
        else if sender.currentTitle == "-" {
            self.resultsLabel.text = String (value1 - value2)
        }
            
        else if sender.currentTitle == "*" {
            self.resultsLabel.text = String (value1 * value2)
        }
            
        else if sender.currentTitle == "÷" {
            self.resultsLabel.text = String (value1 / value2)
        }
            
        else {
            return
        }
    }
}

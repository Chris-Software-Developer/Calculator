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
    
    /// Stores the value to be operated on.
    var value1: Double?
    
    /// The last operator that was selected.
    var currentlySelectedOperator: String?
    
    var operatorJustPressed = false
    
    // MARK: IBOutlets
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func percentageButton(_ sender: UIButton) {
        
        guard
            let valueString = self.resultsLabel.text,
            let value = Double(valueString) else {
                self.resultsLabel.text = "Error"
                return
        }
        
        let result = value * 0.01
        self.resultsLabel.text = String(result)
    }
    
    @IBAction func positiveNegativeButtonPressed(_ sender: UIButton) {
        
        guard
            let valueString = self.resultsLabel.text,
            let value = Double(valueString) else {
                self.resultsLabel.text = "Error"
                return
        }
        
        let result = value * -1
        self.resultsLabel.text = result.isWholeNumber ? "\(Int(result))" : "\(result)"
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        if self.operatorJustPressed {
            self.resultsLabel.text = ""
            self.operatorJustPressed = false
        }
        
        if let numberString = sender.titleLabel?.text {
            self.resultsLabel.text = resultsLabel.text! + numberString
        }
    }
    
    @IBAction func operatorPushed(_ sender: UIButton) {
        
        if let operatorString = sender.titleLabel?.text {
            self.handleOperation(operatorString)
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        self.value1 = nil
        self.resultsLabel.text = ""
        self.currentlySelectedOperator = nil
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        self.resultsLabel.numberOfLines = 1
        self.resultsLabel.minimumScaleFactor = 0.3
        self.resultsLabel.adjustsFontSizeToFitWidth = true
    }
    
    // MARK: - Convenience Methods
    
    func handleOperation(_ operation: String) {
        
        self.operatorJustPressed = true
        
        // Get the basic values you need.
        
        guard
            let labelText = self.resultsLabel.text,
            let value = Double(labelText) else {
                fatalError("Something went wrong while trying to retrieve these values. See if any of these are not being set correctly.")
        }
        
        // Check if it's time to operate, or time to store.
        
        if self.currentlySelectedOperator == nil && self.value1 == nil {
            
            // This is the first operation selected. Store the relevant values.
            
            self.value1 = value
            self.currentlySelectedOperator = operation
            
            // And get out of here so we can get the second value.
            
            return
            
        } else {
            
            guard
                let value1 = self.value1,
                let value2String = self.resultsLabel.text,
                let value2 = Double(value2String),
                let previouslySelectedOperator = self.currentlySelectedOperator else {
                    fatalError("Could not get values. Check to see if these are being accessed correctly.")
            }
            
            //  value1 is available, time to operate
            
            var result: Double?
            
            switch previouslySelectedOperator {
                
            case "+":
                result = value1 + value2
                
            case "-":
                result = value1 - value2
                
            case "÷":
                result = value1 / value2
                
            case "×":
                result = value1 * value2
                
            default:
                break
            }
            
            if let result = result {
                self.value1 = result
                self.resultsLabel.text = result.isWholeNumber ? "\(Int(result))" : "\(result)"
            }
            
            if operation == "=" {
                self.currentlySelectedOperator = nil
                self.value1 = nil
                
            } else {
                self.currentlySelectedOperator = operation
            }
        }
    }
}

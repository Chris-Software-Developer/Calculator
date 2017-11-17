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

    // MARK: - Convenience Methods

    func handleOperation(_ operation: String) {

        self.operatorJustPressed = true

        // Get the basic values you need.

        guard
            let labelText = self.resultsLabel.text,
            let value = Double(labelText) else {
                fatalError("Something went wrong while trying to retrieve these values. See if any of these aren't beeing set correctly.")
        }

        // Check if it's time to operate, or time to store.

        if self.currentlySelectedOperator == nil && self.value1 == nil {

            // This is the first operation selected. Store the relevant values.

            self.value1 = value
            self.currentlySelectedOperator = operation

            // Clear the label for the next value.

            self.resultsLabel.text = ""

            // And get out of here so we can get the second value.

            return

        } else {

            guard
                let value1 = self.value1,
                let value2String = self.resultsLabel.text,
                let value2 = Double(value2String) else {
                    fatalError("Couldn't get values. Check to see if these are being accessed correctly.")
            }

            //  value1 is available, time to operate

            switch operation {

            case "+":
                let result = value1 + value2
                self.value1 = result
                self.resultsLabel.text = "\(result)"

            case "-":
                break // This is only needed because nothing is happening here.


            case "/":
                break // This is only needed because nothing is happening here.

            case "*":
                break // This is only needed because nothing is happening here.

            default:
                break
            }
        }
    }
}

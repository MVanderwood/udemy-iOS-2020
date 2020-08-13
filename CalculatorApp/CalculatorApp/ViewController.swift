//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Michael Vanderwood on 8/13/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel?

    var isFirstDigit = true

    var currentValue: Double = 0
    var currentOperation     = "="

    var displayValue: Double {
        get {
            guard
                let displayText = displayLabel?.text,
                let displayValue = NumberFormatter().number(from: displayText)
            else { return 666.0 }
            return displayValue.doubleValue
        }
        set {
            displayLabel?.text = String(format: "%4.0f", newValue)
            isFirstDigit = true
            currentOperation = "="
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func digitButtonPressed(_ sender: UIButton) {
        guard
            let digit = sender.currentTitle,
            let text = displayLabel?.text
        else { return }

        displayLabel?.text = isFirstDigit ? digit : text + digit
        isFirstDigit = false
    }

    @IBAction func clearButtonPressed(_ sender: UIButton) {
        displayLabel?.text = ""
    }

    @IBAction func operationButtonPressed(_ sender: UIButton) {
        guard let operation = sender.currentTitle else { return }

        currentOperation = operation
        currentValue     = displayValue
        isFirstDigit     = true
    }

    @IBAction func equalsButtonPressed(_sender: UIButton) {
        switch currentOperation {
        case "+":
            displayValue += currentValue
        case "-":
            displayValue = currentValue - displayValue
        case "*":
            displayValue *= currentValue
        case "/":
            displayValue = currentValue / displayValue
        default:
            break
        }
    }
}


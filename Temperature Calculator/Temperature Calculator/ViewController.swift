//
//  ViewController.swift
//  Temperature Calculator
//
//  Created by Michael Vanderwood on 8/13/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputLabel: UILabel?
    @IBOutlet weak var inputTextField: UITextField?

    @IBOutlet weak var thermometerDisplayImageView: UIImageView?
    @IBOutlet weak var resultLabel: UILabel?
    @IBOutlet weak var conversionToggleControl: UISegmentedControl?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func inputTextFieldDidEndOnExit(_ sender: UITextField) {
        resignFirstResponder()
        inputTextField?.text = ""

        guard let text = sender.text, let inputValue = Double(text) else { return }

        var result      : String
        var celsiusValue: Double

        if conversionToggleControl?.selectedSegmentIndex == 0 {
            celsiusValue = (inputValue - 32.0) / 1.8
            result = String(format: "%4.1f° Celsius", celsiusValue)
        } else {
            celsiusValue = inputValue
            result = String(format: "%4.1f° Fahrenheit", inputValue * 1.8 + 32)
        }

        resultLabel?.text = result

        var imageName: String
        if celsiusValue > 120.0     { imageName = "Temp9" }
        else if celsiusValue > 100  { imageName = "Temp8" }
        else if celsiusValue > 80   { imageName = "Temp7" }
        else if celsiusValue > 60   { imageName = "Temp6" }
        else if celsiusValue > 40   { imageName = "Temp5" }
        else if celsiusValue > 20   { imageName = "Temp4" }
        else if celsiusValue > 0    { imageName = "Temp3" }
        else if celsiusValue > -20  { imageName = "Temp2" }
        else                        { imageName = "Temp1" }

        thermometerDisplayImageView?.image = UIImage(named: imageName)
    }

    @IBAction func conversionToggleControlToggled(_ sender: UISegmentedControl) {
        inputTextField?.text = ""

        if sender.selectedSegmentIndex == 0 {
            inputLabel?.text = "Enter Fahrenheit"
            resultLabel?.text = "0 Celsius"
        } else {
            inputLabel?.text = "Enter Celsius"
            resultLabel?.text = "0 Fahrenheit"
        }
    }
}


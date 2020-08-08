//
//  ViewController.swift
//  EnablingObjects
//
//  Created by Michael Vanderwood on 8/8/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonControl: UIButton?
    @IBOutlet weak var segmentedControl: UISegmentedControl?
    @IBOutlet weak var switchControl: UISwitch?
    @IBOutlet weak var sliderControl: UISlider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func enableButtonPressed(_ sender: Any) {
        buttonControl?.isEnabled = true
        segmentedControl?.isEnabled = true
        switchControl?.isEnabled = true
        sliderControl?.isEnabled = true
    }
    
    @IBAction func disableButtonPressed(_ sender: Any) {
        buttonControl?.isEnabled = false
        segmentedControl?.isEnabled = false
        switchControl?.isEnabled = false
        sliderControl?.isEnabled = false
    }
}


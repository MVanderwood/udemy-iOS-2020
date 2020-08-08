//
//  ViewController.swift
//  HidingObjects
//
//  Created by Michael Vanderwood on 8/8/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton?
    @IBOutlet weak var segmentedControl: UISegmentedControl?
    @IBOutlet weak var uiSwitch: UISwitch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hideButtonPressed(_ sender: UIButton) {
        button?.isHidden           = true
        segmentedControl?.isHidden = true
        uiSwitch?.isHidden         = true
    }

    @IBAction func revealButtonPressed(_ sender: UIButton) {
        button?.isHidden           = false
        segmentedControl?.isHidden = false
        uiSwitch?.isHidden         = false
    }
}


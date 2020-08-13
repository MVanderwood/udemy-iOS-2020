//
//  ViewController.swift
//  UISegmentedControls
//
//  Created by Michael Vanderwood on 8/13/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?
    @IBOutlet weak var segmentedControl: UISegmentedControl?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let control = segmentedControl {
            segmentedControlValueChanged(control)
        }
    }

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        var valueText: String
        switch sender.selectedSegmentIndex {
        case 0:
            valueText = "1"
        case 1:
            valueText = "2"
        case 2:
            valueText = "3"
        case 3:
            valueText = "4"
        default:
            return
        }
        label?.text = "Segment \(valueText) is selected"
    }

}


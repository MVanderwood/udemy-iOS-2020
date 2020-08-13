//
//  ViewController.swift
//  UISwitches
//
//  Created by Michael Vanderwood on 8/13/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?
    @IBOutlet weak var contentQueryLabel: UILabel?
    @IBOutlet weak var switchControl: UISwitch?

    override func viewDidLoad() {
        super.viewDidLoad()

        switchValueChanged(UISwitch())
    }

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        guard let control = switchControl else { return }
        if control.isOn {
            label?.text = "The switch is on"
        } else {
            label?.text = "The switch is off"
        }
    }

    @IBAction func onQueryButtonPressed(_ sender: Any) {
        guard let control = switchControl else { return }
        if control.isOn {
            contentQueryLabel?.text = "Content is available"
        } else {
            contentQueryLabel?.text = "Content is unavailable"
        }
    }
}


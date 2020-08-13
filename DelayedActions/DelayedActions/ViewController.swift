//
//  ViewController.swift
//  DelayedActions
//
//  Created by Michael Vanderwood on 8/13/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(delay), userInfo: nil, repeats: false)
    }

    @objc func delay() {
        label?.text = "hello"
    }
}


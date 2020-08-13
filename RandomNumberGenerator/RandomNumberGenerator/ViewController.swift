//
//  ViewController.swift
//  RandomNumberGenerator
//
//  Created by Michael Vanderwood on 8/12/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func generateRandomNumberButtonPressed(_ sender: UIButton) {
        label?.text = "\(Int.random(in: 1...1_000))"
    }
}

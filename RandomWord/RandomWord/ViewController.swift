//
//  ViewController.swift
//  RandomWord
//
//  Created by Michael Vanderwood on 8/12/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func randomWordButtonPressed(_ sender: UIButton) {
        let array = ["Apple", "Banana", "Pear", "Grape", "Orange", "Strawberry", "Peach"]
        label?.text = array.randomElement()
    }

}


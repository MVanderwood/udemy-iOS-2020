//
//  ViewController.swift
//  newApp
//
//  Created by Michael Vanderwood on 8/4/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Label?.text = "yo i wonder if this text might change"
    }

    @IBAction func buttonPressed(_ sender: Any) {
        Label?.text = "text go changed, bro"
    }
}

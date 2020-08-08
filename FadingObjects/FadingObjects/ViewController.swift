//
//  ViewController.swift
//  FadingObjects
//
//  Created by Michael Vanderwood on 8/8/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?
    @IBOutlet weak var button: UIButton?
    @IBOutlet weak var segmentedControl: UISegmentedControl?
    @IBOutlet weak var textView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fadeIn(_sender: UIButton) {
        UIView.animate(withDuration: 0.6) {
            self.label?.alpha            = 1.0
            self.button?.alpha           = 1.0
            self.segmentedControl?.alpha = 1.0
            self.textView?.alpha         = 1.0
        }
    }

    @IBAction func fadeOut(_sender: UIButton) {
        UIView.animate(withDuration: 0.6) {
            self.label?.alpha            = 0.0
            self.button?.alpha           = 0.0
            self.segmentedControl?.alpha = 0.0
            self.textView?.alpha         = 0.0
        }
    }
}

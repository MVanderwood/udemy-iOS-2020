//
//  ViewController.swift
//  UISliders
//
//  Created by Michael Vanderwood on 8/13/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textSizeLabel: UILabel?
    @IBOutlet weak var alphaTextView: UITextView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func textSizeSliderValueChanged(_ sender: UISlider) {
        textSizeLabel?.font = UIFont(name: "Futura", size: CGFloat(sender.value))
    }

    @IBAction func alphaSliderValueChanged(_ sender: UISlider) {
        alphaTextView?.alpha = CGFloat(sender.value)
    }
}

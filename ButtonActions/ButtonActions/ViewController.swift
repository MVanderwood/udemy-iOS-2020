//
//  ViewController.swift
//  ButtonActions
//
//  Created by Michael Vanderwood on 8/13/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonPressed(UIButton())
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        triggerAction()
    }

    func triggerAction() {
        label?.text = "Yo Yo Yo"
    }
}

//
//  RedViewController.swift
//  SwitchingViews
//
//  Created by Michael Vanderwood on 8/19/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func homeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

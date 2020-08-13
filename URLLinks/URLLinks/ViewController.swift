//
//  ViewController.swift
//  URLLinks
//
//  Created by Michael Vanderwood on 8/13/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if let url = URL(string: "https://www.apple.com") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}


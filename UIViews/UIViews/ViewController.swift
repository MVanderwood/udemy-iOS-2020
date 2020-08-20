//
//  ViewController.swift
//  UIViews
//
//  Created by Michael Vanderwood on 8/19/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var uIView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        uIView?.isHidden = true
    }
    @IBAction func showViewButtonPressed(_ sender: UIButton) {
        uIView?.isHidden = false
    }
    @IBAction func hideViewButtonPressed(_ sender: UIButton) {
        uIView?.isHidden = true
    }
}

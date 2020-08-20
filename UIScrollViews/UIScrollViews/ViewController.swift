//
//  ViewController.swift
//  UIScrollViews
//
//  Created by Michael Vanderwood on 8/19/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView?.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 300, right: 0)
    }
}

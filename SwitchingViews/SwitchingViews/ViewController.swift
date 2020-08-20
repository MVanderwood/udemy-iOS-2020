//
//  ViewController.swift
//  SwitchingViews
//
//  Created by Michael Vanderwood on 8/19/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func switchToBlueViewControllerButtonpressed(_ sender: UIButton) {
        let newView = BlueViewController(nibName: "BlueViewController", bundle: nil)

        newView.modalTransitionStyle = .crossDissolve
        present(newView, animated: true)
    }
}


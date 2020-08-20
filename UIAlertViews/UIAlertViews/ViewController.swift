//
//  ViewController.swift
//  UIAlertViews
//
//  Created by Michael Vanderwood on 8/19/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlertButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)

        let dismissButton = UIAlertAction(title: "Dismiss", style: .cancel) { alertAction in
            self.label?.text = "Hello!"
        }

        alert.addAction(UIAlertAction(title: "Action", style: .default) { _ in
            self.label?.text = "Hello!"
        })
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))

        present(alert, animated: true)
    }
}


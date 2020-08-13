//
//  ViewController.swift
//  FactBank
//
//  Created by Michael Vanderwood on 8/12/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var factBankLabel: UILabel?
    let paragraphs    = ["""
                         You burn more calories sleeping than you do watching TV.
                         """,
                         """
                         A single cloud can weigh more than a million pounds.
                         """,
                         """
                         The average person walks the equivilent of three times around the world in their lifetime.
                         """,
                         """
                         If you believe you are truly one in a million, there are still more than 7,184 people just like you
                         """,
                         """
                         A sneeze travels about 100 miles per hour
                         """]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func brainButtonPressed(_ sender: UIButton) {
        var paragraph = paragraphs.randomElement()

        while paragraph == factBankLabel?.text {
            paragraph = paragraphs.randomElement()
        }

        factBankLabel?.text = paragraph
    }
}

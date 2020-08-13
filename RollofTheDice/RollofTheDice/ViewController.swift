//
//  ViewController.swift
//  RollofTheDice
//
//  Created by Michael Vanderwood on 8/12/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var diceResultImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let result = Int.random(in: 1...6)

        titleLabel?.text       = "You rolled a \(result)!"
        diceResultImage?.image = UIImage(named: "Dice\(result)")
    }
}

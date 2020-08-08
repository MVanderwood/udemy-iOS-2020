//
//  ViewController.swift
//  Timers
//
//  Created by Michael Vanderwood on 8/8/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel?

    var timer   = Timer()
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timerLabel?.text = String(format: "%.2f", counter)
    }

    @IBAction func startTimerButtonPressed(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        counter += 0.01
        timerLabel?.text = String(format: "%.2f", counter)
    }
    
    @IBAction func pauseTimerButtonPressed(_ sender: UIButton) {
        timer.invalidate()
    }

    @IBAction func restartTimerButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        counter = 0.0
        timerLabel?.text = String(format: "%.2f", counter)
    }
}


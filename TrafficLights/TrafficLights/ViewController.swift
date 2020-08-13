//
//  ViewController.swift
//  TrafficLights
//
//  Created by Michael Vanderwood on 8/8/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK:- @IBOutlets
    @IBOutlet weak var trafficLightImage: UIImageView?
    @IBOutlet weak var scoreLabel: UILabel?
    @IBOutlet weak var startStopButton: UIButton?

    // MARK:- State Control Properties
    var startTimer = Timer()
    var scoreTimer = Timer()

    var startTimerCount = 0
    var scoreCount      = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK:- @IBActions
    @IBAction func startStopButtonPressed(_ sender: UIButton) {
        if scoreCount == 0 {
            scoreLabel?.text = "0"
            trafficLightImage?.image = UIImage(named: "trafficLight")

            startTimerCount = 3
            startTimer      = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateStartTimer), userInfo: nil, repeats: true)

            startStopButton?.isEnabled = false
            startStopButton?.setTitle("", for: .normal)
        } else {
            scoreTimer.invalidate()
            scoreCount = 0
            startStopButton?.setTitle("Restart", for: .normal)
        }
    }

    // MARK:- Objective-C Interface
    @objc func updateStartTimer() {
        startTimerCount -= 1

        if startTimerCount == 2 {
            trafficLightImage?.image = UIImage(named: "trafficLight3")
        } else if startTimerCount == 1 {
            trafficLightImage?.image = UIImage(named: "trafficLight2")
        } else if startTimerCount == 0 {
            trafficLightImage?.image = UIImage(named: "trafficLight1")
            startTimer.invalidate()
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.00001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
            startStopButton?.isEnabled = true
            startStopButton?.setTitle("STOP!!", for: .normal)
        }
    }

    @objc func updateScoreTimer() {
        scoreCount += 1
        scoreLabel?.text = "\(scoreCount)"
    }
}


//
//  ViewController.swift
//  Simon Says
//
//  Created by Michael Vanderwood on 8/14/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var scoreLabel: UILabel?
    @IBOutlet weak var simonSaysLabel: UILabel?
    @IBOutlet weak var startGameButton: UIButton?

    let instructions = ["swipe right", "swipe left", "swipe up", "swipe down"]

    var gameTimer  = Timer()
    var simonTimer = Timer()

    var timeRemainingCount = 30 {
        didSet {
            timeLabel?.text = "Time: \(timeRemainingCount)"

            if timeRemainingCount == 0 {
                gameTimer.invalidate()
                gameStarted = false
            }
        }
    }
    
    var scoreCount = 0 {
        didSet {
            scoreLabel?.text = "Score: \(scoreCount)"
        }
    }

    var gameStarted = false {
        didSet {
            if gameStarted {
                startGameButton?.isEnabled = false
                startGameButton?.alpha = 0.4
                startGameButton?.setTitle("", for: .normal)
            } else {
                startGameButton?.isEnabled = true
                startGameButton?.alpha = 1.0
                startGameButton?.setTitle("Restart", for: .normal)
            }
        }
    }

    var gameNotStarted: Bool { !gameStarted }

    override func viewDidLoad() {
        super.viewDidLoad()
        simonSaysLabel?.layer.cornerRadius = 50

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
    }

    @IBAction func startGameButtonPressed(_ sender: UIButton) {
        if gameNotStarted {
            gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementGameTimer), userInfo: nil, repeats: true)

            gameStarted = true
            simonSays()
        }
    }

    @objc func decrementGameTimer() {
        timeRemainingCount -= 1
    }

    @objc func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        guard gameStarted else { return }

        switch sender.direction {
        case .right:
            if simonSaysLabel?.text == "Simon says swipe right" {
                scoreCount += 1
            } else {
                scoreCount -= 1
            }
        case .left:
            if simonSaysLabel?.text == "Simon says swipe left" {
                scoreCount += 1
            } else {
                scoreCount -= 1
            }
        case .up:
            if simonSaysLabel?.text == "Simon says swipe up" {
                scoreCount += 1
            } else {
                scoreCount -= 1
            }
        case .down:
            if simonSaysLabel?.text == "Simon says swipe down" {
                scoreCount += 1
            } else {
                scoreCount -= 1
            }
        default:
            return // triggering new timer
        }
        simonTimer.invalidate()
        simonSays()
    }

    @objc func simonSays() {
        guard gameStarted, var instruction = instructions.randomElement() else { return }

        if let simonSaysChance = (1...10).randomElement(), simonSaysChance > 4 {
            instruction = "Simon says " + instruction
        }

        simonSaysLabel?.text = instruction
        simonTimer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(simonSays), userInfo: nil, repeats: false)
    }
}

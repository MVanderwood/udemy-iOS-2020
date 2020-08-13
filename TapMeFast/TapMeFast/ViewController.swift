//
//  ViewController.swift
//  TapMeFast
//
//  Created by Michael Vanderwood on 8/9/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK:- State Enumerations
    enum GameState: Int {
        case notStarted
        case started
        case postGameDelay
        case readyForRestart
    }

    // MARK:- IBActions
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var scoreLabel: UILabel?
    @IBOutlet weak var actionButton: UIButton?

    // MARK:- State Control Variables
    var timer = Timer()
    var timeCounter = 10 {
        didSet {
            if timeCounter == 0 {
                timer.invalidate()
            }
        }
    }

    var scoreCounter = 0

    var gameState: GameState = .notStarted {
        didSet {
            switch gameState {
            case .notStarted:
                actionButton?.setTitle("Start", for: .normal)
            case .started:
                actionButton?.setTitle("Tap", for: .normal)
            case .postGameDelay:
                timer.invalidate()
                actionButton?.setTitle("", for: .normal)
                actionButton?.isEnabled = false
                actionButton?.alpha     = 0.5
            case.readyForRestart:
                actionButton?.setTitle("Restart", for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK:- IBActions
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        switch gameState {
        case .notStarted, .readyForRestart:
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateGame), userInfo: nil, repeats: true)

            actionButton?.isEnabled = false
            actionButton?.alpha     = 0.5

            gameState = .started
        case .started:
            scoreCounter += 1
            scoreLabel?.text = "\(scoreCounter)"
        case .postGameDelay:
            actionButton?.setTitle("", for: .normal)
        }

        } else {
            timeCounter = 10
            scoreCounter = 0

            timeLabel?.text = "\(timeCounter)"
            scoreLabel?.text = "\(scoreCounter)"
        }
    }

    // MARK:- Objective-C Interface
    @objc func updateGame() {
        timeCounter -= 1
        timeLabel?.text = "\(timeCounter)"

        actionButton?.isEnabled = true
        actionButton?.alpha     = 1.0

        actionButton?.setTitle("Tap", for: .normal)

        gameState = 1

        if timeCounter == 0 {
            timer.invalidate()

            actionButton?.isEnabled = false
            actionButton?.alpha = 0.5
            actionButton?.setTitle("Restart", for: .normal)
        }
    }

    @objc func restartGame() {
        gameState = 0
        actionButton?.isEnabled = true
        actionButton?.alpha = 1.0
    }
}

//
//  ViewController.swift
//  ShakeMeSilly
//
//  Created by Michael Vanderwood on 8/14/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var timeRemainingLabel: UILabel?
    @IBOutlet weak var faceImageView: UIImageView?
    @IBOutlet weak var scoreLabel: UILabel?
    @IBOutlet weak var startGameButton: UIButton?

    // MARK: State Control
    var timer     = Timer()
    var timeCount = 10 {
        didSet {
            if timeCount == 0 {
                timer.invalidate()
                gameStarted = false
            }
        }
    }

    var scoreCount = 0
    var imageId    = 1 {
        didSet {
            if imageId > 12 {
                imageId = 1
            }
        }
    }

    var gameStarted = false {
        didSet {
            if gameStarted {
                startGameButton?.isEnabled = false
                startGameButton?.alpha     = 0.4
                startGameButton?.setTitle("Shake me!", for: .normal)
            } else {
                startGameButton?.isEnabled = true
                startGameButton?.alpha     = 1.0
                startGameButton?.setTitle("Restart", for: .normal)
            }
        }
    }
    var gameNotStarted: Bool { !gameStarted }

    /* MARK:- ViewController Lifecycle*/
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func becomeFirstResponder() -> Bool {
        return true
    }

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if gameStarted, motion == .motionShake {
            scoreCount += 1
            scoreLabel?.text = "\(scoreCount)"

            imageId += 1

            faceImageView?.image = UIImage(named: "Face\(imageId)")
        }
    }

    /* MARK:- IBActions */
    @IBAction func startGameButtonPressed(_ sender: Any) {
        if gameNotStarted {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementCounter), userInfo: nil, repeats: true)
            scoreCount = 0
            scoreLabel?.text = "0"
            gameStarted = true
        }
    }

    /* MARK:- Objective-C Interface */
    @objc func decrementCounter() {
        timeCount -= 1
        timeRemainingLabel?.text = "\(timeCount)"
    }
}

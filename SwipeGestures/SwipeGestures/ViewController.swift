//
//  ViewController.swift
//  SwipeGestures
//
//  Created by Michael Vanderwood on 8/14/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

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

    @objc func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .up:
            label?.text = "swiped up!"
        case .right:
            label?.text = "swiped right!"
        case .left:
            label?.text = "swiped left!"
        case .down:
            label?.text = "swiped down!"
        default:
            break
        }
    }
}


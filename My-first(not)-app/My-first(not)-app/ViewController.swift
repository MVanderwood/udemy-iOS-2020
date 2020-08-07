//
//  ViewController.swift
//  My-first(not)-app
//
//  Created by Michael Vanderwood on 8/4/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton?
    @IBOutlet weak var label : UILabel?

    var catSound: AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        button?.imageView?.contentMode = .scaleAspectFit

        label?.isHidden = true

        let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        do {
            guard let file = soundFile else { throw URLError(URLError.Code(rawValue: 422)) }
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: file))
        } catch {
            print(error)
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        label?.isHidden = false
        catSound.play()

        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
    }

    @objc func hideLabel() {
        label?.isHidden = true
    }
}


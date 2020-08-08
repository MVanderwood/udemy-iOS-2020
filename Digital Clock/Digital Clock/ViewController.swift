//
//  ViewController.swift
//  Digital Clock
//
//  Created by Michael Vanderwood on 8/8/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var settingsView: UIView?
    @IBOutlet weak var toggleSettingsButton: UIButton?
    @IBOutlet weak var backgroundImageView: UIImageView?
 
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsView?.isHidden = true
        settingsView?.layer.cornerRadius = 10
        toggleSettingsButton?.layer.cornerRadius = 10

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        updateTimer()
    }

    @objc func updateTimer() {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .medium
        timeLabel?.text = timeFormatter.string(from: NSDate() as Date)
    }

    @IBAction func toggleSettingsButtonPressed(_ sender: UIButton) {
        guard let settingsView = settingsView else { return }

        settingsView.isHidden.toggle()
        toggleSettingsButton?.setTitle(settingsView.isHidden ? "Show Settings" : "Hide Settings", for: .normal)
        toggleSettingsButton?.alpha = settingsView.isHidden ? 0.25 : 1.0
    }
    @IBAction func changeClockColorSegmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0: timeLabel?.textColor = .white
            case 1: timeLabel?.textColor = .black
            case 2: timeLabel?.textColor = .red
            case 3: timeLabel?.textColor = .green
            default: break
        }
    }
    @IBAction func changeBackgroundColorSegmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0: view.backgroundColor = .black
            case 1: view.backgroundColor = .white
            case 2: view.backgroundColor = .yellow
            case 3: view.backgroundColor = .blue
            default: break
        }

        backgroundImageView?.image = nil
        
    }
    @IBAction func changeBackgroundImageSegmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0    : backgroundImageView?.image = nil
            case 1...4: backgroundImageView?.image = UIImage(named: "Background\(sender.selectedSegmentIndex)")
            default   : break
        }
    }
}

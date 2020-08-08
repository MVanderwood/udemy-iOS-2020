//
//  ViewController.swift
//  TimeAndDate
//
//  Created by Michael Vanderwood on 8/8/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?

    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

        updateTimer()
    }

    @objc func updateTimer() {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .full
        timeLabel?.text = timeFormatter.string(from: NSDate() as Date)

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateLabel?.text = dateFormatter.string(from: NSDate() as Date)
    }
}

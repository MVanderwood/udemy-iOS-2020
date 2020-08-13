//
//  ViewController.swift
//  CarStats
//
//  Created by Michael Vanderwood on 8/12/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var carImageView: UIImageView?
    @IBOutlet weak var carTitleLabel: UILabel?
    @IBOutlet weak var carBHPLabel: UILabel?
    @IBOutlet weak var carAccelerationLabel: UILabel?
    @IBOutlet weak var carTopSpeedLabel: UILabel?
    @IBOutlet weak var carMPGLabel: UILabel?
    @IBOutlet weak var carPriceLabel: UILabel?

    var items = [[String: Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        items = loadPlist()

        getRandomCarButtonPressed(UIButton())
    }

    func loadPlist() -> [[String: Any]] {
        guard
            let path = Bundle.main.path(forResource: "Car List", ofType: "plist"),
            let list = NSArray.init(contentsOf: URL.init(fileURLWithPath: path)) as? [[String : Any]]
        else { return [[String: Any]]() }

        return list
    }

    @IBAction func getRandomCarButtonPressed(_ sender: UIButton) {
        guard let dataSelect = items.randomElement() else { return }

        if let imageName = dataSelect["Image"] as? String {
            carImageView?.image = UIImage.init(named: imageName)
        }
        if let carName = dataSelect["Name"] as? String {
            carTitleLabel?.text = carName
        }
        if let carBHP = dataSelect["BHP"] as? Int {
            carBHPLabel?.text = "\(carBHP) BHP"
        }
        if let carAcceleration = dataSelect["Acceleration"] as? CGFloat {
            carAccelerationLabel?.text = "Zero to Sixty in \(carAcceleration) seconds"
        }
        if let carTopSpeed = dataSelect["Top Speed"] as? Int {
            carTopSpeedLabel?.text = "\(carTopSpeed) MPH Top Speed"
        }
        if let carMPG = dataSelect["MPG"] as? Int {
            carMPGLabel?.text = "\(carMPG) miles per gallon"
        }
        if let carPrice = dataSelect["Price"] as? Int {
            carPriceLabel?.text = "Starts at €\(carPrice)"
        }
    }
}


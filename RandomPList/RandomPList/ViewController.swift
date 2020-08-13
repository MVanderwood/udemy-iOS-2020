//
//  ViewController.swift
//  RandomPList
//
//  Created by Michael Vanderwood on 8/12/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func randomImageButtonPressed(_ sender: UIButton) {
        guard
            let path = Bundle.main.path(forResource: "ImageList", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path),
            let data = dict.object(forKey: "Images") as? [String],
            let imageName = data.randomElement()
        else { return }

        imageView?.image = UIImage(named: imageName)
    }
}

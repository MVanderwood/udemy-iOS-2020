//
//  ViewController.swift
//  UIDatePickerViews
//
//  Created by Michael Vanderwood on 8/20/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?
    @IBOutlet weak var datePicker: UIDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let picker = datePicker {
            datePickerValueWasChanged(picker)
        }
    }

    @IBAction func datePickerValueWasChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy HH:mm:ss a"

        label?.text = dateFormatter.string(from: sender.date)
    }
}

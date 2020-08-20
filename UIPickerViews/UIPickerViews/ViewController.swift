//
//  ViewController.swift
//  UIPickerViews
//
//  Created by Michael Vanderwood on 8/19/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?
    @IBOutlet weak var pickerView: UIPickerView?

    var pickerItems = ["Apple", "Banana", "Orange", "Strawberry", "Watermelon", "Pear", "Tangerine", "Lime", "Dragonfruit", "Grapes", "Lemon"]

    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView?.delegate   = self
        pickerView?.dataSource = self
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerItems.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerItems[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label?.text = pickerItems[row]
    }
}

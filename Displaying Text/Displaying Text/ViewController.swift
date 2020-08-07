//
//  ViewController.swift
//  Displaying Text
//
//  Created by Michael Vanderwood on 8/7/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label   : UILabel?
    @IBOutlet weak var textView: UITextView?

    @IBOutlet weak var editableLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        textView?.delegate = self

        label?.text = "Hello"
        textView?.text = """
                         Hello.
                         My name is Mike
                         How are ya?
                         I'm great
                         """
    }

    @IBAction func enterText(_ sender: UITextField) {
        if let text = sender.text {
            editableLabel?.text = text
            sender.text = nil

            self.resignFirstResponder()
        }
    }

    @IBAction func setColorPressed(_ sender: UIButton) {
        editableLabel?.textColor = .red
    }

    @IBAction func setBackgroundPressed(_ sender: UIButton) {
        editableLabel?.backgroundColor = .gray
    }

    @IBAction func setShadowPressed(_ sender: UIButton) {
        editableLabel?.layer.shadowColor   = UIColor.black.cgColor
        editableLabel?.layer.shadowOffset  = CGSize(width: 5, height: 5)
        editableLabel?.layer.shadowRadius  = 5
        editableLabel?.layer.shadowOpacity = 0.45
    }

    @IBAction func setShadowColorPressed(_ sender: UIButton) {
        editableLabel?.layer.shadowColor = UIColor.blue.cgColor
    }

    @IBAction func fontSizePressed(_ sender: UIButton) {
        editableLabel?.font = UIFont(name: "Futura", size: 30.0)
    }

    @IBAction func centerButtonPressed(_ sender: UIButton) {
    }

    @IBAction func leftButtonPressed(_ sender: UIButton) {
    }

    @IBAction func rightButtonPressed(_ sender: UIButton) {
    }

    @IBAction func customFontButtonPressed(_ sender: UIButton) {
        editableLabel?.font = UIFont(name: "CaveatBrush-Regular", size: 30)
    }
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()

            return false
        }

        return true
    }
}

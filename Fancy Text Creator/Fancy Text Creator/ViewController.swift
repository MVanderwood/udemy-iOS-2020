//
//  ViewController.swift
//  Fancy Text Creator
//
//  Created by Michael Vanderwood on 8/7/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Editing Controls
    @IBOutlet weak var EditingLabel: UILabel?
    
    // MARK: Font Colors Buttons
    @IBOutlet weak var blackFontColorButton: UIButton?
    @IBOutlet weak var redFontColorButton  : UIButton?
    @IBOutlet weak var blueFontColorButton : UIButton?
    @IBOutlet weak var greenFontColorButton: UIButton?

    // MARK: Font Family Buttons
    @IBOutlet weak var sugarMillenialFontButton: UIButton?
    @IBOutlet weak var blackswordFontButton    : UIButton?
    @IBOutlet weak var lemonMilkFontButton     : UIButton?
    @IBOutlet weak var moonFlowerFontButton    : UIButton?

    // MARK: State Control Variables
    var fontSize    : CGFloat = 15.0
    var shadowOffset: CGSize  = CGSize(width: 0, height: 0)
    var shadowWeight: Float   = 0.5

    var fontColorAffectedButtons : [UIButton?]?
    var fontFamilyAffectedButtons: [UIButton?]?

    private let shadowControlStarted = false
    private let shadowMovementIncrement: CGFloat = 1.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fontColorAffectedButtons  = [sugarMillenialFontButton, blackswordFontButton, lemonMilkFontButton, moonFlowerFontButton]
        fontFamilyAffectedButtons = [blackFontColorButton, redFontColorButton, blueFontColorButton, greenFontColorButton]
    }

    private func initializeShadowControl() {
        EditingLabel?.layer.shadowColor   = UIColor.black.cgColor
        EditingLabel?.layer.shadowRadius  = 2
        EditingLabel?.layer.shadowOpacity = 0.5
    }

    @IBAction func writingTextFieldDidExit(_ sender: UITextField) {
        EditingLabel?.text = sender.text
        resignFirstResponder()
    }
    
    // MARK: Font Color IBActions
    @IBAction func blackFontButtonPressed(_ sender: UIButton) {
        EditingLabel?.textColor = .black
        fontColorAffectedButtons?.forEach { $0?.setTitleColor(.black, for: .normal) }
    }
    @IBAction func redFontButtonPressed(_ sender: UIButton) {
        EditingLabel?.textColor = .red
        fontColorAffectedButtons?.forEach { $0?.setTitleColor(.red, for: .normal) }
    }
    @IBAction func blueFontButtonPressed(_ sender: UIButton) {
        EditingLabel?.textColor = .blue
        fontColorAffectedButtons?.forEach { $0?.setTitleColor(.blue, for: .normal) }
    }
    @IBAction func greenFontButtonPressed(_ sender: UIButton) {
        EditingLabel?.textColor = .green
        fontColorAffectedButtons?.forEach { $0?.setTitleColor(.green, for: .normal) }
    }
    
    // MARK: Font Family IBActions
    @IBAction func sugarMillenialFontButtonPressed(_ sender: UIButton) {
        let font = UIFont(name: "SugarstyleMillenial-Regular", size: fontSize)

        EditingLabel?.font = font
        fontFamilyAffectedButtons?.forEach { $0?.titleLabel?.font = font?.withSize(30) }
    }
    @IBAction func blackswordFontButtonPressed(_ sender: UIButton) {
        let font = UIFont(name: "Blacksword", size: fontSize)

        EditingLabel?.font = font
        fontFamilyAffectedButtons?.forEach { $0?.titleLabel?.font = font?.withSize(20) }
    }
    @IBAction func lemonMilkFontButtonPressed(_ sender: UIButton) {
        let font = UIFont(name: "LemonMilk", size: fontSize)

        EditingLabel?.font = font
        fontFamilyAffectedButtons?.forEach { $0?.titleLabel?.font = font?.withSize(20) }
    }
    @IBAction func moonFlowerButtonPressed(_ sender: UIButton) {
        let font = UIFont(name: "Moon Flower", size: fontSize)

        EditingLabel?.font = font
        fontFamilyAffectedButtons?.forEach { $0?.titleLabel?.font = font?.withSize(35) }
    }
    
    // MARK: Font Size IBActions
    @IBAction func fontSizeIncreaseButtonPressed(_ sender: UIButton) {
        fontSize += 3
        EditingLabel?.font = EditingLabel?.font.withSize(fontSize)
    }
    @IBAction func fontSizeDecreaseButtonPressed(_ sender: UIButton) {
        fontSize -= 3
        EditingLabel?.font = EditingLabel?.font.withSize(fontSize)
    }
    
    // MARK: Font Shadow Color IBActions
    @IBAction func blackFontShadowButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        EditingLabel?.layer.shadowColor = UIColor.black.cgColor
    }
    @IBAction func redFontShadowButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        EditingLabel?.layer.shadowColor = UIColor.red.cgColor
    }
    @IBAction func blueFontShadowButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        EditingLabel?.layer.shadowColor = UIColor.blue.cgColor
    }
    @IBAction func greenFontShadowButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        EditingLabel?.layer.shadowColor = UIColor.green.cgColor
    }
    
    // MARK: Font Shadow Direction IBActions
    @IBAction func shadowUpLeftButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        shadowOffset.width  -= shadowMovementIncrement
        shadowOffset.height -= shadowMovementIncrement
        EditingLabel?.layer.shadowOffset = shadowOffset
    }
    @IBAction func shadowLeftButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        shadowOffset.width -= shadowMovementIncrement
        EditingLabel?.layer.shadowOffset = shadowOffset
    }
    @IBAction func shadowDownLeftButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        shadowOffset.width  -= shadowMovementIncrement
        shadowOffset.height += shadowMovementIncrement
        EditingLabel?.layer.shadowOffset = shadowOffset
    }

    @IBAction func shadowUpButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        shadowOffset.height -= shadowMovementIncrement
        EditingLabel?.layer.shadowOffset = shadowOffset
    }
    @IBAction func shadowDownButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        shadowOffset.height += shadowMovementIncrement
        EditingLabel?.layer.shadowOffset = shadowOffset
    }

    @IBAction func shadowUpRightButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        shadowOffset.width  += shadowMovementIncrement
        shadowOffset.height -= shadowMovementIncrement
        EditingLabel?.layer.shadowOffset = shadowOffset
    }
    @IBAction func shadowRightButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        shadowOffset.width += shadowMovementIncrement
        EditingLabel?.layer.shadowOffset = shadowOffset
    }
    @IBAction func shadowDownRightButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        shadowOffset.width  += shadowMovementIncrement
        shadowOffset.height += shadowMovementIncrement
        EditingLabel?.layer.shadowOffset = shadowOffset
    }
    
    // MARK: Font Shadow Weight IBActions
    @IBAction func shadowFontWeightUpButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }

        shadowWeight += 0.1
        if shadowWeight > 1.0 { shadowWeight = 1.0 }

        EditingLabel?.layer.shadowOpacity = shadowWeight
    }
    @IBAction func shadowFontWeightDownButtonPressed(_ sender: UIButton) {
        if !shadowControlStarted { initializeShadowControl() }
       
        shadowWeight -= 0.1
        if shadowWeight < 0.0 { shadowWeight = 0.0 }

        EditingLabel?.layer.shadowOpacity = shadowWeight
    }
}


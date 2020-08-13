//
//  ViewController.swift
//  ActionSheets
//
//  Created by Michael Vanderwood on 8/13/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func activateActionSheetButtonPressed(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "Title", message: "This is the message", preferredStyle: .actionSheet)

        actionSheet.addAction(UIAlertAction(title: "Action 1", style: .default) { _ in
            self.label?.text = "Action 1 was pressed"
        })

        actionSheet.addAction(UIAlertAction(title: "Action 2", style: .default) { _ in
            self.label?.text = "Action 2 was pressed"
        })

        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(actionSheet, animated: true)
    }
}

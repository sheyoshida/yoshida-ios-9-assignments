//
//  AgeVerificationViewController.swift
//  assignment_two
//
//  Created by Shena Yoshida on 7/2/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class AgeVerificationViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        messageLabel.text = "" 
    }
    
    // MARK: Private
    private func intValueFrom(textField: UITextField) -> Int? {
        if let text = textField.text {
            return Int(text)
        }
        return nil
    }

    // MARK: Actions
    @IBAction func buttonTapped(sender: UIButton) {
        
        if let age = intValueFrom(ageTextField) {
            let ageMessage = AgeVerification()
            let result = ageMessage.verify(age)
            messageLabel.text = result
        }
        else {
            messageLabel.text = "error"
        }
    }
}

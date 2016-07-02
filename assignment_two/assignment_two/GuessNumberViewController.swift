//
//  GuessNumberViewController.swift
//  assignment_two
//
//  Created by Shena Yoshida on 7/2/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class GuessNumberViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        if let myGuess = intValueFrom(guessTextField) {
            let startGame = GuessNumber()
            let result = startGame.guess(myGuess)
            
            if result == true {
                messageLabel.text = "it's a match!"
            } else {
                messageLabel.text = "nope!"
            }
        }
    }
}
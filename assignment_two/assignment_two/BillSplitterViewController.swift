//
//  BillSplitterViewController.swift
//  assignment_two
//
//  Created by Shena Yoshida on 7/2/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class BillSplitterViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentTextField: UITextField!
    @IBOutlet weak var numberOfPeopleTextField: UITextField!
    @IBOutlet weak var amountTextLabel: UILabel!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Private
    private func floatValueFrom(textField: UITextField) -> Float? {
        if let text = textField.text {
            return Float(text)
        }
        return nil
    }
    
    private func intValueFrom(textField: UITextField) -> Int? {
        if let text = textField.text {
            return Int(text)
        }
        return nil
    }
    
    // MARK: Actions
    @IBAction func buttonTapped(sender: UIBarButtonItem) {
        if
            let amount = floatValueFrom(billAmountTextField),
            let percent = intValueFrom(tipPercentTextField),
            let people = intValueFrom(numberOfPeopleTextField)
        {
            let calculateIt = calculateTip()
            let result = calculateIt.calculate(amount, tipPercent: percent, numberOfPeople: people)
            
            // format string as currency and apply to label
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            amountTextLabel.text = formatter.stringFromNumber(result)
        }
    }
}
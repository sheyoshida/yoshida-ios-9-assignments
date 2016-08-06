//
//  CheckoutViewController.swift
//  register
//
//  Created by Shena Yoshida on 8/1/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    var itemCount: Int?
    var itemTotalPrice: Float?
    var paymentMessage: String = "Don't forget to pay!"
    
    @IBOutlet weak var labelCashMessage: UILabel!
    @IBOutlet weak var textFieldCashGiven: UITextField!
    @IBOutlet weak var labelNumberOfItems: UILabel!
    @IBOutlet weak var labelTotalValue: UILabel!
    @IBOutlet weak var buttonCheckOut: UIButton!
    
    var totalOwed: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let billTotal = itemTotalPrice {
            totalOwed = billTotal
            labelTotalValue.text = "Total price: $" + String(billTotal)
        }
        
        if let shoppingCartCount = itemCount {
            labelNumberOfItems.text = "Number of items: " + String(shoppingCartCount)
            
            if shoppingCartCount == 0 {
                textFieldCashGiven.hidden = true
                labelTotalValue.text = "Please add more items."
                labelCashMessage.hidden = true
                buttonCheckOut.hidden = true
            }
        }
    }
    
    @IBAction func checkoutButtonTapped(sender: AnyObject) {
        calculateChange()
    }
    
    func calculateChange() {
        
        let totalGiven = Float(textFieldCashGiven.text!)
        if totalGiven != nil {
            
            let givenMinusOwed = totalGiven! - totalOwed
            let totalChange = round( givenMinusOwed * 100 ) / 100 // round to two decimal places
            
            if textFieldCashGiven.text == nil {
                paymentMessage = "Don't forget to pay!"
            }
            else if totalGiven < totalOwed {
                paymentMessage = "Not enough $$$"
            }
            else {
                paymentMessage = "Change due: $" + String(totalChange)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailViewController = segue.destinationViewController as? ChangeDueViewController {
            detailViewController.checkoutMessage = paymentMessage
            
        }
        
    }
    
    
}

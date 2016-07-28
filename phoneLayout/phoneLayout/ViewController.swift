//
//  ViewController.swift
//  phoneLayout
//
//  Created by Shena Yoshida on 7/27/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var phoneNumber: String = ""
    var inUse: Bool = false
    
    @IBOutlet weak var labelPhoneNumber: UILabel!
    
    @IBAction func oneButtonTapped(sender: AnyObject) {
        phoneNumber += "1"
        labelPhoneNumber.text = phoneNumber
    }
    
    @IBAction func twoButtonTapped(sender: AnyObject) {
        phoneNumber += "2"
        labelPhoneNumber.text = phoneNumber
    }
    
    @IBAction func threeButtonTapped(sender: AnyObject) {
        phoneNumber += "3"
        labelPhoneNumber.text = phoneNumber
    }
    
    @IBAction func fourButtonTapped(sender: AnyObject) {
        phoneNumber += "4"
        labelPhoneNumber.text = phoneNumber
    }
    
    @IBAction func fiveButtonTapped(sender: AnyObject) {
        phoneNumber += "5"
        labelPhoneNumber.text = phoneNumber
    }
    
    @IBAction func sixButtonTapped(sender: AnyObject) {
        phoneNumber += "6"
        labelPhoneNumber.text = phoneNumber
    }
    
    @IBAction func sevenButtonTapped(sender: AnyObject) {
        phoneNumber += "7"
        labelPhoneNumber.text = phoneNumber
    }
    
    @IBAction func eightButtonTapped(sender: AnyObject) {
        phoneNumber += "8"
        labelPhoneNumber.text = phoneNumber
    }
    
    @IBAction func nineButtonTapped(sender: AnyObject) {
        phoneNumber += "9"
        labelPhoneNumber.text = phoneNumber
    }
    
    @IBAction func numberButtonTapped(sender: AnyObject) {
        phoneNumber += "#"
        labelPhoneNumber.text = phoneNumber
    }
    
    @IBAction func zeroButtonTapped(sender: AnyObject) {
        phoneNumber += "0"
        labelPhoneNumber.text = phoneNumber
    }
    
    @IBAction func starButtonTapped(sender: AnyObject) {
        phoneNumber += "*"
        labelPhoneNumber.text = phoneNumber
    }
    
    @IBAction func callButtonTapped(sender: AnyObject) {
        phoneNumber = ""
        
        if inUse == false {
            inUse = true
            labelPhoneNumber.text = "CALLING"
        } else {
            inUse = false
            labelPhoneNumber.text = "ENDING CALL"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

  


}


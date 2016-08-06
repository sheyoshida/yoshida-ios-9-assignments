//
//  AddItemViewController.swift
//  register
//
//  Created by Shena Yoshida on 8/1/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var textFieldItemName: UITextField!
    @IBOutlet weak var textFieldItemPrice: UITextField!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {

        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
       
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

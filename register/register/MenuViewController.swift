//
//  MenuViewController.swift
//  register
//
//  Created by Shena Yoshida on 8/1/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

protocol AddItemProtocol {
    
}

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cheeseburgerButtonTapped(sender: AnyObject) {
        print("cheeseburger")
    }
    
    @IBAction func pizzaButtonTapped(sender: AnyObject) {
        print("pizza")
    }
    
    @IBAction func lasagnaButtonTapped(sender: AnyObject) {
        print("lasagna")
    }
    
    @IBAction func sundaeButtonTapped(sender: AnyObject) {
        print("sundae")
    }
    
    @IBAction func saladButtonTapped(sender: AnyObject) {
        print("salad")
    }
    
    @IBAction func addItemButtonTapped(sender: AnyObject) {
        print("add item")
    }
    


}

//
//  MenuViewController.swift
//  register
//
//  Created by Shena Yoshida on 8/1/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

protocol AddItemDelegate {
    func userAddedItem(item: Item)
}

class MenuViewController: UIViewController {
    
    var delegate: AddItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cheeseburbuttonTapped(sender: AnyObject) {
        let cheeseburger = Item(name: "cheeseburger", price: 5.99, image: UIImage(named: "cheeseburger")!)
        delegate?.userAddedItem(cheeseburger)
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func pizzaButtonTapped(sender: AnyObject) {
        let pizza = Item(name: "pizza", price: 7.99, image: UIImage(named: "pizza")!)
        delegate?.userAddedItem(pizza)
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    @IBAction func lasagnaButtonTapped(sender: AnyObject) {
        let lasagna = Item(name: "lasagna", price: 5.99, image: UIImage(named: "lasagna")!)
        delegate?.userAddedItem(lasagna)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func sundaeButtonTapped(sender: AnyObject) {
        let sundae = Item(name: "sundae", price: 2.99, image: UIImage(named: "sundae")!)
        delegate?.userAddedItem(sundae)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saladButtonTapped(sender: AnyObject) {
        let salad = Item(name: "salad", price: 1.99, image: UIImage(named: "salad")!)
        delegate?.userAddedItem(salad)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addItemButtonTapped(sender: AnyObject) {

        
    }
    
}



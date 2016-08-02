//
//  ViewController.swift
//  register
//
//  Created by Shena Yoshida on 8/1/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    // MARK: Declaration
    
    var shoppingCart = [Item]()
    

    
    let cellIdentifier = "CellIdentifier"
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let items = [
        Item(name: "Pepperoni Pizza", price: 10.99, image: UIImage(named: "pizza")!),
        Item(name: "Cheeseburger", price: 7.99, image: UIImage(named: "cheeseburger")!),
        Item(name: "Beefy Lasagna", price: 8.99, image: UIImage(named: "lasagna")!),
        Item(name: "Iceburg Salad", price: 4.99, image: UIImage(named: "salad")!),
        Item(name: "Chocolate Sundae", price: 5.99, image: UIImage(named: "sundae")!)
        ]
        
        shoppingCart.appendContentsOf(items)
        
    }
    
    // MARK: Data Source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCart.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let itemChosen = shoppingCart[indexPath.row]
        
        cell.detailTextLabel?.text = "price: $" + String(itemChosen.price)
        cell.textLabel?.text = itemChosen.name
        cell.imageView?.image = itemChosen.image 
        
        
        return cell
    }
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        shoppingCart.removeAll()
        tableView.reloadData()
    }
    

}

